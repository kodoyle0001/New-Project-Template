#!/usr/bin/env python3
"""
check_references.py - Swif7Edge template reference resolver / CI guard.

Scans the initialization spine (create.md, the manifest, every prompts/initialization
module) for references to OTHER init-system files and fails if any referenced
init-system path does not exist on disk.

It deliberately IGNORES references to runtime-DELIVERED artifacts (PROJECT.md, DECISIONS.*,
CLAUDE.md, .claude/**, docs/**, STATUS.md, BACKLOG.md, README.md, report.html, LICENSE...)
because those are created by the initializer at runtime and are correctly absent from the
template source.

Exit 0 = all init-system references resolve. Exit 1 = one or more broken references.
Usage:  python scripts/check_references.py
"""
import os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

INIT_DIR = os.path.join(ROOT, "prompts", "initialization")
SPINE = ["create.md", "prompts/initialization/INITIALIZATION_MANIFEST.md", "BUILD_PATTERN.md"]
if os.path.isdir(INIT_DIR):
    SPINE += [f"prompts/initialization/{n}" for n in os.listdir(INIT_DIR) if n.endswith(".md")]
SPINE = sorted(set(SPINE))

RUNTIME_OK = re.compile(
    r"(^|/)("
    r"PROJECT\.md|DECISIONS\.(md|xlsx)|CLAUDE\.md|STATUS\.md|BACKLOG\.md|README\.md|"
    r"AUTHORITATIVE_ARCHITECTURE\.md|INITIALIZATION_STATUS\.md|INITIALIZATION_RECORD\.md|"
    r"VAULT\.md|SHAREPOINT\.md|SECURITY\.md|DATA-CLASSIFICATION\.md|CONVENTIONS\.md|VERIFY\.md|"
    r"report\.html|LICENSE|\.gitignore|\.gitattributes|\.editorconfig|"
    r"initialization-record\.md|final-validation\.md|_index\.md|architecture\.html|"
    r"types\.ts|package\.json|tsconfig.*\.json)$",
    re.IGNORECASE)
RUNTIME_DIR_OK = re.compile(r"^(\.claude/|docs/|evidence/|src/|backend/|frontend/|infra/|node_modules/)", re.IGNORECASE)
TOKEN = re.compile(r"[A-Za-z0-9_][A-Za-z0-9_.\-/]*\.(?:md|xlsx|json|html|yaml|yml|ps1|sh|ts|py)")

def is_runtime(tok):
    return bool(RUNTIME_OK.search(tok) or RUNTIME_DIR_OK.match(tok))

def exists(tok):
    if os.path.exists(os.path.join(ROOT, tok)):
        return True
    base = os.path.basename(tok)
    for d in ("prompts/initialization", "", "Standards", "Standards/Security"):
        if os.path.exists(os.path.join(ROOT, d, base)):
            return True
    return False

def looks_init(tok):
    return ("prompts/" in tok or tok == "create.md" or "INITIALIZATION_MANIFEST" in tok
            or tok == "BUILD_PATTERN.md" or re.match(r"^\d\d-[a-z0-9\-]+\.md$", tok)
            or "initialization-manifest" in tok.lower())

def main():
    broken = []
    for rel in SPINE:
        p = os.path.join(ROOT, rel)
        if not os.path.exists(p):
            broken.append((rel, "<SPINE FILE ITSELF MISSING>", 0)); continue
        with open(p, encoding="utf-8", errors="replace") as fh:
            for i, line in enumerate(fh, 1):
                for m in TOKEN.finditer(line):
                    tok = m.group(0).strip("/.")
                    if not tok or is_runtime(tok) or not looks_init(tok):
                        continue
                    if not exists(tok):
                        broken.append((rel, tok, i))
    if broken:
        print("BROKEN INIT-SYSTEM REFERENCES (%d):" % len(broken))
        for rel, tok, ln in broken:
            print(f"  {rel}:{ln}  ->  {tok}")
        return 1
    print("OK: all %d spine files present; no broken init-system references." % len(SPINE))
    return 0

if __name__ == "__main__":
    sys.exit(main())
