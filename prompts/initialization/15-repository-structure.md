

# Standard Repository Structure

## 1. Purpose

This module creates the standardized file and directory structure for a Swif7Edge project repository.

The repository structure must allow a user, administrator, engineer, auditor, or AI agent to enter any Swif7Edge repository and quickly understand:

- What the project is
    
- Why it exists
    
- Where authoritative information resides
    
- Where architecture is documented
    
- Where decisions are recorded
    
- Where work is tracked
    
- Where source code belongs
    
- Where tests belong
    
- Where schemas belong
    
- Where security and operational documentation belong
    
- Where evidence is stored
    
- Where live-state and desired-state information belongs
    
- Which files are authoritative
    
- Which directories apply to the specific project
    

The module creates the repository scaffold.

It must not:

- Begin project implementation
    
- Populate the backlog
    
- Invent Waves, Slices, or Tasks
    
- Create speculative features
    
- Deploy resources
    
- Modify the live environment
    
- Create directories that the approved architecture does not need
    
- Duplicate authoritative locations
    
- Move valid existing files without checking their purpose and ownership
    

---

# 2. Primary Inputs

Read and reconcile:

1. `PROJECT.md`
    
2. `AUTHORITATIVE_ARCHITECTURE.md`
    
3. `BUILD_PATTERN.md`
    
4. `DECISIONS.md`
    
5. `DECISIONS.xlsx`
    
6. `INITIALIZATION_STATUS.md`
    
7. `prompts/initialization/INITIALIZATION_MANIFEST.md`
    
8. Existing repository files and directories
    
9. Approved Swif7Edge standards
    
10. Applicable project-type and capability modules
    

The structure must reflect the approved project and architecture.

Do not create technical directories based only on what is common in other repositories.

---

# 3. Structure Principles

Apply these principles:

- Predictability
    
- Clear authority
    
- Lowercase kebab-case directory naming
    
- Minimal duplication
    
- Purpose-based organization
    
- Proportionality
    
- Traceability
    
- Auditability
    
- Compatibility with Windows, Linux, Git, and common automation tools
    
- Separation of source, configuration, evidence, documentation, and generated output
    
- Conditional creation of technical directories
    
- Stable locations for permanent artifacts
    
- No meaningless empty directories
    
- No speculative project work
    

The repository must remain understandable without access to chat history.

---

# 4. Required Root Files

Every initialized repository must contain:

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
```

These files form the permanent repository control plane.

## `CLAUDE.md`

Defines the repository-wide AI operating contract and points to scoped instructions.

## `PROJECT.md`

Defines project purpose, scope, requirements, success criteria, constraints, and completion conditions.

## `AUTHORITATIVE_ARCHITECTURE.md`

Defines the approved target architecture and architectural truth.

## `DECISIONS.xlsx`

Provides the active human-to-AI decision interface.

## `DECISIONS.md`

Contains the durable decision index and material decision history.

## `BUILD_PATTERN.md`

Defines the mandatory Wave, Slice, Task, validation, audit, and reporting process.

## `BACKLOG.md`

Exists at initialization but contains no work items.

Initial content:

```markdown
# Backlog

No backlog items have been authorized or added. Project work has not started.
```

## `STATUS.md`

Contains the current project and work state without becoming a historical transcript.

## `README.md`

Provides a concise entry point for humans and links to the authoritative files.

## `report.html`

Provides the consolidated, self-contained human-facing project report.

---

# 5. Required Core Directories

Every repository must contain:

```text
.claude/
docs/
evidence/
```

These directories are universal.

## `.claude/`

Contains AI navigation, scoped rules, skills, hooks, configuration, and other permanent AI operating artifacts selected by later modules.

## `docs/`

Contains controlled human-readable project documentation.

## `evidence/`

Contains project evidence supporting testing, validation, audit, compliance, deployment, and verified claims.

Other technical directories are conditional.

---

# 6. Standard Documentation Taxonomy

Create:

```text
docs/
├── 00-start-here/
├── 10-architecture/
├── 20-design/
├── 30-decisions/
├── 40-requirements/
├── 50-security/
├── 60-operations/
├── 70-audit/
├── 80-reference/
└── 99-archive/
```

The numbered taxonomy provides consistent navigation across repositories.

Lower numbers contain higher-authority or more frequently consulted material.

Higher numbers contain supporting, operational, reference, or archived information.

The numbering does not override the formal repository authority order.

---

# 7. Documentation Directory Purposes

## `docs/00-start-here/`

Contains orientation material such as:

- Repository map
    
- Navigation guidance
    
- Onboarding information
    
- Document authority explanation
    
- Project-entry instructions
    

Do not duplicate the full contents of root authoritative files.

## `docs/10-architecture/`

Contains:

- `architecture.html`
    
- Architecture diagrams
    
- View-specific supporting material
    
- OV-1-equivalent views
    
- Component diagrams
    
- Data-flow diagrams
    
- Authentication flows
    
- Deployment views
    
- Architecture model exports
    

`AUTHORITATIVE_ARCHITECTURE.md` remains at the repository root.

## `docs/20-design/`

Contains approved capability, component, feature, interface, data, automation, or infrastructure designs.

Design depth must be proportional to risk and complexity.

## `docs/30-decisions/`

Contains individual Architecture Decision Records and other consequential decision records.

Use:

```text
ADR-001-meaningful-title.md
ADR-002-meaningful-title.md
```

`DECISIONS.md` remains the root summary and index.

## `docs/40-requirements/`

Contains supporting requirement analyses, traceability material, mappings, or imported requirement sources.

`PROJECT.md` remains the primary project-requirements authority unless another approved document is explicitly designated.

## `docs/50-security/`

Contains:

- Security architecture support
    
- Authentication patterns
    
- Authorization patterns
    
- Threat models
    
- Data-protection standards
    
- Identity standards
    
- Security-control implementation guidance
    
- Project-specific security procedures
    

## `docs/60-operations/`

Contains:

- Operational procedures
    
- Runbooks when the project does not use a root `runbooks/` directory
    
- Recovery procedures
    
- Administrative instructions
    
- Deployment procedures
    
- Maintenance guidance
    
- Troubleshooting procedures
    

## `docs/70-audit/`

Contains:

- Audit plans
    
- Audit summaries
    
- Assurance procedures
    
- Standards mappings
    
- Evidence indexes
    
- Drift reviews
    
- Hallucination reviews
    
- Control assessments
    

## `docs/80-reference/`

Contains:

- Supporting references
    
- External standards summaries
    
- Vendor documentation notes
    
- Glossaries
    
- Non-authoritative supporting material
    

## `docs/99-archive/`

Contains superseded or retired documentation that must remain available for traceability.

Archived content must clearly identify:

- Original authority
    
- Superseded date
    
- Replacement document
    
- Reason for archival
    

Do not use the archive as a dumping ground for temporary files.

---

# 8. Documentation Indexes

Each major permanent `docs/` directory must contain:

```text
_index.md
```

Each `_index.md` must explain:

- Directory purpose
    
- What belongs there
    
- What does not belong there
    
- Naming conventions
    
- Authority level
    
- Related root files
    
- Relevant owners
    
- Current contents
    

Keep indexes concise.

Do not create indexes for every nested technical directory unless they materially improve navigation.

---

# 9. Architecture Visual Location

Create the visual architecture at:

```text
docs/10-architecture/architecture.html
```

This replaces any earlier proposed location such as:

```text
docs/architecture/architecture.html
```

The root architecture file remains:

```text
AUTHORITATIVE_ARCHITECTURE.md
```

The HTML file must state that the root Markdown file is authoritative.

Update applicable references in:

- `AUTHORITATIVE_ARCHITECTURE.md`
    
- `README.md`
    
- `report.html`
    
- Architecture indexes
    
- AI navigation files
    

---

# 10. Decision Record Location

Create individual material decision records at:

```text
docs/30-decisions/ADR-NNN-meaningful-title.md
```

The root file:

```text
DECISIONS.md
```

must serve as:

- Durable decision summary
    
- ADR index
    
- Decision-status index
    
- Link to individual records
    
- Record of material decisions that do not require a separate ADR file
    

Do not store material decisions only in:

- Chat
    
- Commit messages
    
- `STATUS.md`
    
- `report.html`
    
- Source-code comments
    

---

# 11. Conditional Engineering Directory Catalog

The architecture and project type determine which technical directories apply.

Approved conditional directories include:

```text
src/
tests/
scripts/
tools/
services/
config/
schemas/
infrastructure/
api/
ui/
data/
migrations/
runbooks/
policy/
current-state/
```

Do not create every directory in every repository.

A documentation-only repository may require none of them.

A web application may require:

```text
src/
tests/
api/
ui/
config/
schemas/
```

An M365 automation may require:

```text
scripts/
config/
schemas/
services/
current-state/
policy/
runbooks/
tests/
```

An Azure infrastructure repository may require:

```text
infrastructure/
config/
scripts/
tests/
schemas/
runbooks/
```

The architecture must justify every selected technical directory.

---

# 12. Conditional Directory Responsibilities

## `src/`

Contains primary application or library source code when a single source root is appropriate.

Do not create `src/` when the selected project structure uses separately owned service, API, or UI roots instead.

## `tests/`

Contains project tests when tests are centralized.

Tests may be colocated with source only when the selected language or framework standard explicitly requires or strongly benefits from colocation.

## `scripts/`

Contains deterministic operational, administrative, migration, validation, read, or write scripts.

Scripts must not become an unstructured replacement for application source code.

## `tools/`

Contains repository-local tooling, generators, reusable utilities, or skill implementations.

## `services/`

Contains service-specific definitions, desired state, configuration boundaries, or independently owned components.

## `config/`

Contains non-secret runtime and environment configuration.

Never store secrets in this directory.

## `schemas/`

Contains canonical local schema copies, JSON Schema, API schema, data schema, configuration schema, and validation definitions.

## `infrastructure/`

Contains infrastructure-as-code definitions.

Use Bicep and Azure Verified Modules where appropriate unless another approved decision applies.

## `api/`

Contains API source, contracts, routing, or interface-specific material when separated from other source.

## `ui/`

Contains user-interface source and assets when separated from other source.

## `data/`

Contains approved non-secret seed data, transformations, fixtures, mappings, or controlled data artifacts.

Do not store sensitive production exports by default.

## `migrations/`

Contains versioned data, schema, configuration, or infrastructure migrations when the project requires them.

## `runbooks/`

Contains actionable operational and recovery procedures when runbooks are substantial enough to justify a root directory.

Otherwise use `docs/60-operations/`.

## `policy/`

Contains machine-readable or human-readable policy defining what is permitted.

## `current-state/`

Contains recorded, verified state captured from an authorized live environment.

It must not be confused with desired state.

---

# 13. Desired-State and Live-State Pattern

For repositories that manage Azure, Microsoft 365, configuration, infrastructure, policy, or another external system, use the applicable structure:

```text
policy/
services/
config/
current-state/
schemas/
scripts/
├── read/
└── write/
```

This structure supports:

```text
Policy
→ Desired state
→ Runtime configuration
→ Plan and diff
→ Live state
→ Recorded applied state
```

## Read and write separation

Use:

```text
scripts/read/
scripts/write/
```

when the project has state-discovery and state-mutation operations.

Read operations must be non-mutating.

Write operations must:

- Require explicit apply mode
    
- Honor applicable plan and `-WhatIf` behavior
    
- Enforce policy
    
- Check drift
    
- Produce evidence
    
- Record applied state
    
- Support recovery
    

Do not create these directories for projects that do not manage external state.

---

# 14. Environment Configuration

Swif7Edge currently uses one live Microsoft environment.

When environment-specific configuration applies, use only the selected environment:

```text
config/commercial/
```

or:

```text
config/gcc-high/
```

Do not automatically create fictional environment directories such as:

```text
config/dev/
config/test/
config/prod/
```

Local build or authentication stubs may exist through explicit runtime configuration, but they do not constitute deployed development or test environments.

Environment-specific behavior must be isolated through configuration rather than scattered conditional code.

---

# 15. Evidence Structure

Create only applicable evidence subdirectories from:

```text
evidence/
├── tests/
├── audits/
├── compliance/
├── deployments/
├── live-verification/
└── screenshots/
```

## `evidence/tests/`

Contains test reports and machine-readable or human-readable validation results that should be retained.

## `evidence/audits/`

Contains independent Slice and Wave audit evidence, drift reviews, and assurance outputs.

## `evidence/compliance/`

Contains framework- or control-related evidence.

## `evidence/deployments/`

Contains approved deployment plans, results, verification, and recovery evidence.

## `evidence/live-verification/`

Contains evidence of verification against authorized live resources.

## `evidence/screenshots/`

Contains screenshot-image evidence when screenshots are required.

Evidence may be organized further by:

- Wave
    
- Slice
    
- Requirement
    
- Control
    
- Release
    
- Date
    

Do not create arbitrary date-only structures that obscure purpose and traceability.

---

# 16. Evidence Rules

Evidence must:

- Identify what claim it supports
    
- Identify when it was created
    
- Identify the producing process or authorized actor
    
- Avoid secrets and credentials
    
- Avoid unnecessary sensitive data
    
- Be immutable or append-only when required
    
- Be traceable to requirements, tests, changes, audits, or controls
    
- Be understandable by an independent reviewer
    

Generated evidence that is too large or inappropriate for Git must be referenced through an approved controlled location.

Do not silently omit evidence solely because it is inconvenient to store.

---

# 17. Standard Naming Conventions

Use lowercase kebab case for directories:

```text
lowercase-directory-name/
```

Use lowercase kebab case for ordinary Markdown files:

```text
meaningful-document-name.md
```

Exceptions include approved root control files:

```text
CLAUDE.md
PROJECT.md
AUTHORITATIVE_ARCHITECTURE.md
DECISIONS.md
BUILD_PATTERN.md
BACKLOG.md
STATUS.md
README.md
```

Use stable prefixes where the artifact standard requires them:

```text
ADR-001-meaningful-title.md
POL-001-meaningful-title.md
PLN-001-meaningful-title.md
FRM-001-meaningful-title.md
```

Do not create inconsistent variations such as:

```text
Architecture/
architecture_docs/
ArchDocs/
```

when the approved location already exists.

---

# 18. Empty Directory Handling

Git does not retain empty directories.

Use:

- Meaningful `_index.md` files for permanent documentation and governance directories
    
- Actual project files for technical directories
    
- Conditional directory creation only when a real file belongs there
    

Do not create meaningless `.gitkeep` files by default.

Do not create technical directories merely to display a complete-looking tree.

---

# 19. File Placement Enforcement

Files must be stored in their approved locations.

Examples:

|Artifact|Approved location|
|---|---|
|Authoritative architecture|Repository root|
|Visual architecture|`docs/10-architecture/`|
|Capability designs|`docs/20-design/`|
|ADRs|`docs/30-decisions/`|
|Supporting requirements|`docs/40-requirements/`|
|Security patterns|`docs/50-security/`|
|Operations documentation|`docs/60-operations/` or `runbooks/`|
|Audit documentation|`docs/70-audit/`|
|References|`docs/80-reference/`|
|Archived documents|`docs/99-archive/`|
|Evidence|`evidence/`|
|Schemas|`schemas/`|
|Infrastructure as code|`infrastructure/`|
|Tests|`tests/` or approved colocated location|
|Runtime configuration|`config/`|
|Recorded live state|`current-state/`|
|Policy|`policy/`|

The AI must not place files wherever convenient when an approved location exists.

---

# 20. Creating New Directories

A new permanent directory may be created only when:

- No approved location fits
    
- The architecture requires a separate responsibility
    
- The purpose is distinct
    
- The location will not duplicate another directory
    
- Naming follows repository standards
    
- Ownership is defined
    
- Navigation is updated when necessary
    
- The decision is recorded when the structure change is material
    

Routine framework-generated directories may be created when required by an approved technical stack.

Do not create organizational structures for hypothetical future capabilities.

---

# 21. Existing Repository Reconciliation

When initializing a repository that already contains files:

1. Inspect the current structure.
    
2. Identify valid project content.
    
3. Identify temporary or generated content.
    
4. Identify duplicated directories.
    
5. Identify naming conflicts.
    
6. Identify files outside approved locations.
    
7. Preserve valid work.
    
8. Move files only when safe and within write authority.
    
9. Update references after approved moves.
    
10. Avoid destructive cleanup.
    
11. Route material conflicts through `DECISIONS.xlsx`.
    

Do not reorganize a working repository solely for visual neatness.

Structure changes must improve authority, safety, navigation, or maintainability.

---

# 22. File and Directory Ownership

Every permanent file or directory with active maintenance responsibilities must have a clear owner.

Ownership may be represented in:

- The initialization manifest
    
- Directory `_index.md`
    
- Scoped AI rules
    
- Architecture
    
- Code ownership configuration when applicable
    

Ownership must identify:

- Primary writer
    
- Allowed contributors
    
- Validation responsibility
    
- Shared-file coordination rules
    
- Prohibited concurrent writes
    

No two active modules or agents may assume unrestricted ownership of the same authoritative file.

---

# 23. Repository Navigation

Create or update:

```text
docs/00-start-here/_index.md
```

It must provide:

- Project entry points
    
- Authority order
    
- Root-file descriptions
    
- Documentation taxonomy
    
- Technical directory map
    
- Evidence location
    
- Decision process
    
- Work-process location
    
- Human report location
    

`README.md` should link to this index rather than duplicating the full repository map.

---

# 24. `README.md` Coordination

This module may provide structural information to the Basic Repository Hygiene module, which owns the final `README.md`.

The README should link to:

- `PROJECT.md`
    
- `AUTHORITATIVE_ARCHITECTURE.md`
    
- `BUILD_PATTERN.md`
    
- `DECISIONS.md`
    
- `BACKLOG.md`
    
- `STATUS.md`
    
- `report.html`
    
- `docs/00-start-here/_index.md`
    

Do not place detailed architecture, requirements, or work history in `README.md`.

---

# 25. `report.html` Coordination

Ensure the repository structure supports generation of:

```text
report.html
```

The report must be able to find:

- Project authority
    
- Architecture
    
- Decisions
    
- Requirements
    
- Work status
    
- Backlog
    
- Evidence
    
- Audits
    
- Designs
    
- Risks
    
- Progress
    
- Recommended next work
    

Do not make `report.html` authoritative over the files from which it is generated.

---

# 26. No Initialization Work Items

Initialization creates the structure needed for future work.

It must not create:

- Backlog items
    
- Waves
    
- Slices
    
- Tasks
    
- Feature recommendations
    
- Implementation milestones
    
- Future roadmap items
    
- Speculative technical debt
    

`BACKLOG.md` must remain in its approved empty state.

`STATUS.md` may state that initialization is underway or complete.

---

# 27. Structure Validation

Before completing this module, verify:

- All required root files exist or are owned by a scheduled module that will create them.
    
- `.claude/` exists.
    
- `docs/` exists.
    
- `evidence/` exists.
    
- The numbered documentation taxonomy exists.
    
- Major documentation directories contain meaningful `_index.md` files.
    
- The visual architecture location is `docs/10-architecture/architecture.html`.
    
- ADRs use `docs/30-decisions/`.
    
- Technical directories are justified by architecture.
    
- No unnecessary technical directories were created.
    
- Environment configuration reflects only the selected live environment.
    
- Desired-state and current-state directories are separated when applicable.
    
- Evidence directories are purpose-based.
    
- Naming conventions are consistent.
    
- No meaningless `.gitkeep` files were created.
    
- Existing valid work was preserved.
    
- Files were not placed in duplicate locations.
    
- `BACKLOG.md` remains empty.
    
- No project work was started.
    
- Repository navigation is understandable without chat history.
    
- No file outside the repository was modified.
    

---

# 28. Completion Criteria

This module is complete when:

- The standardized root control plane exists.
    
- The standard documentation taxonomy exists.
    
- Applicable technical directories exist.
    
- Inapplicable technical directories were not created.
    
- Architecture visuals and ADR locations are standardized.
    
- Evidence organization is established.
    
- Environment configuration reflects the actual selected environment.
    
- Desired-state and live-state structures exist when applicable.
    
- Directory indexes explain purpose and authority.
    
- Existing work has been safely reconciled.
    
- File placement is predictable.
    
- Validation passes.
    

---

# 29. Module Completion Report

Report to the Primary Orchestrator:

```text
MODULE_STATUS:
MODULE_ID: repository_structure
ROOT_FILES_CONFIRMED:
CORE_DIRECTORIES_CREATED:
DOCUMENTATION_DIRECTORIES_CREATED:
TECHNICAL_DIRECTORIES_CREATED:
TECHNICAL_DIRECTORIES_SKIPPED:
EVIDENCE_DIRECTORIES_CREATED:
INDEX_FILES_CREATED:
FILES_MOVED:
CONFLICTS_IDENTIFIED:
QUESTIONS_ADDED:
BACKLOG_EMPTY:
VALIDATION_PERFORMED:
VALIDATION_RESULT:
BLOCKING_ISSUES:
```

Do not ask user questions in the completion report.