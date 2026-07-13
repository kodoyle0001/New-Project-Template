
# Work Memory and Repository Operating Memory

  

## 1. Purpose

  

This module creates the permanent repository memory system that allows humans and AI agents to resume work accurately without relying on chat history.

  

It must create or safely update:

  

```text

CLAUDE.md

.claude/INDEX.yaml

BACKLOG.md

STATUS.md

report.html

```

  

The memory system must:

  

- Keep project authority in durable files.

- Prevent drift and hallucination.

- Distinguish approved facts from assumptions and recommendations.

- Show the current verified state.

- Keep the backlog empty at initialization.

- Provide a concise startup path for every future session.

- Synchronize documentation with work.

- Support Continuous Assurance.

- Avoid storing full chat transcripts or unnecessary agent reasoning.

- Preserve auditability through Git, decisions, evidence, and structured status.

  

---

  

## 2. Memory Principles

  

Apply these principles:

  

- Files, not conversations, hold project authority.

- Current repository evidence is preferred over prior-session memory.

- Requirements, architecture, decisions, and verified state are separate concepts.

- `STATUS.md` contains current state, not a chronological diary.

- `BACKLOG.md` contains authorized future work only.

- `report.html` is the consolidated human view, not the controlling source.

- Git history, ADRs, audit evidence, and decision records provide history.

- Unknowns remain unknown.

- Assumptions are explicit and temporary.

- Planned work is not completed work.

- Target architecture is not current implementation.

- A model statement is not evidence.

- Memory must be compact enough for reliable reuse.

  

---

  

## 3. Authority Map

  

The memory system must preserve this lookup order:

  

1. Component- or service-specific authoritative files

2. `AUTHORITATIVE_ARCHITECTURE.md`

3. `PROJECT.md`

4. Accepted ADRs and `DECISIONS.md`

5. `BUILD_PATTERN.md`

6. `CLAUDE.md`

7. Applicable `.claude/rules/`

8. Approved standards and references

9. `STATUS.md`

10. `BACKLOG.md`

11. `report.html`

12. Supporting documentation and evidence

  

Operational and generated files may summarize higher authorities but may not override them.

  

---

  

## 4. `CLAUDE.md`

  

`CLAUDE.md` is the concise repository-wide operating contract for AI agents.

  

It must contain:

  

```markdown

# Repository Operating Contract

  

## Project Entry

## Authority Order

## Required Startup Sequence

## Work Authorization

## Build Pattern

## Decisions

## Safe Autonomy

## Hard Gates

## Continuous Assurance

## Documentation Cascade

## Memory and Status

## Scoped Rules

## Completion Claims

## Prohibited Behavior

```

  

Link to detailed source documents rather than copying them.

  

---

  

## 5. Required Startup Behavior

  

`CLAUDE.md` must require every AI session to:

  

1. Identify the repository root.

2. Read `PROJECT.md`.

3. Read `AUTHORITATIVE_ARCHITECTURE.md`.

4. Read `BUILD_PATTERN.md`.

5. Read `DECISIONS.md`.

6. Read `STATUS.md`.

7. Consult `.claude/INDEX.yaml`.

8. Load applicable scoped rules.

9. Inspect Git branch and working-tree status.

10. Inspect actual repository state relevant to the request.

11. Reconcile requested work against current evidence.

12. Confirm authorization.

13. Continue autonomously within approved scope.

14. Use `DECISIONS.xlsx` for true human decisions.

15. Validate with evidence.

16. Update authoritative files and `report.html`.

17. Audit for drift and hallucination before completion.

  

Do not require every agent to read every supporting file.

  

---

  

## 6. Safe Autonomy

  

The operating contract must authorize the AI to make routine decisions when they are within approved scope, consistent with architecture and standards, safe, reversible, low or moderate risk, free of new paid commitment, testable, and unlikely to constrain future work materially.

  

The AI must not stop for routine file placement, formatting, implementation detail, testing approach, standard Azure-native selection, or reversible engineering judgment.

  

The AI may not infer authorization for:

  

- Scope expansion

- Paid commitments

- Licensing

- Public exposure

- Broad Graph permissions

- Tenant-wide consent

- Privileged-role changes

- Conditional Access changes

- Destructive operations

- Irreversible migrations

- Third-party platforms

- Scraping

- Security or compliance degradation

- Exceptions to Swif7Edge standards

  

---

  

## 7. `.claude/INDEX.yaml`

  

Create:

  

```text

.claude/INDEX.yaml

```

  

This is the machine-readable knowledge map.

  

It must identify, at minimum:

  

- File path

- Title

- Authority level

- Purpose

- Owner

- Update triggers

- Related requirements

- Related architecture elements

- Applicable rule scopes

- Whether the file is authoritative, operational, generated, evidence, or reference

- Last verified date when available

  

Recommended structure:

  

```yaml

version: 1

repository:

  project_file: PROJECT.md

  architecture_file: AUTHORITATIVE_ARCHITECTURE.md

  build_pattern_file: BUILD_PATTERN.md

  decisions_file: DECISIONS.md

  decision_interface: DECISIONS.xlsx

  status_file: STATUS.md

  backlog_file: BACKLOG.md

  human_report: report.html

  

documents:

  - path: PROJECT.md

    class: authoritative

    purpose: project scope, requirements, and success criteria

    owner: scope_and_success_criteria

    update_triggers:

      - material scope change

      - success criteria change

```

  

Use only fields that provide durable navigation value.

  

The index points to authoritative content; it does not become another source of project facts.

  

---

  

## 8. Index Integrity

  

When indexed metadata conflicts with the target file:

  

- The target file prevails.

- Correct the index.

- Record the conflict as documentation drift.

  

Remove entries for deleted files.

  

Add entries for new permanent authority, operational, security, design, schema, evidence-index, or runbook files when relevant.

  

---

  

## 9. `BACKLOG.md`

  

Create:

  

```text

BACKLOG.md

```

  

At initialization, it must contain only:

  

```markdown

# Backlog

  

No backlog items have been authorized or added. Project work has not started.

```

  

Do not create Waves, Slices, Tasks, features, technical debt, future improvements, roadmaps, suggested work, or implementation milestones.

  

Initialization prepares the repository. It does not begin project work.

  

---

  

## 10. Backlog Rules After Initialization

  

After project work is authorized:

  

- The backlog contains authorized future work only.

- Work traces to a project goal and requirement.

- Work may be represented as Waves, Slices, and Tasks.

- Proposed ideas remain separate from authorized backlog work.

- Completed work is removed from pending sections and reflected through status, evidence, commits, and reporting.

- The AI must not populate the backlog merely because it can imagine useful work.

- Material scope expansion requires a decision.

- The orchestrator may create logically necessary supporting tasks inside an authorized Slice.

  

---

  

## 11. `STATUS.md`

  

Create:

  

```text

STATUS.md

```

  

Use this structure:

  

```markdown

# Status

  

## Project State

  

- Lifecycle:

- Initialization:

- Project work started:

- Current Wave:

- Current Slice:

- Current Task:

- Last verified:

  

## Verified Current State

## Active Blockers

## Decision Gate

## Known Drift

## Known Risks

## Current Evidence

## Next Authorized Action

## Document Synchronization

```

  

At initialization:

  

```text

Lifecycle: Initialization

Project work started: No

Current Wave: None

Current Slice: None

Current Task: None

```

  

---

  

## 12. Status Rules

  

`STATUS.md` must contain current verified state, evidence links, blockers, decision gates, known drift, risks, and the next authorized action.

  

It must remain concise and must not store full agent transcripts, duplicate the backlog, duplicate full architecture, become an append-only journal, preserve obsolete status indefinitely, claim completion without evidence, or contain secrets.

  

History belongs in Git, decisions, evidence, audit records, and Wave reporting.

  

---

  

## 13. `report.html`

  

Create or safely update:

  

```text

report.html

```

  

This is the consolidated human-facing report defined by `BUILD_PATTERN.md`.

  

It must be:

  

- Self-contained

- Offline-capable

- Free of required external CDN or script dependencies

- Searchable

- Navigable

- Print-friendly

- Understandable to executives, users, engineers, administrators, and auditors

- Generated from repository evidence

- Clearly subordinate to authoritative files

  

At initialization, it must state:

  

- Repository initialization status

- Project purpose

- Approved scope

- Success criteria

- Architecture summary

- Standards and controls

- Decisions

- Known unknowns

- Backlog is empty

- Project work has not started

- No Waves, Slices, or Tasks exist

- The repository is ready for the first authorized Wave after validation

  

---

  

## 14. Report Sources and Synchronization

  

Generate the report from:

  

- `PROJECT.md`

- `AUTHORITATIVE_ARCHITECTURE.md`

- `DECISIONS.md`

- ADRs

- `BUILD_PATTERN.md`

- `BACKLOG.md`

- `STATUS.md`

- Architecture HTML

- Designs

- Requirements

- Tests

- Evidence

- Audit results

- Git metadata where appropriate

  

Do not use chat history as authority.

  

Update the report after material requirement or architecture changes, accepted decisions, completed Slices or Waves, material audit findings, drift, new risks, deployments, live verification, and initialization completion.

  

A stale report is documentation drift.

  

---

  

## 15. Report State Labels

  

The report must distinguish:

  

- Approved

- Implemented

- Verified

- In progress

- Authorized future work

- Proposed

- Assumed

- Unknown

- Deferred

- Blocked

  

It must never show target architecture, planned work, or initialization scaffolding as completed project implementation.

  

---

  

## 16. Session Start

  

At the beginning of a future work session, the Primary Orchestrator must:

  

1. Confirm repository root.

2. Inspect Git status and branch.

3. Read root authority files.

4. Read `STATUS.md`.

5. Consult `.claude/INDEX.yaml`.

6. Load applicable scoped rules.

7. Inspect actual files and authorized live resources relevant to the request.

8. Identify decisions and blockers.

9. Reconcile scope.

10. Determine the next authorized action.

  

A generated session brief may be refreshed, but it remains derived and non-authoritative.

  

---

  

## 17. Work-Period End

  

At the end of a meaningful work period:

  

1. Update affected authoritative files.

2. Update decisions and ADRs.

3. Update `STATUS.md`.

4. Reconcile `BACKLOG.md`.

5. Update `.claude/INDEX.yaml` when permanent files changed.

6. Regenerate `report.html`.

7. Run documentation-debt checks.

8. Run drift and hallucination checks.

9. Confirm evidence.

10. Report verified results separately from assumptions.

  

Do not perform unnecessary writes after every minor read-only action.

  

---

  

## 18. Documentation-Debt Audit

  

The memory system must detect:

  

- Code changed without architecture or design updates

- Schema changed without data documentation

- Requirement changed without traceability

- Decision made without durable record

- Rule changed without index update

- File moved without link updates

- Architecture HTML stale

- `report.html` stale

- `STATUS.md` inconsistent

- Backlog inconsistent with authorization

- Evidence paths broken

- Current and target state confused

  

Material documentation debt blocks completion.

  

---

  

## 19. Drift and Hallucination Prevention

  

Compare user-approved requirements, project scope, architecture, decisions, rules, implementation, schemas, live state, recorded state, tests, evidence, status, and report.

  

When drift is found:

  

1. Identify authority.

2. Determine whether source or implementation is stale.

3. Correct routine synchronization issues.

4. Route material choices through `DECISIONS.xlsx`.

5. Revalidate affected work.

6. Update the report.

7. Do not conceal drift.

  

Future agents must not treat unsupported statements as memory.

  

Require authority and source for requirements, stable IDs for major elements, evidence for material completion claims, explicit assumptions and unknowns, approved-versus-proposed separation, target-versus-implemented separation, and repository inspection before action.

  

---

  

## 20. Temporary Assumptions

  

Temporary assumptions may appear only when permitted by `PROJECT.md`.

  

They must include identifier, statement, reason, evidence, risk, validation method, and status.

  

They must not silently become requirements.

  

Security-critical, compliance-critical, costly, destructive, or irreversible choices may not be treated as assumptions.

  

---

  

## 21. Decision Memory

  

`DECISIONS.xlsx` is the active question interface.

  

`DECISIONS.md` and ADRs are durable decision memory.

  

When an answer is processed:

  

1. Route it into the correct authoritative file.

2. Record material decisions.

3. Remove the processed workbook row.

4. Move deferred questions to the Deferred sheet.

5. Update the index when permanent files change.

6. Update the report when material.

  

Do not store unresolved questions only in `STATUS.md` or chat.

  

---

  

## 22. Memory Quality

  

Do not store full chain of thought, chat transcripts, repeated command output, duplicated architecture, duplicated requirements, temporary debug reasoning, or unsupported summaries.

  

Store approved facts, current verified state, decisions, requirements, architecture, evidence references, risks, blockers, authorized next action, and lessons that materially change permanent process.

  

---

  

## 23. Failure Recovery

  

If memory files are missing, malformed, or contradictory:

  

1. Preserve valid files.

2. Inspect Git history.

3. Inspect current repository state.

4. Reconstruct only from evidence.

5. Mark unknown information as unknown.

6. Do not reconstruct facts from model memory alone.

7. Route material unresolved information through `DECISIONS.xlsx`.

8. Revalidate the repaired memory system.

  

---

  

## 24. Ownership

  

This module owns:

  

```text

CLAUDE.md

.claude/INDEX.yaml

BACKLOG.md

STATUS.md

report.html

```

  

It may accept structured updates from identity, scope, architecture, decisions, repository structure, guardrails, scoped rules, orchestration, final validation, and cleanup.

  

Other modules must not overwrite these files without coordination.

  

---

  

## 25. Validation

  

Verify:

  

- `CLAUDE.md` exists and is concise.

- Authority order and startup sequence are documented.

- Safe autonomy and hard gates are documented.

- `BUILD_PATTERN.md` is mandatory.

- `.claude/INDEX.yaml` exists and parses.

- Indexed paths exist or are explicitly pending.

- `BACKLOG.md` exists and is empty.

- `STATUS.md` states project work has not started.

- `report.html` exists and opens offline.

- The report has no required external dependencies.

- The report does not present initialization as implementation.

- No Waves, Slices, or Tasks were invented.

- Decision routing, drift, hallucination, and documentation-debt controls are documented.

- No secrets are present.

- No live resource was changed.

  

---

  

## 26. Completion Criteria

  

This module is complete when the permanent operating memory exists, future sessions have a reliable startup path, current state is distinct from history, the backlog is empty, the consolidated report exists, drift and hallucination controls are embedded, and validation passes.

  

---

  

## 27. Module Completion Report

  

```text

MODULE_STATUS:

MODULE_ID: work_memory

CLAUDE_FILE:

INDEX_FILE:

BACKLOG_FILE:

STATUS_FILE:

REPORT_FILE:

BACKLOG_EMPTY:

PROJECT_WORK_STARTED:

INDEX_ENTRIES:

REPORT_OFFLINE_VALIDATED:

DRIFT_CONTROLS_DEFINED:

HALLUCINATION_CONTROLS_DEFINED:

DOCUMENTATION_DEBT_CONTROL_DEFINED:

VALIDATION_PERFORMED:

VALIDATION_RESULT:

BLOCKING_ISSUES:

```