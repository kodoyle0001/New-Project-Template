

# Final Initialization Validation

  

## 1. Purpose

  

This module performs the final deterministic and independent validation of the initialized repository.

  

It determines whether the repository is:

  

- Structurally complete

- Internally consistent

- Safe

- Traceable

- Ready for future project work

- Free of unauthorized implementation work

- Free of unresolved initialization failures

- Ready for cleanup of temporary initialization files

  

This module validates. It must not begin project implementation, populate the backlog, deploy resources, make purchases, or remove initialization files.

  

Cleanup is owned by `99-cleanup.md`.

  

---

  

## 2. Required State

  

Run only after all selected initialization modules have completed or reached an explicitly accepted nonblocking state.

  

The following must exist before validation begins:

  

```text

PROJECT.md

AUTHORITATIVE_ARCHITECTURE.md

DECISIONS.xlsx

DECISIONS.md

BUILD_PATTERN.md

BACKLOG.md

STATUS.md

CLAUDE.md

README.md

report.html

.claude/INDEX.yaml

.claude/rules/

docs/

evidence/

```

  

Applicable project-specific outputs must also exist.

  

---

  

## 3. Validation Principles

  

Use:

  

- Deterministic checks where possible

- Independent review

- Evidence over assertion

- Current repository inspection

- No reliance on chat history

- Repair before failure when repair is safe and within authority

- No cleanup until all blocking checks pass

- Honest reporting of unknowns and gaps

  

A module completion statement is not proof that its outputs are valid.

  

---

  

## 4. Validation Phases

  

Perform validation in this order:

  

1. Repository boundary and Git validation

2. Required file and directory validation

3. Manifest and module completion validation

4. Decision-system validation

5. Project and requirement validation

6. Architecture validation

7. Repository-structure validation

8. Hygiene validation

9. Technical-guardrail validation

10. Scoped-rule validation

11. Work-memory validation

12. Report and visual validation

13. Security and secret validation

14. Drift and hallucination validation

15. Backlog and no-work-started validation

16. Independent initialization audit

17. Cleanup-readiness decision

  

---

  

## 5. Repository and Git Validation

  

Verify:

  

- One clear Git root exists.

- All permanent project files are inside the repository.

- No copied template `.git` metadata remains active.

- No file outside the repository was modified.

- Existing user work was preserved.

- Current branch is identifiable.

- Working-tree changes are understood.

- No automatic push, merge, release, force operation, or remote modification occurred.

- Remote presence or absence does not invalidate local initialization.

  

Do not reset or clean the repository to obtain a passing result.

  

---

  

## 6. Required Root Files

  

Verify these files exist and are readable:

  

```text

CLAUDE.md

PROJECT.md

AUTHORITATIVE_ARCHITECTURE.md

DECISIONS.xlsx

DECISIONS.md

BUILD_PATTERN.md

BACKLOG.md

STATUS.md

README.md

report.html

.gitignore

.gitattributes

.editorconfig

LICENSE

```

  

Verify their purposes are not duplicated or confused.

  

---

  

## 7. Documentation and Evidence Structure

  

Verify the numbered documentation taxonomy exists:

  

```text

docs/00-start-here/

docs/10-architecture/

docs/20-design/

docs/30-decisions/

docs/40-requirements/

docs/50-security/

docs/60-operations/

docs/70-audit/

docs/80-reference/

docs/99-archive/

```

  

Verify every major documentation directory contains a meaningful `_index.md`.

  

Verify:

  

```text

docs/10-architecture/architecture.html

```

  

exists and is the standard visual-architecture location.

  

Verify ADRs, if any, are under `docs/30-decisions/`.

  

Verify `evidence/` exists and only applicable purpose-based subdirectories were created.

  

Confirm:

  

- Evidence is not broadly ignored.

- Screenshot evidence uses actual image files when required.

- Sensitive or oversized evidence has a controlled-location record.

- No secret or prohibited data is present.

- Initialization did not fabricate test or compliance evidence.

  

---

  

## 8. Module Completion Validation

  

Read `INITIALIZATION_STATUS.md` and the immutable initialization manifest.

  

Verify:

  

- Every required selected module ran.

- Every dependency was satisfied.

- Every module status is valid.

- Expected outputs exist.

- Module versions are recorded.

- Skipped optional modules have reasons.

- Blocking failures are resolved.

- Shared-file ownership was respected.

- No unregistered prompt was executed.

- No manifest mutation occurred during the run.

  

Do not accept a module as complete solely because its status says complete.

  

---

  

## 9. Decision Workbook Validation

  

Open `DECISIONS.xlsx` with an Excel-compatible library.

  

Verify:

  

- Workbook opens successfully.

- `Decisions` sheet exists.

- `Deferred` sheet exists.

- Required columns exist.

- User Action validation exists where applicable.

- User answers were preserved.

- Successfully processed questions were removed.

- Deferred questions are on the Deferred sheet.

- Active questions are genuinely unresolved.

- No completed-history sheet was created.

- No secret is stored in the workbook.

- The workbook remains a permanent repository file.

  

If an active question blocks project definition, architecture, security, compliance, cost authority, or repository correctness, final validation must not pass.

  

Nonblocking deferred questions may remain when the repository can safely begin work without them.

  

---

  

## 10. Decision Record Validation

  

Verify:

  

- `DECISIONS.md` exists.

- Material decisions are recorded.

- ADR index links are valid.

- Individual ADRs contain context, authority, alternatives, consequences, risks, and validation.

- Paid commitments are not represented as approved without user authorization.

- Standards exceptions and control degradation have explicit approval.

- Decisions are reflected in affected authoritative files.

  

---

  

## 11. Project Validation

  

Verify `PROJECT.md` contains supported:

  

- Project identity

- Purpose

- Desired outcome

- Intended users

- Deliverable type

- In scope

- Out of scope

- Success criteria

- Acceptance criteria

- Constraints

- Formal requirements

- Temporary assumptions

- Completion definition

  

Verify:

  

- Requirements have stable IDs.

- Requirements have authority and source.

- Success criteria came from or were approved by the user.

- Derived requirements do not expand business scope.

- Temporary assumptions are explicit, reversible, and low risk.

- Unsupported claims are absent.

- Project work is not represented as started.

  

---

  

## 12. Architecture Validation

  

Verify `AUTHORITATIVE_ARCHITECTURE.md`:

  

- Separates current state from target architecture.

- Separates approved from proposed architecture.

- Defines system context and boundaries.

- Defines major components and responsibilities.

- Defines agents and sub-agents when applicable.

- Defines an independent Audit Agent.

- Defines data entities and flows when applicable.

- Defines authentication and authorization.

- Defines trust boundaries.

- Defines Azure and Microsoft environment.

- Defines API and integration strategy.

- Defines secrets, logging, monitoring, failure handling, recovery, testing, cost, and Continuous Assurance.

- Uses stable IDs for major elements.

- Maps major architecture elements to requirements.

- Documents one-live-environment safeguards.

- Contains no unauthorized deployment or purchase claim.

  

---

  

## 13. Architecture HTML Validation

  

Open:

  

```text

docs/10-architecture/architecture.html

```

  

Verify:

  

- It opens offline.

- It has no required CDN or external script dependencies.

- It identifies the Markdown architecture as authoritative.

- It contains applicable system-context, OV-1-equivalent, component, agent, data-flow, authentication, trust-boundary, deployment, and assurance views.

- Visuals are understandable.

- Links work.

- Proposed work is not shown as implemented.

- No secret or prohibited data is embedded.

  

---

  

## 14. Repository Structure Validation

  

Verify:

  

- Required core directories exist.

- Technical directories are justified by architecture.

- Unnecessary technical directories were not created.

- Files are in approved locations.

- No duplicate architecture, decision, schema, evidence, or runbook location exists.

- Naming follows lowercase kebab case except approved root files.

- No meaningless `.gitkeep` files were created by default.

- Environment configuration reflects the selected Commercial or GCC High environment.

- Fictional deployed dev/test/prod folders were not created.

- Current-state and desired-state content are separated when applicable.

  

---

  

## 15. Hygiene Validation

  

Verify:

  

- `.gitignore` reflects the actual technology stack.

- Required files, schemas, infrastructure, HTML, screenshots, and evidence are not accidentally ignored.

- Local secrets and runtime files are ignored.

- `.gitattributes` normalizes text and marks binary artifacts.

- `.editorconfig` defines UTF-8, LF, final newline, and trailing-whitespace behavior.

- Proprietary Swif7Edge licensing is present.

- No open-source license was applied without approval.

- README links resolve.

- README links to `report.html` and authority files.

- Applicable lockfile exists.

- Competing lockfiles do not exist.

  

---

  

## 16. Technical Guardrail Validation

  

Verify `docs/50-security/technical-guardrails.md` exists and contains applicable:

  

- Azure-only policy

- Microsoft environment

- One-live-environment safety

- Plan/apply separation

- Drift blocking

- Microsoft Graph standard

- Deprecated-module prohibitions

- Secret protection

- Key Vault and managed identity rules

- API-first integration

- Data classification

- Canonical schema

- Data-integrity gates

- Migration safeguards

- Retry, timeout, and failure containment

- Cost authorization

- Public-exposure gate

- Evidence requirements

- Independent review

- Hallucination prevention

- Control-degradation gate

- Exception process

  

Applicable local standards, such as Entra SSO, must be linked and activated correctly.

  

---

  

## 17. Scoped Rule Validation

  

Verify:

  

- `.claude/rules/_index.md` exists.

- Only applicable rule files exist.

- Rule scope and authority are documented.

- Rule activation syntax is supported.

- Intended files activate relevant rules where testable.

- No scoped rule weakens a higher authority.

- No conflicting rules remain.

- Rules for nonexistent technologies were not created.

- Required security, data, M365, Azure, testing, documentation, evidence, and agent rules exist when applicable.

  

---

  

## 18. Work Memory Validation

  

Verify:

  

- `CLAUDE.md` is concise and points to authority.

- `.claude/INDEX.yaml` parses.

- Indexed paths exist.

- `STATUS.md` states current verified initialization state.

- `BACKLOG.md` contains no work items.

- `report.html` exists and opens offline.

- No Waves, Slices, or Tasks were invented.

- Memory files do not contain full transcripts or unsupported facts.

- Startup and end-of-work synchronization are documented.

- Drift, hallucination, and documentation-debt controls exist.

  

---

  

## 19. `report.html` Validation

  

Verify the report:

  

- Opens offline.

- Has no required external dependencies.

- Is understandable to a non-engineer.

- Links to authority files.

- States the project goal and initialization state.

- Shows architecture and standards.

- Shows known decisions and unknowns.

- States that the backlog is empty.

- States that project work has not started.

- Does not present target architecture as implemented.

- Does not present initialization as project delivery.

- Contains no secret or prohibited data.

- Is consistent with `PROJECT.md`, architecture, decisions, status, and backlog.

  

---

  

## 20. Security and Secret Scan

  

Perform applicable scans for:

  

- Hardcoded secrets

- Tokens

- Private keys

- Passwords

- Connection strings

- Client secrets

- Sensitive `.env` files

- Secrets embedded in HTML or evidence

- Unsafe authentication stubs

- Prohibited deprecated Microsoft modules

- `Invoke-Expression` or `iex`

- Unsafe plaintext secure-string conversion

- Unapproved cloud providers

- Unauthorized public endpoints

- Unapproved paid-service configuration

  

Any confirmed secret exposure blocks validation.

  

Do not print secret values in the validation report.

  

---

  

## 21. Drift Validation

  

Compare:

  

- Requirements to architecture

- Architecture to repository structure

- Architecture to scoped rules

- Guardrails to scoped rules

- Decisions to authoritative files

- README to actual files

- Index to actual files

- Status to actual repository state

- Report to authoritative files

- Manifest to module outputs

  

Classify drift as documentation, architecture, requirement, rule, state, unresolved-decision, or unsupported-claim drift.

  

Repair routine synchronization issues automatically when authority is clear.

  

Material drift blocks finalization.

  

---

  

## 22. Hallucination Validation

  

Search for:

  

- Features presented as implemented without code or evidence

- Compliance percentages without evidence

- Certification claims

- Tests claimed without results

- Deployments claimed without live verification

- APIs claimed without contracts or configuration

- Users, owners, services, or environments invented without authority

- Planned work shown as completed

- Target architecture shown as current state

- Chat-only information treated as approved

  

Unsupported material claims must be removed, corrected, or marked unverified.

  

---

  

## 23. No-Work-Started Validation

  

Verify:

  

- `BACKLOG.md` has no items.

- `STATUS.md` states project work has not started.

- `report.html` states project work has not started.

- No Wave, Slice, or Task records were invented.

- No implementation feature was built merely during initialization.

- No Azure or M365 resource was changed.

- No purchase or license was committed.

- No remote push, merge, or release occurred automatically.

  

Repository scaffolding, documentation, validation tooling, and initialization artifacts do not count as project implementation.

  

---

  

## 24. Independent Initialization Audit

  

Run an independent Audit Agent after deterministic checks.

  

The Audit Agent must be read-only by default and evaluate:

  

- Completeness

- Internal consistency

- Goal and requirement grounding

- Architecture adequacy

- Standards alignment

- Security posture

- Decision integrity

- Data-integrity safeguards

- Drift

- Hallucination

- Evidence sufficiency

- Repository usability

- Cleanup readiness

  

The Audit Agent must not silently repair its own findings.

  

Findings return to the Primary Orchestrator for correction and revalidation.

  

---

  

## 25. Validation Evidence

  

Create permanent evidence under:

  

```text

evidence/audits/initialization/

```

  

At minimum create:

  

```text

evidence/audits/initialization/final-validation.md

```

  

Include validation date, manifest and template version, checks performed, passes, failures, repairs, independent audit result, known nonblocking gaps, and cleanup-readiness status.

  

Do not include secrets or full private command output.

  

---

  

## 26. Failure Handling

  

When validation fails:

  

1. Identify the owning module.

2. Preserve current repository state.

3. Correct safe issues automatically.

4. Re-run failed checks.

5. Continue unrelated validation when useful.

6. Route material decisions through `DECISIONS.xlsx`.

7. Do not run cleanup.

8. Do not claim initialization complete.

  

Use bounded repair attempts.

  

---

  

## 27. Final Status

  

Set one status:

  

```text

VALIDATED_READY_FOR_CLEANUP

VALIDATION_BLOCKED_BY_DECISION

VALIDATION_FAILED_REPAIRABLE

VALIDATION_FAILED_TERMINAL

```

  

Only `VALIDATED_READY_FOR_CLEANUP` permits `99-cleanup.md` to run.

  

Update `INITIALIZATION_STATUS.md`, `STATUS.md`, and `report.html`.

  

Do not mark project work as started.

  

---

  

## 28. Completion Criteria

  

This module is complete when all blocking checks pass, independent audit passes, permanent validation evidence exists, no material drift or unsupported claim remains, backlog is empty, project work has not started, no unauthorized live or paid action occurred, and cleanup readiness is `VALIDATED_READY_FOR_CLEANUP`.

  

---

  

## 29. Module Completion Report

  

```text

MODULE_STATUS:

MODULE_ID: final_validation

VALIDATION_STATUS:

CHECKS_PERFORMED:

CHECKS_PASSED:

CHECKS_FAILED:

REPAIRS_PERFORMED:

DECISION_BLOCKERS:

DRIFT_FOUND:

DRIFT_RESOLVED:

UNSUPPORTED_CLAIMS_FOUND:

UNSUPPORTED_CLAIMS_RESOLVED:

SECRET_SCAN_RESULT:

INDEPENDENT_AUDIT_RESULT:

EVIDENCE_FILE:

BACKLOG_EMPTY:

PROJECT_WORK_STARTED:

CLEANUP_READY:

BLOCKING_ISSUES:

```


---

# v1.1 Hardening Validation (authoritative addendum)

In addition to the checks above, final validation MUST confirm:

1. **Permanent outputs present.** Every `required: true` path in
   `prompts/initialization/expected-artifacts.yaml` exists and is non-empty; every applicable
   `when_*` path exists when its condition holds.
2. **Data-classification gate.** `DATA-CLASSIFICATION.md` exists and is fully filled. Fail if
   `cui_eligible: yes` while `target_tenant: Commercial`, or if any `controlled_categories_present`
   value appears with `target_tenant: Commercial`.
3. **No committed identifiers/secrets.** Run `python scripts/check_references.py` (must exit 0) and a
   secret scan (`.gitleaks.toml`); no real tenant/client/subscription GUID, email, private key,
   connection string, or personal user path appears in any shipped file.
4. **References resolve.** No broken init-system reference (the resolver is the machine check).
5. **Verify wiring.** `scripts/verify.ps1` exists; for Microsoft-integrated repos it returns no FAIL
   (SKIP is acceptable when env is not yet provisioned).

Only set `VALIDATED_READY_FOR_CLEANUP` when all of the above pass.
