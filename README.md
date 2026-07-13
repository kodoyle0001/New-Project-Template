# Swif7Edge — New Project Template

This repository is the **canonical Swif7Edge project initializer**. Copy it into a fresh repo and
run one instruction; it scaffolds a standardized, environment-wired project and then removes its own
initialization machinery, leaving a clean project repo ready for work.

> **New here? Read this whole page first (2 minutes), then follow "How to use it" below.**

## What you get (the delivered repo)

A project-specific repo containing: `PROJECT.md`, `AUTHORITATIVE_ARCHITECTURE.md`, `CLAUDE.md`,
`DECISIONS.xlsx` + `DECISIONS.md`, `BACKLOG.md`, `STATUS.md`, `.gitignore`/`.gitattributes`/
`.editorconfig`, `.claude/rules/**`, and the durable environment interfaces:
`VAULT.md`, `SHAREPOINT.md`, `SECURITY.md`, `DATA-CLASSIFICATION.md`, `CONVENTIONS.md`, `VERIFY.md`.

## How to use it

1. Create a new **empty** Git repo and clone it.
2. Copy the contents of this template into the clone (do **not** copy this template's `.git`).
3. Start Claude Code in the repo and give it exactly this instruction:
   > **Read and follow `create.md`.**
4. When Claude reports a **decision gate**, open `DECISIONS.xlsx`, fill the _User Action_ fields,
   save and close it, and tell Claude to **continue**. Repeat only when new material decisions arise.
5. When it reports initialization complete, begin project work under `BUILD_PATTERN.md`.

The entry file is `create.md` at the repo root. Everything else it needs is under
`prompts/initialization/` and is registered in `prompts/initialization/INITIALIZATION_MANIFEST.md`.

## Preconditions & known landmines (read before you start)

- **Azure CLI** signed in to the correct subscription (Swif7Edge Prod); **Node ≥ 20 + pnpm 9** for
  software/web projects; **Python 3 + openpyxl** for the `DECISIONS.xlsx` decision workbook.
- **PnP.PowerShell is not usable** (AV-quarantined) — all SharePoint work is **Microsoft Graph
  only** (see `SHAREPOINT.md`).
- On some machines a PowerShell profile function can **shadow the `az` binary** — verify
  `Get-Command az` resolves to the CLI, not a function.
- Certificate private keys live in the **OS cert store / Key Vault**, never in the repo (`VAULT.md`).
- **No CUI on the commercial tenant** — you must complete `DATA-CLASSIFICATION.md` before work
  starts (`SECURITY.md`, `DATA-CLASSIFICATION.md`).

## Data classification is mandatory

Every new repo must declare its data classification and target environment (Commercial vs GCC High,
CUI-eligible or not) in `DATA-CLASSIFICATION.md` **before work starts**. Final validation fails if it
is missing or contradictory.

## Repo integrity checks (run anytime)

```bash
python scripts/check_references.py    # every init-system reference resolves
pwsh   scripts/verify.ps1             # the delivered repo is actually wired (vault/Graph/SharePoint/DB)
```

## Layout

```
create.md                              # entry point — "read and follow create.md"
BUILD_PATTERN.md                       # the operating constitution (waves, define-done-first)
CLAUDE.md                              # bootstrap context for a fresh Claude Code instance
VAULT.md SHAREPOINT.md SECURITY.md DATA-CLASSIFICATION.md CONVENTIONS.md VERIFY.md
prompts/initialization/                # numbered modules + INITIALIZATION_MANIFEST.md
Standards/                             # CMMC / NIST reference corpus + entra-sso pattern
Templates/                            # reusable page/compliance templates
scripts/                               # check_references.py, verify.ps1
.github/workflows/ci.yml               # secret-scan + Tier-0 hard-deny + integrity gates
_analysis/                             # the hardening audit workbook (this template's own audit)
```
