

# Basic Repository Hygiene

## 1. Purpose

This module creates the basic Git, formatting, licensing, navigation, dependency, and repository-maintenance controls required for every Swif7Edge repository.

It must make the repository:

- Predictable
    
- Portable
    
- Safe to clone
    
- Safe to edit on Windows and Linux
    
- Resistant to accidental secret commits
    
- Resistant to generated-file clutter
    
- Consistent across projects
    
- Understandable to humans and AI agents
    
- Ready for future project work
    
- Capable of retaining evidence and audit artifacts
    

This module handles basic repository hygiene only.

It must not:

- Design the project architecture
    
- Create technical guardrails owned by `17-technical-guardrails.md`
    
- Create scoped AI rules owned by `18-scoped-rules.md`
    
- Populate `BACKLOG.md`
    
- Begin implementation work
    
- Add speculative CI workflows
    
- Configure a remote repository
    
- Push or merge code
    
- Create release processes that the project does not need
    

---

# 2. Required Outputs

Create or safely update:

```text
.gitignore
.gitattributes
.editorconfig
LICENSE
README.md
```

Create conditional supporting files only when the approved project architecture requires them, including:

```text
.env.example
CODEOWNERS
.github/
.azuredevops/
```

Do not create remote-platform files merely to make the repository appear complete.

---

# 3. Authoritative Inputs

Before creating hygiene files, inspect:

1. `PROJECT.md`
    
2. `AUTHORITATIVE_ARCHITECTURE.md`
    
3. `BUILD_PATTERN.md`
    
4. `DECISIONS.md`
    
5. Existing repository files
    
6. Selected technology stack
    
7. Selected package managers
    
8. Selected programming languages
    
9. Selected operating systems or containers
    
10. Evidence requirements
    
11. Remote repository configuration when present
    
12. `INITIALIZATION_STATUS.md`
    

Generate repository hygiene from the actual project.

Do not copy a large generic template without reconciling it to the repository.

---

# 4. Preservation Rule

Existing user-created files and settings must be preserved unless they are:

- Invalid
    
- Unsafe
    
- Generated template placeholders
    
- Clearly obsolete
    
- Directly conflicting with an approved repository standard
    

When an existing hygiene file is present:

1. Read it.
    
2. Identify valid project-specific rules.
    
3. Preserve those rules.
    
4. Add missing required protections.
    
5. Remove only rules that are clearly harmful or obsolete.
    
6. Validate the merged result.
    

Do not overwrite a working `.gitignore`, `.gitattributes`, `.editorconfig`, `LICENSE`, or `README.md` blindly.

---

# 5. `.gitignore`

Create a technology-aware `.gitignore`.

It must include applicable exclusions for:

- Operating-system files
    
- Editor and IDE temporary files
    
- Local tool caches
    
- Dependency directories
    
- Build output
    
- Test caches
    
- Coverage caches
    
- Temporary logs
    
- Local runtime files
    
- Local environment files
    
- Secret-bearing configuration
    
- Authentication tokens
    
- Private keys
    
- Certificates containing private keys
    
- Temporary exports
    
- Local databases when they are not approved project artifacts
    
- Generated files that can be reproduced
    
- Terraform local state when Terraform is explicitly approved
    
- Python virtual environments
    
- Node package directories
    
- .NET build output
    
- Framework-specific generated output
    

The final rules must match the selected technology stack.

---

# 6. `.gitignore` Safety

Do not use broad patterns that accidentally hide required project artifacts.

The `.gitignore` must not unintentionally exclude:

- `PROJECT.md`
    
- `AUTHORITATIVE_ARCHITECTURE.md`
    
- `DECISIONS.xlsx`
    
- `DECISIONS.md`
    
- `BUILD_PATTERN.md`
    
- `BACKLOG.md`
    
- `STATUS.md`
    
- `README.md`
    
- `report.html`
    
- Architecture diagrams
    
- Required configuration templates
    
- Schemas
    
- Infrastructure definitions
    
- API contracts
    
- Migrations
    
- Approved evidence
    
- Screenshot evidence
    
- Audit reports
    
- Requirement traceability
    
- Current-state records intended for Git
    
- Policy and desired-state files
    

Avoid patterns such as:

```text
config/
data/
evidence/
*.json
*.html
*.png
```

unless the project has a precise, documented reason.

Prefer specific paths and extensions over broad exclusions.

---

# 7. Secret Exclusions

At minimum, evaluate exclusions for:

```text
.env
.env.*
!.env.example
*.pem
*.key
*.pfx
*.p12
*.jks
*.keystore
*.secrets.*
secrets/
credentials/
tokens/
```

Adjust the patterns to the project.

Do not rely on `.gitignore` as the only secret protection.

Secret scanning and technical hard denies belong in the Technical Guardrails and applicable CI controls.

A file already committed to Git is not protected merely because it is later added to `.gitignore`.

---

# 8. Environment Templates

When the project uses runtime environment variables, create:

```text
.env.example
```

only when useful.

The example file must:

- Contain variable names
    
- Contain safe descriptions
    
- Contain non-secret example values where appropriate
    
- Distinguish identifiers from secrets
    
- Explain where secret values are obtained
    
- Never contain real credentials
    
- Match the approved configuration schema
    
- Reflect the selected live environment
    
- Avoid fictional dev, test, and production environments
    

For one-live-environment projects, use explicit configuration such as:

```text
MICROSOFT_ENVIRONMENT=commercial
```

or:

```text
MICROSOFT_ENVIRONMENT=gcc-high
```

Do not create fake deployed environment configurations.

---

# 9. `.gitattributes`

Create `.gitattributes` to normalize repository behavior.

Use Git-normalized LF line endings by default:

```text
* text=auto eol=lf
```

Add appropriate binary declarations for applicable file types, including:

```text
*.png binary
*.jpg binary
*.jpeg binary
*.gif binary
*.webp binary
*.pdf binary
*.xlsx binary
*.docx binary
*.pptx binary
*.zip binary
```

Add project-specific language handling only when necessary.

Do not normalize binary evidence or office files as text.

---

# 10. Encoding and Line-Endings Standard

The standard is:

- UTF-8
    
- LF line endings in Git
    
- A final newline
    
- No accidental byte-order mark unless a required tool demands it
    
- Trailing whitespace removed
    
- Markdown hard line breaks preserved only when intentional
    

Windows-based users and tools may edit locally, but committed text must remain normalized.

Do not create repository-wide formatting rules that break required generated or vendor files.

---

# 11. `.editorconfig`

Create `.editorconfig` with a concise base configuration.

At minimum:

```ini
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true

[*.md]
trim_trailing_whitespace = false
```

Add language-specific indentation only when the selected stack requires it.

Examples may include:

- Two spaces for JSON, YAML, JavaScript, or TypeScript
    
- Four spaces for Python or PowerShell
    
- Project-specific settings required by established tooling
    

Do not create conflicting formatter rules.

The repository formatter and linter remain authoritative where they define more specific behavior.

---

# 12. Proprietary License

Every internal Swif7Edge repository must receive a proprietary license notice unless another license has been explicitly approved.

Create:

```text
LICENSE
```

The notice must state that:

- Copyright belongs to Swif7Edge LLC.
    
- All rights are reserved.
    
- The software and documentation are proprietary.
    
- Use, copying, modification, distribution, sublicensing, publication, or disclosure requires written authorization.
    
- No open-source rights are granted by default.
    

Use the current year or an approved year range.

Do not apply an open-source license without explicit user authorization through `DECISIONS.xlsx`.

Do not infer that public repository visibility authorizes public reuse.

---

# 13. License Exceptions

A change to an open-source, source-available, customer-owned, government-owned, joint-development, or third-party license requires:

1. Identification of the intended license.
    
2. Ownership review.
    
3. Contractual review when applicable.
    
4. Distribution-impact review.
    
5. Dependency-license review.
    
6. Explicit user authorization.
    
7. A durable decision record.
    

The AI must not choose an open-source license autonomously.

---

# 14. `README.md`

`README.md` is a concise repository entry point.

It must not become the full project charter, architecture document, work history, or audit report.

The README should contain:

```markdown
# Project Name

Brief project-purpose statement.

## Start Here

- [Human Project Report](report.html)
- [Project Charter](PROJECT.md)
- [Authoritative Architecture](AUTHORITATIVE_ARCHITECTURE.md)
- [Build Pattern](BUILD_PATTERN.md)
- [Decisions](DECISIONS.md)
- [Backlog](BACKLOG.md)
- [Current Status](STATUS.md)
- [Repository Guide](docs/00-start-here/_index.md)

## Repository Status

Initialization, active work, maintenance, or another supported lifecycle state.

## Basic Use

Only the minimum verified instructions needed to enter or operate the repository.

## Authority

Identify which files are authoritative.
```

Keep the README brief and navigational.

---

# 15. README Accuracy

Do not include:

- Unverified setup commands
    
- Fictional deployment instructions
    
- Unsupported compliance claims
    
- Stale architecture descriptions
    
- Planned features presented as implemented
    
- Invented badges
    
- Broken links
    
- Secret values
    
- Detailed work history
    
- Full dependency inventories
    
- Complete environment configuration
    

Every setup command included in the README must be validated or clearly marked as not yet validated.

---

# 16. `report.html` Link

The README must prominently link to:

```text
report.html
```

Use a description explaining that `report.html` is the consolidated human-facing project report.

The README must also explain that:

- Root Markdown files remain authoritative.
    
- `report.html` is generated from repository evidence.
    
- The report must be regenerated when authoritative information changes.
    

---

# 17. Dependency Lockfiles

Commit the lockfile produced by the selected package manager.

Examples include:

```text
package-lock.json
pnpm-lock.yaml
yarn.lock
poetry.lock
uv.lock
Pipfile.lock
packages.lock.json
Cargo.lock
go.sum
```

Rules:

- Commit the applicable lockfile.
    
- Do not commit competing lockfiles for the same dependency ecosystem.
    
- Do not switch package managers silently.
    
- Validate that the lockfile matches the dependency manifest.
    
- Update the lockfile with dependency changes.
    
- Review material dependency changes.
    
- Do not hand-edit generated lockfile content unless the ecosystem explicitly supports it.
    

A package-manager change is a material engineering decision when it affects build reproducibility or repository workflow.

---

# 18. Generated Files

Generated files may be committed when they are required for:

- Runtime operation
    
- Offline use
    
- Auditability
    
- Evidence
    
- Architecture visualization
    
- Legal or controlled-document requirements
    
- Reproducible deployment
    
- User access without a build tool
    

Examples include:

```text
report.html
docs/10-architecture/architecture.html
approved evidence reports
signed or controlled outputs
```

Generated files should not be committed when they are:

- Large disposable build products
    
- Caches
    
- Temporary local output
    
- Easily recreated without audit value
    
- Machine-specific
    
- Sensitive
    
- Duplicate representations with no user or operational need
    

The repository must document which generated artifacts are intentionally committed.

---

# 19. Evidence Retention

Evidence supporting a project claim must not disappear with a temporary workspace.

Approved evidence should normally be committed to Git when:

- It contains no prohibited sensitive information.
    
- Its size is reasonable.
    
- It supports testing, audit, compliance, deployment, or live verification.
    
- Git is the approved evidence location.
    
- Retention improves reproducibility and traceability.
    

Examples include:

- Test reports
    
- Audit reports
    
- Screenshot images
    
- Validation summaries
    
- Drift reports
    
- Schema-validation output
    
- Deployment verification
    
- Compliance evidence approved for repository storage
    

Do not ignore all evidence directories.

---

# 20. Sensitive or Large Evidence

Evidence must not be committed when it contains:

- Secrets
    
- Tokens
    
- Private keys
    
- Restricted credentials
    
- Unnecessary personal data
    
- CUI in a Commercial repository
    
- Classified information
    
- Contractually restricted data
    
- Sensitive production exports
    
- Data prohibited by repository policy
    

When evidence is too large or too sensitive for Git:

1. Store it in an approved controlled location.
    
2. Create a repository evidence record.
    
3. Record its controlled location.
    
4. Record its hash or integrity identifier when appropriate.
    
5. Record the claim it supports.
    
6. Record access requirements.
    
7. Avoid broken local-machine paths.
    

---

# 21. Binary Files

Use binary files only when their format is required.

Examples include:

- `DECISIONS.xlsx`
    
- Screenshot evidence
    
- Signed PDFs
    
- Imported customer artifacts
    
- Approved diagrams
    
- Controlled office documents
    

When a text-based authoritative version is practical, maintain it alongside the binary artifact.

Do not convert required user-facing or evidentiary files into text merely to simplify Git diffs.

---

# 22. Local Databases and Runtime State

Do not commit local runtime databases by default.

Examples include:

```text
*.db
*.sqlite
*.sqlite3
```

A database file may be committed only when it is an approved:

- Fixture
    
- Test asset
    
- Controlled reference dataset
    
- Required embedded application resource
    

Committed data files must contain no prohibited sensitive data.

Live runtime state belongs in the approved live system, not in an accidental Git-tracked database file.

---

# 23. Remote Workflow Files

The following are conditional:

```text
CODEOWNERS
pull-request templates
issue templates
dependency-update configuration
release workflows
branch-policy documentation
```

Create them only when:

- The remote platform is known.
    
- Ownership is known.
    
- The repository uses the corresponding workflow.
    
- The files provide immediate value.
    
- Their behavior has been validated.
    
- They do not create speculative process.
    

Do not create GitHub files for an Azure DevOps repository or vice versa.

---

# 24. `CODEOWNERS`

Create `CODEOWNERS` only when actual ownership information exists.

It should reflect:

- Authoritative file owners
    
- Security-sensitive areas
    
- Architecture ownership
    
- Schema ownership
    
- Infrastructure ownership
    
- Required reviewers
    

Do not invent users, teams, email addresses, or remote handles.

Do not use `CODEOWNERS` as a substitute for repository access controls.

---

# 25. Temporary and Backup Files

Ignore applicable temporary or backup files such as:

```text
*.tmp
*.temp
*.bak
*.swp
*.swo
*~
.DS_Store
Thumbs.db
```

Do not ignore files solely because their names contain words such as:

```text
backup
archive
old
```

A deliberately retained historical artifact may be valid project evidence or documentation.

---

# 26. Repository Size Discipline

Avoid committing:

- Dependency directories
    
- Container images
    
- Large reproducible build output
    
- Full tenant exports without approval
    
- Database backups
    
- Large diagnostic dumps
    
- Raw debug traces
    
- Vendor SDK installations
    
- Unnecessary media
    

When a large artifact is necessary:

1. Determine whether Git LFS or controlled external storage is appropriate.
    
2. Evaluate sensitivity.
    
3. Record the decision.
    
4. Preserve traceability.
    

Do not introduce Git LFS automatically without confirming that the remote workflow supports it.

---

# 27. No Automatic Remote Actions

This module may inspect Git configuration.

It must not automatically:

- Create a remote
    
- Change a remote URL
    
- Push
    
- Pull
    
- Fetch
    
- Merge
    
- Open a pull request
    
- Configure branch protection
    
- Configure repository secrets
    
- Enable dependency automation
    

These actions occur only through explicit authorization or later approved workflow rules.

---

# 28. Hygiene Validation

Before completing this module, verify:

- `.gitignore` exists.
    
- `.gitignore` matches the selected technology stack.
    
- Required control files are not ignored.
    
- Approved evidence is not broadly ignored.
    
- Secret-bearing local files are ignored.
    
- `.gitattributes` exists.
    
- Text line endings normalize to LF.
    
- Binary files are declared appropriately.
    
- `.editorconfig` exists.
    
- UTF-8 and final-newline rules are defined.
    
- `LICENSE` exists.
    
- The proprietary license is used.
    
- No open-source license was applied without approval.
    
- `README.md` exists.
    
- README links are valid.
    
- README links to `report.html`.
    
- README links to root authority files.
    
- Applicable lockfiles are tracked.
    
- Competing lockfiles do not exist.
    
- No required configuration, schema, infrastructure, or evidence file is accidentally hidden.
    
- No remote action occurred.
    
- No backlog items were created.
    
- No project implementation began.
    

---

# 29. Completion Criteria

This module is complete when:

- Required hygiene files exist.
    
- Existing valid rules were preserved.
    
- Repository text behavior is standardized.
    
- Secret-bearing local artifacts are excluded.
    
- Required project artifacts remain tracked.
    
- Evidence-retention rules are supported.
    
- The proprietary license is present.
    
- README navigation is accurate.
    
- Dependency locking is reproducible.
    
- Conditional remote files were created only when justified.
    
- Validation passes.
    

---

# 30. Module Completion Report

Report to the Primary Orchestrator:

```text
MODULE_STATUS:
MODULE_ID: basic_repo_hygiene
FILES_CREATED:
FILES_MODIFIED:
GITIGNORE_STACKS_INCLUDED:
SECRET_EXCLUSIONS_CONFIRMED:
EVIDENCE_TRACKING_CONFIRMED:
LOCKFILES_FOUND:
COMPETING_LOCKFILES_REMOVED_OR_REPORTED:
LICENSE_TYPE:
README_LINKS_VALIDATED:
CONDITIONAL_REMOTE_FILES_CREATED:
VALIDATION_PERFORMED:
VALIDATION_RESULT:
BLOCKING_ISSUES:
```

Do not ask user questions in the completion report.

