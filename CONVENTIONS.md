# CONVENTIONS.md — Engineering Conventions (Swif7Edge standard)

> Canonical, durable. Must survive initialization cleanup. Derived from `swif7edge-pipeline`
> (`CLAUDE.md`, `docs/WAVE_PROTOCOL.md`, `backend/db/apply.ts`) and `Office-Infrastructure`.

## 1. Database migrations

- **Additive, forward-only.** Files `NNN_name.sql`, applied in strict numeric/lexical order by a
  runner that records each in `migrations_applied` and runs each whole file in its own transaction.
- **Never edit an applied migration** — add the next number. Numbering gaps are fine.
- The database is the rules engine: gate/SoD/pricing/compliance logic lives in schema
  constraints/triggers, **not** re-implemented in the API layer (avoid a drifting second source of truth).

## 2. Branching & worktrees

- Branch prefixes: `feat-*`, `docs-*`/`docs/*`, `cockpit-*`, `ci-*`.
- Heavy use of **git worktrees** under `.claude/worktrees/` for parallel agent work.
- **Waves:** one integrator agent owns the single migration number and the branch and commits;
  never two agents on the same file/schema in parallel. A fast-forward merge **blocks on an
  adversarial verifier**.

## 3. Commit discipline

- Test + commit per package. Never skip hooks or bypass signing unless explicitly authorized.
- No commit/push during initialization unless authorized (see `create.md` §6 flags).

## 4. Authoritative state (where truth lives)

| Concern                  | File                                                                                                                             |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| Live project status      | `docs/CURRENT_STATE.md` / `STATUS.md` (not the README)                                                                           |
| Open work                | `BACKLOG.md`                                                                                                                     |
| Durable decisions        | `DECISIONS.md` (append-only); live questions in `DECISIONS.xlsx`                                                                 |
| Architecture             | `AUTHORITATIVE_ARCHITECTURE.md`                                                                                                  |
| Operating constitution   | `CLAUDE.md` + `.claude/rules/**` + `BUILD_PATTERN.md`                                                                            |
| Honest status vocabulary | complete / partial / missing / not_tracked / blocked / stale / not_applicable — **never "green" just because a workflow exists** |

## 5. File numbering (initialization system)

```
00–09  Root controllers and manifest        10–19  Core initialization modules
20–29  Permanent orchestration installation  30–39  Project-type modules
40–79  Capability / integration modules      80–89  Reserved
90–98  Validation and reconciliation         99     Final cleanup
```

Permanent project files (`CLAUDE.md`, `PROJECT.md`, …) never use initialization prefixes.

## 6. Stack baseline (software/web projects)

pnpm workspaces (pnpm@9, Node ≥20) · TypeScript strict (ES2022, `noUncheckedIndexedAccess`,
`verbatimModuleSyntax`) · Backend Fastify 5 + Kysely over Azure Postgres + Zod + `jose` (Entra JWT) ·
Frontend React 18 + Vite + Tailwind + shadcn/ui + TanStack Query + React Router (single `lib/api.ts`
network seam) · Deploy: API → Azure Container Apps (image via ACR), frontend → Azure Static Web Apps,
DB → Azure Postgres Flexible Server. Azure-only; Microsoft Graph for M365 (PnP not usable).
