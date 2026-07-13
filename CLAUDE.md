# CLAUDE.md — Bootstrap context (New Project Template)

> **You are inside the Swif7Edge project initializer.** This file orients a fresh Claude Code
> instance. During initialization the Work-Memory module (19) replaces this with the _project's_
> permanent `CLAUDE.md`; until then, follow this.

## Your task here

If asked to initialize this repo: **read and follow `create.md`** at the repo root. It is a thin
orchestrator that runs the approved modules registered in
`prompts/initialization/INITIALIZATION_MANIFEST.md`. Do not invent or execute unregistered prompts.

## Non-negotiable doctrines (carry these into the delivered `CLAUDE.md`)

1. **Automation does the labor; humans hold the gates.** Never auto-advance past a decision gate,
   commit, push, deploy, or create billing/cloud resources without explicit authorization
   (`create.md` §6 flags default to _no_).
2. **The decision path is the single chokepoint.** All user questions go through `DECISIONS.xlsx`
   (never chat); durable decisions are appended to `DECISIONS.md`. Silence ≠ approval.
3. **The database is the rules engine.** Gate/SoD/pricing/compliance logic lives in the
   schema, not re-implemented in application code (`CONVENTIONS.md`).
4. **Additive integrity.** Migrations are additive/forward-only; never edit an applied migration.
   The decision record is append-only.
5. **Authoritative state** lives in `BACKLOG.md` (open work) and `STATUS.md`/`docs/CURRENT_STATE.md`
   (live status) — not the README.
6. **Test + commit per package.** Honest status vocabulary only — never "green" just because a
   workflow exists.
7. **Least privilege, secrets in Key Vault, Graph-only (no PnP).** See `VAULT.md`, `SHAREPOINT.md`,
   `SECURITY.md`. **No CUI on the commercial tenant** — `DATA-CLASSIFICATION.md` is mandatory.

## Before you claim done

Run `python scripts/check_references.py` (integrity) and `pwsh scripts/verify.ps1` (wiring). An
agent's statement of completion is **not** evidence of completion — validation is.

## Capability-based agents

Use capability roles (Primary Orchestrator, Efficient Worker, Reviewer, …), **not** hardcoded model
names. Route by ambiguity, risk, reversibility, and cost.
