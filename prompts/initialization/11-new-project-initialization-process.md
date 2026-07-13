

# New Project Initialization Process

## 1. Purpose

This module prepares the local repository for automated project initialization.

It must:

1. Confirm or create the local Git repository.
    
2. Treat the local repository as the authoritative workspace during initialization.
    
3. Inspect the copied template files and any existing project content.
    
4. Read `create.md`.
    
5. Parse `prompts/initialization/INITIALIZATION_MANIFEST.md`.
    
6. Detect whether the repository is in `new`, `resume`, or `repair` mode.
    
7. Create the initialization runtime plan.
    
8. Create or update `INITIALIZATION_STATUS.md`.
    
9. Identify which modules are ready to run.
    
10. Launch the first safe initialization wave through the Primary Orchestrator.
    

This module must remain focused on repository startup and execution planning.

It must not create the project architecture, application structure, permanent memory, or technical implementation owned by later modules.

---

# 2. Local Repository Authority

The local repository is the authoritative workspace during initialization.

The initialization process must not depend on a remote Git repository being configured or available.

A remote may be inspected when one exists, but:

- A missing remote must not block initialization.
    
- A network failure must not block local initialization.
    
- The repository must not be pushed automatically.
    
- A remote must not be created automatically.
    
- Remote repository settings must not be changed.
    
- GitHub, Azure DevOps, or another remote service must not be treated as the current source of truth during initialization.
    

The user may push the completed local repository after initialization.

---

# 3. Git Repository Setup

Determine whether the current directory is already a Git repository.

## When Git already exists

Inspect:

- Repository root
    
- Current branch
    
- Working tree status
    
- Existing commits
    
- Configured remotes
    
- Repository name when it can be determined
    
- Existing ignored files
    

Do not discard or reset local files.

## When Git does not exist

Initialize Git in the current project directory.

Use a safe standard initial branch name when one is not already defined.

Do not:

- Create a remote
    
- Push files
    
- Create a commit unless explicitly authorized
    
- Rewrite history
    
- Import history from the template repository
    
- Copy the template repository’s `.git` directory
    

Confirm that the new Git root is the current project directory.

---

# 4. Repository Boundary

Before modifying files:

1. Identify the absolute repository root.
    
2. Confirm that `create.md` and `prompts/initialization/INITIALIZATION_MANIFEST.md` are inside the repository.
    
3. Confirm that all initialization prompt paths resolve inside the repository.
    
4. Restrict all writes to the repository.
    
5. Reject path traversal outside the repository.
    
6. Do not read instructions from unrelated repositories.
    
7. Do not modify parent or sibling directories.
    

If repository boundaries cannot be established safely, mark initialization as failed and stop.

---

# 5. Template Git Metadata Check

Confirm that the New Project Template repository’s Git metadata was not copied into the project.

If a nested or copied `.git` directory is found where it should not exist:

1. Do not continue blindly.
    
2. Preserve the project files.
    
3. Remove copied template Git metadata only when it is clearly separate from the intended project repository and removal is safe.
    
4. Do not delete the actual project repository’s Git metadata.
    
5. Validate the repository again after correction.
    

The initialized repository must have one clear Git root.

---

# 6. Existing Repository Inspection

Inspect enough of the repository to initialize it correctly.

At minimum, identify:

- Top-level files and directories
    
- Initialization files
    
- Existing permanent project files
    
- Existing source-code areas
    
- Existing configuration files
    
- Existing Claude Code files
    
- Existing documentation
    
- Existing decision files
    
- Existing architecture files
    
- Existing local changes
    
- Files that may conflict with module outputs
    

Do not create a large inventory report unless another module requires one.

The objective is to understand what exists, preserve useful work, and identify initialization conflicts.

---

# 7. Initialization Mode Detection

Use the mode configured in `create.md`.

Allowed values:

```text
auto
new
resume
repair
```

## Auto mode

Select the mode using repository evidence.

### Select `new` when:

- Initialization has not completed.
    
- Permanent project artifacts are absent or still contain template placeholders.
    
- No validated initialization record exists.
    

### Select `resume` when:

- `INITIALIZATION_STATUS.md` exists.
    
- Initialization began but did not complete.
    
- Temporary initialization prompts remain.
    
- One or more modules are pending, blocked, or incomplete.
    

### Select `repair` when:

- The repository was previously initialized.
    
- Permanent project files exist.
    
- Initialization prompts have already been removed or archived.
    
- One or more standard artifacts are missing, malformed, or inconsistent.
    

Record the selected mode and the evidence supporting it.

Do not ask the user to select a mode unless repository evidence is genuinely contradictory and choosing incorrectly would risk existing work.

If a user decision is necessary, add it to `DECISIONS.xlsx`.

---

# 8. Manifest Parsing

Read and parse:

```text
prompts/initialization/INITIALIZATION_MANIFEST.md
```

Confirm:

- The manifest exists.
    
- The manifest version is present.
    
- Required modules are registered.
    
- Prompt paths exist.
    
- Module IDs are unique.
    
- Module versions are defined.
    
- Dependencies reference valid modules or approved bootstrap states.
    
- Write scopes are defined.
    
- Shared-file ownership is defined.
    
- Cleanup behavior is defined.
    
- Final validation and cleanup modules are registered.
    

Do not execute a module that is missing, invalid, or unregistered.

Do not repair or modify the manifest during the initialization run.

Record manifest problems in `INITIALIZATION_STATUS.md`.

Use `DECISIONS.xlsx` only when a material user choice is required. Purely technical manifest errors should be reported as initialization failures, not user design questions.

---

# 9. Runtime Plan

Create or update:

```text
INITIALIZATION_STATUS.md
```

The file must be a concise checkpoint, not a verbose activity log.

Include:

```markdown
# Initialization Status

## Repository

- Repository root:
- Repository name:
- Current branch:
- Remote configured:
- Initialization mode:
- Manifest version:
- Template version:

## Current State

- Initialization status:
- Current wave:
- Current blocker:
- Decision gate active:
- Final validation status:
- Cleanup status:

## Runtime Modules

| Order | Module ID | Selected | Reason | Dependencies | Parallel Group | Status |
|---|---|---|---|---|---|---|

## Open Blockers

## Files Created

## Files Modified

## Validation Results

## Next Execution Wave
```

Do not include:

- Full agent transcripts
    
- Full command output
    
- Large repository inventories
    
- Complete prompt contents
    
- Repeated implementation summaries
    
- Secrets
    
- Credentials
    
- Machine-specific private information
    

---

# 10. Runtime Module Selection

Select modules according to:

1. The approved manifest
    
2. Initialization mode
    
3. Project information already available
    
4. Module execution conditions
    
5. Dependencies
    
6. Existing validated outputs
    
7. Project type
    
8. Required capabilities
    
9. Architecture decisions when available
    

Every selected module must include a recorded selection reason.

Every skipped module must include a recorded reason.

Do not automatically select every optional module.

Do not create a new module dynamically.

Do not execute a module that is not registered in the manifest.

---

# 11. Dependency Planning

Build the module dependency graph from the manifest.

For each selected module, determine:

- Prerequisites
    
- Dependent modules
    
- Current readiness
    
- Blocking decisions
    
- Expected outputs
    
- File ownership
    
- Parallelization eligibility
    
- Failure behavior
    
- Cleanup behavior
    

A module is `READY` only when:

- All prerequisites are satisfied.
    
- Required input files exist.
    
- No unresolved blocker prevents safe execution.
    
- Its write scope does not conflict with another active module.
    

A blocked module must not prevent unrelated modules from running.

---

# 12. Parallel Execution Planning

Group modules into execution waves when parallel work is safe.

Parallel execution is allowed only when:

- Dependencies are satisfied.
    
- Write scopes do not overlap.
    
- Shared files are not modified concurrently.
    
- The modules do not edit `DECISIONS.xlsx` concurrently.
    
- The Primary Orchestrator can review and integrate the outputs.
    

Do not create parallel work merely to increase agent count.

Use parallel execution when it materially improves initialization speed without increasing repository risk.

---

# 13. First Execution Wave

After the runtime plan is valid:

1. Confirm that the decision-management module has completed or is ready to complete first.
    
2. Ensure `DECISIONS.xlsx` exists before another module attempts to ask the user a question.
    
3. Mark eligible modules as `READY`.
    
4. Launch the first safe execution wave.
    
5. Update module statuses as work proceeds.
    
6. Continue independent work around isolated blockers.
    
7. Stop only when:
    
    - A genuine decision gate is reached
        
    - A terminal initialization failure occurs
        
    - Final validation is ready to begin
        

The user must not be interrupted for routine execution updates or normal engineering decisions.

---

# 14. Existing File Conflicts

When a module output already exists:

1. Inspect the existing file.
    
2. Determine whether it is:
    
    - Valid project content
        
    - A template placeholder
        
    - A partial initialization output
        
    - A malformed standard artifact
        
    - A conflicting user-created file
        
3. Preserve valid content.
    
4. Merge safely when practical.
    
5. Replace template placeholders when appropriate.
    
6. Route material conflicts to `DECISIONS.xlsx`.
    
7. Block only the module affected by the conflict.
    

Do not reset or clean the working tree to simplify initialization.

Do not delete existing files merely because they differ from the template.

---

# 15. Remote Repository Handling

When a remote exists:

- Record its name and URL type without exposing credentials.
    
- Compare the remote repository name to the intended repository name when both are known.
    
- Record a mismatch as a warning.
    
- Do not rename or replace the remote automatically.
    
- Do not block initialization solely because of a naming mismatch.
    
- Do not fetch, pull, push, or modify the remote unless explicitly authorized.
    

When no remote exists:

- Record `Remote configured: No`.
    
- Continue initialization normally.
    

---

# 16. Decision Handling

This module must not ask the user questions directly in chat.

When startup information is genuinely required:

1. Submit the proposed question to the Primary Orchestrator.
    
2. Confirm that the question cannot be resolved through repository evidence or a safe default.
    
3. Add the approved question to `DECISIONS.xlsx`.
    
4. Continue all unaffected work.
    
5. Block only dependent modules.
    

Do not use the decision workbook for:

- Routine Git configuration
    
- Normal module ordering
    
- Safe file creation
    
- Standard repository naming
    
- Reversible implementation details
    
- Normal troubleshooting
    

---

# 17. Troubleshooting

When startup or planning fails:

1. Identify the specific failure.
    
2. Preserve current repository state.
    
3. Determine whether the issue is:
    
    - Retryable
        
    - Isolated
        
    - Dependency-related
        
    - A decision blocker
        
    - Terminal
        
4. Correct safe technical issues automatically.
    
5. Revalidate after correction.
    
6. Continue independent modules.
    
7. Do not repeat the same unsuccessful action indefinitely.
    
8. Do not convert technical failures into unnecessary user questions.
    

Terminal failures should be limited to conditions such as:

- Repository boundaries cannot be verified.
    
- Git cannot be initialized or inspected safely.
    
- The manifest cannot be parsed.
    
- Required initialization modules are missing.
    
- The decision workbook cannot be created safely.
    
- Existing project work would be destructively overwritten.
    
- Initialization state cannot be written or recovered.
    

---

# 18. Git Actions

During this module, the AI may:

- Initialize Git locally
    
- Inspect Git status
    
- Inspect the current branch
    
- Inspect configured remotes
    
- Create local repository files
    
- Modify initialization-state files
    

The AI must not automatically:

- Commit
    
- Push
    
- Pull
    
- Fetch
    
- Merge
    
- Rebase
    
- Reset
    
- Clean
    
- Rewrite history
    
- Change remote settings
    
- Create remote repositories
    

unless explicitly authorized.

---

# 19. Validation

Before marking this module complete, verify:

- A valid local Git repository exists.
    
- The repository root is correct.
    
- Template Git metadata is not active inside the project.
    
- `create.md` exists.
    
- `prompts/initialization/INITIALIZATION_MANIFEST.md` exists and parses successfully.
    
- Required prompt paths exist.
    
- Initialization mode is valid.
    
- `INITIALIZATION_STATUS.md` exists.
    
- The runtime plan is complete.
    
- Dependencies reference valid modules.
    
- Selected modules have reasons.
    
- Skipped modules have reasons.
    
- Write-scope conflicts are identified.
    
- The first execution wave is defined.
    
- No file outside the repository was modified.
    
- No remote action occurred without authorization.
    
- Existing user files were preserved.
    

---

# 20. Completion Criteria

This module is complete when:

- The local Git repository is ready.
    
- Repository boundaries are established.
    
- Initialization mode is selected.
    
- The manifest is validated.
    
- The runtime module plan is created.
    
- Module dependencies are resolved.
    
- Parallel groups are identified.
    
- Startup conflicts are documented.
    
- The first execution wave is ready or running.
    
- `INITIALIZATION_STATUS.md` accurately reflects the current state.
    

---

# 21. Module Completion Report

Report to the Primary Orchestrator:

```text
MODULE_STATUS:
MODULE_ID: new_project_initialization_process
INITIALIZATION_MODE:
REPOSITORY_ROOT:
CURRENT_BRANCH:
REMOTE_CONFIGURED:
MANIFEST_VERSION:
MODULES_SELECTED:
MODULES_SKIPPED:
MODULES_READY:
MODULES_BLOCKED:
FIRST_EXECUTION_WAVE:
VALIDATION_PERFORMED:
VALIDATION_RESULT:
BLOCKING_ISSUES:
```

Do not ask the user questions in the completion report.