

# Initialization Cleanup

  

## 1. Purpose

  

This module removes temporary initialization machinery after final validation succeeds.

  

It must leave a clean, permanent, project-specific Swif7Edge repository that can begin future work without depending on initialization prompts.

  

It must:

  

- Preserve all permanent project artifacts.

- Create a permanent initialization record.

- Remove temporary initialization prompts and status files.

- Remove template-only files not selected for the project.

- Repair links to removed files.

- Revalidate the permanent repository.

- Remove this cleanup prompt last.

  

This module must not begin project work, populate the backlog, deploy resources, purchase services, push, merge, release, or change the live environment.

  

---

  

## 2. Entry Condition

  

Run only when `90-final-validation.md` has set:

  

```text

VALIDATED_READY_FOR_CLEANUP

```

  

Verify the final-validation evidence exists.

  

If final validation is absent, failed, blocked, stale, or inconsistent:

  

- Do not clean up.

- Report the problem.

- Return control to final validation.

  

---

  

## 3. Cleanup Authority

  

Use the immutable initialization manifest’s cleanup registry.

  

Every initialization artifact must be classified as:

  

```text

retain

remove

convert

```

  

Do not delete a file merely because it appears temporary.

  

Do not retain initialization machinery merely because cleanup is inconvenient.

  

When the manifest and permanent repository structure conflict, stop affected cleanup and reconcile through the Primary Orchestrator.

  

---

  

## 4. Permanent Artifacts

  

The completed repository must retain, at minimum:

  

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

.claude/INDEX.yaml

.claude/rules/

docs/

evidence/

```

  

Retain applicable source, tests, scripts, tools, services, configuration, schemas, infrastructure, API contracts, UI source, data assets, migrations, runbooks, policy, current-state records, local standards, ADRs, architecture visuals, and validation evidence.

  

---

  

## 5. Initialization Record

  

Before removing any initialization file, create:

  

```text

docs/70-audit/initialization-record.md

```

  

Include:

  

```markdown

# Initialization Record

  

## Repository

## Initialization Date

## Template Version

## Manifest Version

## Initialization Mode

## Modules Executed

## Modules Skipped

## Decisions Processed

## Deferred Decisions

## Files Created

## Files Modified

## Standards Activated

## Architecture Outputs

## Rules Created

## Validation Performed

## Independent Audit Result

## Known Nonblocking Gaps

## Cleanup Performed

## Removed Initialization Files

## Permanent Entry Points

## Final State

```

  

Do not include secrets, chat transcripts, chain of thought, raw credentials, or unnecessary machine-specific paths.

  

Link to final-validation evidence.

  

---

  

## 6. Cleanup Plan

  

Before deletion, prepare a cleanup plan listing:

  

- File or directory

- Cleanup action

- Reason

- Permanent replacement

- References requiring update

- Post-removal validation

- Deletion order

  

Perform a dry-run review.

  

Verify no permanent file depends on a file marked for removal.

  

The cleanup plan may remain temporary unless it has durable audit value beyond the initialization record.

  

---

  

## 7. Files Normally Removed

  

Remove files classified as temporary initialization machinery, including applicable:

  

```text

create.md

prompts/initialization/INITIALIZATION_MANIFEST.md

INITIALIZATION_STATUS.md

prompts/initialization/

prompts/initialization/

```

  

Remove the temporary orchestration prompt when its permanent outputs already exist and the manifest marks it for removal:

  

```text

prompts/initialization/20-multi-agent-orchestration.md

```

  

Remove other template-only prompt files marked `remove`.

  

Do not remove permanent `BUILD_PATTERN.md`, `CLAUDE.md`, or `.claude/rules/`.

  

---

  

## 8. Cleanup Order

  

The cleanup prompt must remove itself last.

  

Recommended order:

  

1. Create initialization record.

2. Verify permanent outputs.

3. Update links and indexes.

4. Remove completed initialization prompts except cleanup.

5. Remove template-only standards not activated for the project.

6. Remove root bootstrap files.

7. Remove `INITIALIZATION_STATUS.md`.

8. Revalidate the permanent repository.

9. Update the initialization record with cleanup results.

10. Remove `99-cleanup.md`.

11. Remove now-empty temporary prompt directories.

  

If the prompt cannot remove itself safely, report the exact remaining path as the only manual cleanup item.

  

---

  

## 9. Standards Library Cleanup

  

For each template standard:

  

- Retain the versioned project-local copy when applicable.

- Remove unused template-only standards when they are not intended as permanent project assets.

- Preserve central source and version metadata in the local copy.

- Do not remove a standard referenced by architecture, rules, or security documentation.

- Do not retain a full unused standards library merely because it came with the template.

  

Example applicable local copy:

  

```text

docs/50-security/entra-sso-internal-apps.md

```

  

The central template source may be removed when the local copy is complete and the manifest marks it for removal.

  

---

  

## 10. Reference Cleanup

  

Search permanent files for references to:

  

- `create.md`

- `prompts/initialization/INITIALIZATION_MANIFEST.md`

- `INITIALIZATION_STATUS.md`

- `prompts/initialization/`

- `prompts/initialization/`

- Temporary orchestration prompts

- Old architecture HTML paths

- Obsolete working files

  

Update permanent files to point to:

  

- `PROJECT.md`

- `AUTHORITATIVE_ARCHITECTURE.md`

- `BUILD_PATTERN.md`

- `CLAUDE.md`

- `.claude/INDEX.yaml`

- Applicable scoped rules

- `docs/70-audit/initialization-record.md`

- Final-validation evidence

  

Do not leave broken links.

  

Historical mentions inside the initialization record are permitted.

  

---

  

## 11. Index and Entry-Point Cleanup

  

Update:

  

```text

.claude/INDEX.yaml

docs/00-start-here/_index.md

README.md

report.html

```

  

Remove entries for deleted initialization files.

  

Add:

  

```text

docs/70-audit/initialization-record.md

```

  

Verify the repository entry path no longer instructs users or agents to run initialization.

  

The next authorized activity is project work under `BUILD_PATTERN.md`.

  

---

  

## 12. Status Conversion

  

Update `STATUS.md` to:

  

```text

Lifecycle: Ready for Work

Initialization: Complete

Project work started: No

Current Wave: None

Current Slice: None

Current Task: None

```

  

Include:

  

- Final validation date

- Link to initialization record

- Link to final-validation evidence

- Known nonblocking gaps

- Next authorized action

  

Then remove:

  

```text

INITIALIZATION_STATUS.md

```

  

---

  

## 13. Backlog Preservation

  

Verify `BACKLOG.md` still contains no work items.

  

Cleanup must not create:

  

- First Wave

- First Slice

- Tasks

- Suggested features

- Implementation milestones

- Roadmap items

  

The repository is ready for work, but project work has not started.

  

---

  

## 14. Report Finalization

  

Regenerate `report.html` after cleanup.

  

It must state:

  

- Initialization is complete.

- Final validation passed.

- Project work has not started.

- Backlog is empty.

- Permanent project entry points.

- Applicable architecture and standards.

- Known nonblocking gaps.

- The repository is ready for the first authorized Wave.

  

Remove references to temporary initialization prompts.

  

Verify it opens offline.

  

---

  

## 15. Architecture, Decision, and Evidence Preservation

  

Verify cleanup does not remove:

  

- Approved target architecture

- Architecture HTML

- ADRs

- Decision workbook

- Durable decision index

- Requirement traceability

- Activated standards

- Guardrails

- Scoped rules

- Audit Agent definition

- Build pattern

- Final-validation evidence

- Initialization record

  

Retain:

  

```text

evidence/audits/initialization/final-validation.md

docs/70-audit/initialization-record.md

```

  

Remove only disposable command output, temporary caches, or redundant working files classified for removal.

  

---

  

## 16. Post-Cleanup Validation

  

After removing temporary files, verify:

  

- All permanent root files exist.

- All permanent directories exist.

- `CLAUDE.md` no longer depends on initialization prompts.

- `.claude/INDEX.yaml` parses and contains no deleted paths.

- Scoped rules remain valid.

- README links work.

- Documentation indexes work.

- Architecture HTML opens offline.

- `report.html` opens offline.

- `DECISIONS.xlsx` opens.

- `BACKLOG.md` is empty.

- `STATUS.md` says initialization complete and project work not started.

- Final-validation evidence exists.

- Initialization record exists.

- No secret is present.

- No temporary initialization path remains except the cleanup prompt currently executing.

- No live resource changed.

- No remote action occurred.

  

After this validation passes, remove the cleanup prompt last.

  

---

  

## 17. Failure Handling

  

If cleanup encounters a failure:

  

1. Stop deleting affected files.

2. Preserve permanent artifacts.

3. Record the failure.

4. Determine whether references can be repaired.

5. Revalidate the current repository.

6. Do not claim cleanup complete.

7. Do not start project work.

8. Leave enough temporary machinery to permit repair when necessary.

  

Do not retry deletion indefinitely.

  

Do not delete permanent files to resolve a cleanup conflict.

  

---

  

## 18. Git Handling

  

This module may inspect Git status, remove temporary files, update permanent files, and record cleanup evidence.

  

It must not automatically:

  

- Commit

- Push

- Pull

- Fetch

- Merge

- Rebase

- Reset

- Clean the working tree

- Force-delete unrelated untracked files

- Modify remotes

- Open a pull request

- Release or deploy

  

The user or approved later workflow controls remote actions.

  

---

  

## 19. Final Repository State

  

The finished repository must be:

  

- Project-specific

- Free of temporary initialization prompts

- Free of stale initialization links

- Governed by permanent authority files

- Ready for AI and human work

- Backlog-empty

- Work-not-started

- Validated

- Auditable

- Offline-readable through `report.html`

- Capable of beginning the first authorized Wave

  

---

  

## 20. Completion Criteria

  

Cleanup is complete when final validation is confirmed, initialization record and evidence exist, temporary initialization files are removed, the cleanup prompt is removed last, permanent files remain, links and indexes are valid, status is converted, backlog remains empty, report is regenerated, no project work began, no live or remote action occurred, and post-cleanup validation passes.

  

---

  

## 21. Module Completion Report

  

Before removing itself, report:

  

```text

MODULE_STATUS:

MODULE_ID: cleanup

INITIALIZATION_RECORD:

FINAL_VALIDATION_EVIDENCE:

FILES_REMOVED:

DIRECTORIES_REMOVED:

STANDARDS_RETAINED:

STANDARDS_REMOVED:

REFERENCES_UPDATED:

INDEX_UPDATED:

STATUS_CONVERTED:

BACKLOG_EMPTY:

PROJECT_WORK_STARTED:

REPORT_REGENERATED:

POST_CLEANUP_VALIDATION:

SELF_REMOVAL_READY:

BLOCKING_ISSUES:

```


---

# v1.1 Durability Gate & Recovery (authoritative addendum)

Before deleting ANY initialization file:

1. **Durability gate.** For every `required` artifact in
   `prompts/initialization/expected-artifacts.yaml`, confirm it exists and is non-empty. If any is
   missing, STOP — do not delete; return to the owning module. This is the fix for the
   self-consuming-scaffolder knowledge-loss risk.
2. **Never remove** the durable environment interfaces: `VAULT.md`, `SHAREPOINT.md`, `SECURITY.md`,
   `DATA-CLASSIFICATION.md`, `CONVENTIONS.md`, `VERIFY.md`, `BUILD_PATTERN.md`, `CLAUDE.md`,
   `.gitignore`, `.gitleaks.toml`, `.pre-commit-config.yaml`, `.github/workflows/ci.yml`,
   `CODEOWNERS`, `scripts/**`, `.template-provenance.json`.
3. **Provenance stamp.** Fill the runtime fields of `.template-provenance.json`
   (`template_commit`, `initialized_utc`, `initialized_mode`, `microsoft_environment`).
4. **Recovery path.** Initialization begins with a pre-init Git commit (or stash) of the received
   template; if cleanup fails partway, recover with `git restore`/`git checkout` of that baseline and
   re-run in `repair` mode. Never leave a half-deleted repo with no recovery note.
5. **Init record** is written to `docs/70-audit/initialization-record.md` (single canonical path).
