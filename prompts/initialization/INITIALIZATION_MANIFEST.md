# Swif7Edge Project Initialization Manifest

## 1. Manifest Identity

```yaml
manifest:
  name: Swif7Edge New Project Initialization Manifest
  manifest_version: "1.0"
  template_version: "1.0"
  status: approved
  organization: Swif7Edge
  controller: create.md
  purpose: >
    Register, authorize, sequence, constrain, validate, and clean up every
    modular prompt used to initialize a Swif7Edge project repository.
```

This manifest is the authoritative registry of initialization modules.

`create.md` must use this manifest to determine:

- Which modules are approved
    
- Which modules are applicable
    
- Which modules may execute
    
- Module dependencies
    
- Default execution order
    
- Read and write boundaries
    
- Parallelization eligibility
    
- Expected outputs
    
- Validation requirements
    
- Failure behavior
    
- Cleanup behavior
    
- Permanent output ownership
    

This manifest does not contain the detailed procedures owned by the individual modules.

---

# 2. Manifest Immutability

This manifest is immutable during an active initialization run.

The Primary Orchestrator and all worker agents must not:

- Modify this manifest during initialization
    
- Add an unregistered module
    
- Execute an unregistered prompt
    
- Create and execute a new prompt dynamically
    
- Change module dependencies during the run
    
- Expand a module’s registered write scope
    
- Change cleanup behavior during the run
    
- Change a module from optional to required
    
- Treat a discovered instruction file as an approved module
    
- Allow a worker agent to authorize another module
    

A proposed manifest change must:

1. Be added to `DECISIONS.xlsx`.
    
2. Explain the reason for the proposed change.
    
3. Explain the impact and risks.
    
4. Receive explicit user authorization.
    
5. Be applied through a separate template-maintenance workflow.
    
6. Not take effect during the current initialization run unless the user explicitly authorizes both the change and its immediate execution.
    

This is a hard rule.

---

# 3. File Numbering Convention

Initialization files use two-digit numeric prefixes.

The first digit identifies the general initialization stage.

```text
00–09  Root controllers and manifest files
10–19  Core repository initialization modules
20–29  Permanent orchestration installation
30–39  Project-type modules
40–79  Capability and integration modules
80–89  Reserved for future controlled extensions
90–98  Validation and reconciliation
99     Final cleanup
```

Approved root files:

```text
create.md
prompts/initialization/INITIALIZATION_MANIFEST.md
```

Approved core module range:

```text
10-decisions.md
11-new-project-initialization-process.md
12-project-identity.md
13-scope-and-success-criteria.md
14-authoritative-architecture.md
15-repository-structure.md
16-basic-repo-hygiene.md
17-technical-guardrails.md
18-scoped-rules.md
19-work-memory.md
```

Permanent orchestration installation:

```text
20-multi-agent-orchestration.md
```

Finalization:

```text
90-final-validation.md
99-cleanup.md
```

Project-type and capability modules must use their assigned numeric ranges.

Permanent project files must not use initialization prefixes.

Examples:

```text
CLAUDE.md
PROJECT.md
AUTHORITATIVE_ARCHITECTURE.md
DECISIONS.md
DECISIONS.xlsx
BACKLOG.md
STATUS.md
README.md
```

---

# 4. Global Platform Policy

All Swif7Edge engineering repositories must follow the platform policy below.

```yaml
platform_policy:
  organization: Swif7Edge

  productivity_and_enterprise_platform:
    required_platform:
      - Microsoft 365

  cloud_platform:
    allowed:
      - Microsoft Azure
    prohibited:
      - Amazon Web Services
      - Google Cloud Platform
      - Oracle Cloud Infrastructure
      - Other public cloud platforms
    rule: >
      When cloud infrastructure or cloud services are applicable, the project
      must use Microsoft Azure.

  microsoft_environment:
    allowed:
      - Commercial
      - GCC High
    selection_required_when:
      - application development
      - web application development
      - automation
      - Microsoft 365 integration
      - Microsoft Graph integration
      - Azure deployment
      - cloud engineering
      - identity integration
      - data processing using Microsoft services
      - infrastructure engineering
    selection_not_required_when:
      - the repository is documentation-only
      - the repository has no Microsoft service integration
      - the environment selection cannot affect the current architecture

  service_preference:
    prefer_azure_native: true
    prefer_microsoft_native: true
    third_party_services_allowed_when:
      - Azure has no suitable native capability
      - the third-party capability provides a material and documented advantage
      - use does not violate security or compliance requirements
      - any paid or materially consequential choice is approved through DECISIONS.xlsx

  identity:
    default_provider: Microsoft Entra ID
    alternate_provider_policy: explicit_user_decision_required

  microsoft_365_integration:
    default_api: Microsoft Graph
    alternate_interface_policy: >
      Another interface may be used only when Microsoft Graph does not support
      the required capability or when a documented technical constraint
      justifies the exception.

  secrets:
    preferred_service: Azure Key Vault

  monitoring:
    preferred_services:
      - Azure Monitor
      - Application Insights
      - Log Analytics

  infrastructure_as_code:
    preferred_options:
      - Bicep
      - Azure Verified Modules
    terraform_policy: >
      Terraform may be considered only when a documented interoperability or
      organizational requirement justifies it and the user approves the choice.

  non_azure_cloud_policy: prohibited
```

The platform policy does not require every repository to deploy Azure resources.

It requires Azure when cloud infrastructure or cloud services are applicable.

The architecture module must not add unnecessary Azure services merely because Azure is the approved cloud platform.

---

# 5. Microsoft Environment Decision Rule

When a project involves engineering, application development, automation, Microsoft 365 integration, Azure deployment, identity, data processing, or infrastructure, the applicable Microsoft environment must be established as:

```text
Commercial
GCC High
```

If the environment is not already known:

1. Add one question to `DECISIONS.xlsx`.
    
2. Explain how the environment affects architecture, endpoints, licensing, compliance, service availability, and deployment.
    
3. Provide a recommendation based on available project information.
    
4. Do not ask the question in chat.
    
5. Continue work that is independent of the environment selection.
    
6. Block only the modules whose outputs depend on the answer.
    

Do not automatically select GCC High solely because the project is related to government contracting.

Do not automatically select Commercial when controlled information, contractual requirements, or future migration requirements materially affect the project.

---

# 6. Global Execution Rules

Every module must follow these rules:

1. Execute only when registered in this manifest.
    
2. Execute only when its prerequisites are satisfied.
    
3. Remain within its registered read and write scopes.
    
4. Report issues outside its scope to the Primary Orchestrator.
    
5. Never silently modify a file owned by another module.
    
6. Use `DECISIONS.xlsx` for all user questions.
    
7. Continue safe work around isolated blockers.
    
8. Block only dependent modules.
    
9. Validate outputs before reporting completion.
    
10. Preserve existing valid repository content.
    
11. Avoid speculative architecture and unnecessary files.
    
12. Avoid installing dependencies unless authorized.
    
13. Avoid deployment unless explicitly authorized.
    
14. Avoid Git commits and pushes unless explicitly authorized.
    
15. Avoid creating cloud resources during repository initialization unless expressly authorized.
    
16. Use the safest supported implementation method.
    
17. Record material durable decisions in `DECISIONS.md`.
    
18. Remove temporary initialization prompts after successful initialization.
    
19. Keep only permanent project outputs and the concise initialization record.
    
20. Never treat an agent’s completion statement as proof of completion.
    

---

# 7. Runtime Plan Requirement

Before executing any module, `create.md` must create a normalized runtime plan in:

```text
INITIALIZATION_STATUS.md
```

For each module, record:

```yaml
runtime_module:
  id:
  prompt_path:
  selected:
  selection_reason:
  required:
  prerequisites:
  dependent_modules:
  default_order:
  planned_parallel_group:
  read_scope:
  write_scope:
  expected_outputs:
  validation_required:
  failure_policy:
  cleanup_behavior:
  current_status:
```

The runtime plan must identify:

- Selected modules
    
- Excluded modules
    
- Reasons for selection or exclusion
    
- Dependency graph
    
- Planned parallel groups
    
- Shared-file ownership
    
- Decision blockers
    
- Expected permanent outputs
    
- Expected temporary outputs
    
- Cleanup sequence
    

The runtime plan may be updated as module statuses change.

The manifest itself must not be updated.

---

# 8. Supported Initialization Modes

Allowed modes:

```yaml
initialization_modes:
  - auto
  - new
  - resume
  - repair
```

## Auto

Determine the correct mode from repository evidence.

## New

Initialize a blank or newly cloned project repository.

## Resume

Resume an interrupted initialization from the last validated state.

## Repair

Inspect and repair an initialized repository without rebuilding valid project work.

Repair mode may:

- Restore missing standard files
    
- Repair malformed standard files
    
- Reconcile inconsistent project memory
    
- Restore required scoped rules
    
- Restore the decision workbook
    
- Repair broken references
    
- Validate permanent orchestration
    
- Propose template upgrades through `DECISIONS.xlsx`
    

Repair mode must not:

- Automatically apply a newer template version
    
- Replace valid project-specific architecture
    
- Delete application code
    
- Reinitialize the repository
    
- Recreate removed initialization prompts unless explicitly authorized
    
- Apply manifest upgrades without a user decision
    

---

# 9. Standard Module Status Values

```yaml
module_status_values:
  - PENDING
  - READY
  - RUNNING
  - COMPLETE
  - COMPLETE_WITH_WARNINGS
  - DEFERRED
  - BLOCKED_BY_DECISION
  - BLOCKED_BY_DEPENDENCY
  - FAILED_RETRYABLE
  - FAILED_TERMINAL
  - SKIPPED_NOT_APPLICABLE
```

A module may be marked `COMPLETE` only when:

- Required outputs exist
    
- Required validation passed
    
- No unauthorized files were modified
    
- All created questions were routed through `DECISIONS.xlsx`
    
- Required status information was recorded
    

---

# 10. Allowed Failure Policies

```yaml
failure_policies:
  - block_dependents
  - retry_then_block_dependents
  - continue_with_warning
  - skip_if_not_applicable
  - terminal_initialization_failure
```

## `block_dependents`

Block only modules that require the failed output.

## `retry_then_block_dependents`

Apply the authorized retry and troubleshooting process, then block only dependent modules if unresolved.

## `continue_with_warning`

Allow initialization to continue when the failure does not compromise repository readiness.

## `skip_if_not_applicable`

Skip the module when its structured execution conditions are not satisfied.

## `terminal_initialization_failure`

Stop initialization because the repository cannot be safely or reliably completed.

Use terminal failure only for conditions such as:

- The Git repository cannot be verified
    
- The manifest cannot be parsed
    
- The decision workbook cannot be created or safely repaired
    
- Permanent project files would be destructively overwritten
    
- Final validation fails materially
    
- Cleanup would remove required permanent outputs
    
- Repository integrity cannot be established
    

---

# 11. Cleanup Behavior Values

```yaml
cleanup_behavior_values:
  - retain
  - remove_after_initialization
  - convert_to_permanent_output
```

## `retain`

The source file remains after initialization.

## `remove_after_initialization`

The source file is deleted after successful final validation.

## `convert_to_permanent_output`

The source prompt is removed after its durable rules or outputs have been installed and validated in permanent project files.

Default:

```yaml
default_prompt_cleanup: remove_after_initialization
```

All initialization prompts must be removed unless this manifest explicitly states otherwise.

---

# 12. Shared-File Ownership

Only the primary owning module may perform final reconciled writes to a shared permanent file.

```yaml
shared_file_ownership:
  DECISIONS.xlsx: decision_management
  DECISIONS.md: decision_management
  PROJECT.md: scope_and_success_criteria
  AUTHORITATIVE_ARCHITECTURE.md: authoritative_architecture
  repository_directories: repository_structure
  .gitignore: basic_repo_hygiene
  .gitattributes: basic_repo_hygiene
  .editorconfig: basic_repo_hygiene
  README.md: basic_repo_hygiene
  .claude/settings.json: technical_guardrails
  .claude/rules: scoped_rules
  CLAUDE.md: work_memory
  BACKLOG.md: work_memory
  STATUS.md: work_memory
  permanent_orchestration_rules: multi_agent_orchestration
  INITIALIZATION_RECORD.md: cleanup
```

A non-owning module may:

- Identify a required change
    
- Produce a structured change proposal
    
- Identify affected sections
    
- Provide evidence
    
- Report the proposal to the Primary Orchestrator
    

A non-owning module must not directly modify an owned shared file unless:

- The manifest explicitly grants shared write authority
    
- The owning module is invoked to reconcile the change
    
- The Primary Orchestrator establishes a non-overlapping controlled write procedure
    

Final validation must route corrections through the owning module whenever practical.

---

# 13. Core Module Registry

```yaml
modules:

  - id: decision_management
    name: Decision Management
    prompt_path: prompts/initialization/10-decisions.md
    version: "1.0"
    category: decision-management
    required: true
    executable: true
    default_order: 10
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - repository_verified
      - manifest_parsed
    execution_conditions:
      always: true
    read_scope:
      - create.md
      - prompts/initialization/INITIALIZATION_MANIFEST.md
      - INITIALIZATION_STATUS.md
      - DECISIONS.xlsx
      - DECISIONS.md
      - PROJECT.md
      - AUTHORITATIVE_ARCHITECTURE.md
      - CLAUDE.md
      - STATUS.md
    write_scope:
      - DECISIONS.xlsx
      - DECISIONS.md
    prohibited_scope:
      - application source code
      - infrastructure resources
      - Git history
      - files outside the repository
    expected_outputs:
      - DECISIONS.xlsx
      - DECISIONS.md
    validation_required:
      - workbook_opens
      - required_workbook_structure_exists
      - decision_queue_contains_only_open_questions
      - markdown_decision_record_is_valid
      - user_answers_are_preserved
    parallelization:
      eligible: false
      reason: >
        The decision interface must exist before other modules may create user
        questions.
    failure_policy: terminal_initialization_failure
    decision_behavior: owns_decision_interface
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - DECISIONS.xlsx
      - DECISIONS.md

  - id: new_project_initialization_process
    name: New Project Initialization Process
    prompt_path: prompts/initialization/11-new-project-initialization-process.md
    version: "1.0"
    category: bootstrap
    required: true
    executable: true
    default_order: 11
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - decision_management
    execution_conditions:
      always: true
    read_scope:
      - repository tree
      - Git metadata
      - create.md
      - prompts/initialization/INITIALIZATION_MANIFEST.md
      - INITIALIZATION_STATUS.md
      - DECISIONS.xlsx
    write_scope:
      - INITIALIZATION_STATUS.md
    prohibited_scope:
      - permanent project architecture
      - application source code
      - cloud resources
      - Git history
    expected_outputs:
      - normalized runtime plan
      - initialization mode
      - repository verification record
      - selected module plan
    validation_required:
      - repository_root_verified
      - initialization_mode_valid
      - runtime_plan_complete
      - module_dependencies_resolved
    parallelization:
      eligible: false
      reason: >
        This module establishes the normalized execution state used by all
        later modules.
    failure_policy: terminal_initialization_failure
    cleanup_behavior: remove_after_initialization
    permanent_outputs: []

  - id: project_identity
    name: Project Identity
    prompt_path: prompts/initialization/12-project-identity.md
    version: "1.0"
    category: project-definition
    required: true
    executable: true
    default_order: 12
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - decision_management
      - new_project_initialization_process
    execution_conditions:
      always: true
    read_scope:
      - create.md
      - DECISIONS.xlsx
      - DECISIONS.md
      - existing repository content
      - INITIALIZATION_STATUS.md
    write_scope:
      - project identity working artifact
      - structured proposals for PROJECT.md
    prohibited_scope:
      - AUTHORITATIVE_ARCHITECTURE.md
      - repository directories
      - application source code
    expected_outputs:
      - normalized project identity
      - project naming standard
      - project type classification
    validation_required:
      - project_name_consistent
      - repository_name_consistent
      - no_invented_identity_fields
      - unresolved_material_identity_questions_queued
    parallelization:
      eligible: false
      reason: >
        Scope and architecture depend on a normalized project identity.
    failure_policy: retry_then_block_dependents
    cleanup_behavior: remove_after_initialization
    permanent_outputs: []

  - id: scope_and_success_criteria
    name: Scope and Success Criteria
    prompt_path: prompts/initialization/13-scope-and-success-criteria.md
    version: "1.0"
    category: project-definition
    required: true
    executable: true
    default_order: 13
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - project_identity
    execution_conditions:
      always: true
    read_scope:
      - normalized project identity
      - create.md
      - DECISIONS.xlsx
      - DECISIONS.md
      - existing project documents
    write_scope:
      - PROJECT.md
    prohibited_scope:
      - AUTHORITATIVE_ARCHITECTURE.md
      - application source code
      - repository directories
    expected_outputs:
      - PROJECT.md
    validation_required:
      - purpose_defined
      - scope_defined
      - exclusions_defined_or_marked_unknown
      - success_criteria_defined
      - acceptance_criteria_defined
      - assumptions_not_presented_as_facts
    parallelization:
      eligible: false
      reason: >
        Authoritative architecture requires validated project scope and success
        criteria.
    failure_policy: retry_then_block_dependents
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - PROJECT.md

  - id: authoritative_architecture
    name: Authoritative Architecture
    prompt_path: prompts/initialization/14-authoritative-architecture.md
    version: "1.0"
    category: architecture
    required: true
    executable: true
    default_order: 14
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - project_identity
      - scope_and_success_criteria
    execution_conditions:
      always: true
    read_scope:
      - PROJECT.md
      - DECISIONS.xlsx
      - DECISIONS.md
      - platform policy
      - existing architecture files
      - existing repository content
    write_scope:
      - AUTHORITATIVE_ARCHITECTURE.md
    prohibited_scope:
      - application source code
      - cloud resource deployment
      - repository directory creation
    expected_outputs:
      - AUTHORITATIVE_ARCHITECTURE.md
    validation_required:
      - approved_and_proposed_architecture_distinguished
      - Microsoft_environment_resolved_when_required
      - Azure_only_policy_followed
      - Entra_ID_default_applied_when_authentication_required
      - architecture_supports_PROJECT.md
      - material_open_decisions_queued
    parallelization:
      eligible: false
      reason: >
        Repository structure and several control modules depend on the approved
        architecture.
    failure_policy: retry_then_block_dependents
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - AUTHORITATIVE_ARCHITECTURE.md

  - id: repository_structure
    name: Repository Structure
    prompt_path: prompts/initialization/15-repository-structure.md
    version: "1.0"
    category: repository-foundation
    required: true
    executable: true
    default_order: 15
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - authoritative_architecture
    execution_conditions:
      always: true
    read_scope:
      - PROJECT.md
      - AUTHORITATIVE_ARCHITECTURE.md
      - DECISIONS.md
      - existing repository tree
    write_scope:
      - approved repository directories
      - approved directory-level README or placeholder files
    prohibited_scope:
      - files outside approved architecture
      - cloud resources
      - Git history
      - speculative application scaffolding
    expected_outputs:
      - architecture-driven repository structure
    validation_required:
      - every_directory_has_approved_purpose
      - no_unjustified_empty_directories
      - no_non_Azure_cloud_structure
      - repository_structure_matches_architecture
      - existing_user_files_preserved
    parallelization:
      eligible: false
      reason: >
        Directory creation must complete before path-scoped rules and some
        project-type modules are generated.
    failure_policy: retry_then_block_dependents
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - approved repository directories

  - id: basic_repo_hygiene
    name: Basic Repository Hygiene
    prompt_path: prompts/initialization/16-basic-repo-hygiene.md
    version: "1.0"
    category: repository-foundation
    required: true
    executable: true
    default_order: 16
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - new_project_initialization_process
    execution_conditions:
      always: true
    read_scope:
      - repository tree
      - PROJECT.md
      - AUTHORITATIVE_ARCHITECTURE.md
      - existing configuration files
    write_scope:
      - .gitignore
      - .gitattributes
      - .editorconfig
      - README.md
    prohibited_scope:
      - application source code
      - cloud resources
      - Git remote settings
      - Git history
    expected_outputs:
      - .gitignore
      - .gitattributes
      - .editorconfig
      - README.md
    validation_required:
      - secrets_excluded
      - local_Claude_settings_excluded
      - line_endings_normalized
      - encoding_defined
      - README_matches_initialized_project
      - no_irrelevant_framework_patterns
    parallelization:
      eligible: true
      parallel_group: repository_foundation
      conflicts_with:
        - work_memory
    failure_policy: retry_then_block_dependents
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - .gitignore
      - .gitattributes
      - .editorconfig
      - README.md

  - id: technical_guardrails
    name: Technical Guardrails
    prompt_path: prompts/initialization/17-technical-guardrails.md
    version: "1.0"
    category: guardrails
    required: true
    executable: true
    default_order: 17
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - authoritative_architecture
      - basic_repo_hygiene
    execution_conditions:
      always: true
    read_scope:
      - PROJECT.md
      - AUTHORITATIVE_ARCHITECTURE.md
      - DECISIONS.md
      - repository configuration
      - existing Claude settings
    write_scope:
      - .claude/settings.json
      - structured proposals for scoped rules
    prohibited_scope:
      - application source code
      - credentials
      - cloud deployment
      - broad command authorization
    expected_outputs:
      - .claude/settings.json
      - technical guardrail specification
    validation_required:
      - settings_json_valid
      - supported_settings_only
      - secret_access_restricted
      - destructive_actions_restricted
      - no_broad_permissions
      - Azure_and_M365_policy_consistent
    parallelization:
      eligible: false
      reason: >
        Scoped rules and permanent orchestration depend on validated guardrails.
    failure_policy: retry_then_block_dependents
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - .claude/settings.json

  - id: scoped_rules
    name: Scoped Rules
    prompt_path: prompts/initialization/18-scoped-rules.md
    version: "1.0"
    category: guardrails
    required: true
    executable: true
    default_order: 18
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - repository_structure
      - technical_guardrails
    execution_conditions:
      always: true
    read_scope:
      - PROJECT.md
      - AUTHORITATIVE_ARCHITECTURE.md
      - DECISIONS.md
      - repository structure
      - technical guardrail specification
    write_scope:
      - .claude/rules/**
    prohibited_scope:
      - CLAUDE.md
      - application source code
      - cloud resources
    expected_outputs:
      - .claude/rules/workflow.md
      - .claude/rules/security.md
      - .claude/rules/documentation.md
      - other justified project-specific scoped rules
    validation_required:
      - no_duplicate_root_rules
      - path_scopes_valid
      - no_conflicting_rules
      - project_specific_rules_justified
      - direct_chat_questions_prohibited
    parallelization:
      eligible: false
      reason: >
        Permanent work memory and orchestration must reference the completed
        scoped-rule architecture.
    failure_policy: retry_then_block_dependents
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - .claude/rules/**

  - id: work_memory
    name: Work Memory
    prompt_path: prompts/initialization/19-work-memory.md
    version: "1.0"
    category: memory
    required: true
    executable: true
    default_order: 19
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - project_identity
      - scope_and_success_criteria
      - authoritative_architecture
      - repository_structure
      - technical_guardrails
      - scoped_rules
    execution_conditions:
      always: true
    read_scope:
      - PROJECT.md
      - AUTHORITATIVE_ARCHITECTURE.md
      - DECISIONS.md
      - DECISIONS.xlsx
      - repository structure
      - .claude/settings.json
      - .claude/rules/**
    write_scope:
      - CLAUDE.md
      - BACKLOG.md
      - STATUS.md
    prohibited_scope:
      - application source code
      - DECISIONS.xlsx
      - AUTHORITATIVE_ARCHITECTURE.md
    expected_outputs:
      - CLAUDE.md
      - BACKLOG.md
      - STATUS.md
    validation_required:
      - memory_files_have_distinct_authority
      - CLAUDE_md_is_concise
      - BACKLOG_contains_coherent_outcomes
      - STATUS_matches_actual_repository
      - decision_workflow_referenced
      - architecture_authority_referenced
    parallelization:
      eligible: false
      reason: >
        Work memory reconciles outputs from all preceding core modules.
    failure_policy: retry_then_block_dependents
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - CLAUDE.md
      - BACKLOG.md
      - STATUS.md

  - id: multi_agent_orchestration
    name: Capability-Based Multi-Agent Orchestration
    prompt_path: prompts/initialization/20-multi-agent-orchestration.md
    version: "1.0"
    category: orchestration
    required: true
    executable: true
    default_order: 20
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - technical_guardrails
      - scoped_rules
      - work_memory
    execution_conditions:
      always: true
    read_scope:
      - CLAUDE.md
      - PROJECT.md
      - AUTHORITATIVE_ARCHITECTURE.md
      - DECISIONS.md
      - BACKLOG.md
      - STATUS.md
      - .claude/settings.json
      - .claude/rules/**
    write_scope:
      - .claude/rules/orchestration.md
      - .claude/rules/model-routing.md
      - .claude/rules/agent-safety.md
      - structured proposal for CLAUDE.md reconciliation
    prohibited_scope:
      - application source code
      - DECISIONS.xlsx
      - cloud resources
      - hard-coded permanent model names
    expected_outputs:
      - .claude/rules/orchestration.md
      - .claude/rules/model-routing.md
      - .claude/rules/agent-safety.md
    validation_required:
      - capability_based_roles_used
      - Primary_Orchestrator_defined
      - least_capable_reliable_worker_rule_defined
      - agent_write_ownership_defined
      - retries_and_replacement_defined
      - independent_review_defined
      - no_uncontrolled_agent_trees
      - failure_containment_defined
    parallelization:
      eligible: false
      reason: >
        This module installs the permanent operating model after the core
        project environment exists.
    failure_policy: retry_then_block_dependents
    cleanup_behavior: convert_to_permanent_output
    permanent_outputs:
      - .claude/rules/orchestration.md
      - .claude/rules/model-routing.md
      - .claude/rules/agent-safety.md

  - id: final_validation
    name: Final Validation
    prompt_path: prompts/initialization/90-final-validation.md
    version: "1.0"
    category: validation
    required: true
    executable: true
    default_order: 90
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - all_selected_required_modules_complete
      - all_selected_project_type_modules_complete
      - all_selected_capability_modules_complete
    execution_conditions:
      no_initialization_blockers: true
    read_scope:
      - entire repository
    write_scope:
      - validation reports
      - structured correction requests to owning modules
      - INITIALIZATION_STATUS.md
    prohibited_scope:
      - silent cross-owner corrections
      - cloud deployment
      - Git history
      - removal of initialization files
    expected_outputs:
      - final validation result
      - reconciled initialization status
      - cleanup authorization or failure result
    validation_required:
      - repository_identity_consistent
      - architecture_consistent
      - repository_structure_consistent
      - memory_consistent
      - decision_queue_contains_only_open_questions
      - permanent_orchestration_active
      - security_guardrails_active
      - no_secrets_present
      - no_initialization_blockers
    parallelization:
      eligible: false
    failure_policy: terminal_initialization_failure
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - final validation evidence summarized in initialization record

  - id: cleanup
    name: Initialization Cleanup
    prompt_path: prompts/initialization/99-cleanup.md
    version: "1.0"
    category: cleanup
    required: true
    executable: true
    default_order: 99
    supported_modes:
      - new
      - resume
      - repair
    prerequisites:
      - final_validation_passed
      - permanent_memory_exists
      - permanent_orchestration_exists
      - no_initialization_blockers
    execution_conditions:
      final_validation_passed: true
    read_scope:
      - entire repository
      - cleanup behavior in this manifest
      - INITIALIZATION_STATUS.md
    write_scope:
      - docs/70-audit/initialization-record.md
      - removal of approved temporary initialization artifacts
      - INITIALIZATION_STATUS.md
    prohibited_scope:
      - permanent project outputs
      - application source code
      - DECISIONS.xlsx
      - DECISIONS.md
      - Git history
    expected_outputs:
      - docs/70-audit/initialization-record.md
      - removal of temporary initialization prompts
      - post-cleanup validation
    validation_required:
      - initialization_record_exists
      - temporary_prompts_removed
      - permanent_outputs_preserved
      - 01_create_removed_last
      - repository_reopens_without_initializer
      - project_ready_for_work
    parallelization:
      eligible: false
    failure_policy: terminal_initialization_failure
    cleanup_behavior: remove_after_initialization
    permanent_outputs:
      - docs/70-audit/initialization-record.md
```

---

# 14. Project-Type Module Registry

Project-type modules use the range:

```text
30–39
```

Approved project types may include:

```yaml
approved_project_types:
  - software_application
  - automation
  - data_and_analytics
  - infrastructure
  - documentation
  - research_and_analysis
  - hybrid
```

A project-type module may execute only when:

- Its prompt exists
    
- It is registered in this manifest
    
- Its version is defined
    
- Its execution conditions match the project
    
- Its dependencies are satisfied
    
- Its write scope does not conflict with another active module
    
- Its selection reason is recorded in `INITIALIZATION_STATUS.md`
    

Broad project types must be preferred over creating highly specific project types.

Examples:

```text
Software application + web capability
Software application + email integration capability
Automation + Microsoft Graph capability
Data and analytics + Azure data capability
Infrastructure + Azure deployment capability
```

Do not create a separate project type for every possible project combination.

Until a project-type module is explicitly registered with a valid path and version, it is not executable.

---

# 15. Capability Module Registry

Capability modules use the range:

```text
40–79
```

Potential capability categories include:

```yaml
capability_categories:
  - web_application
  - api
  - Microsoft_365_integration
  - email_integration
  - Microsoft_Graph
  - Entra_ID_authentication
  - database
  - Azure_compute
  - Azure_storage
  - Azure_messaging
  - Azure_monitoring
  - Azure_deployment
  - security_and_compliance
  - audit_and_evidence
  - testing
  - user_interface
  - data_pipeline
```

Capability modules are composable.

A capability module may be selected automatically only when:

- It exists in the approved manifest
    
- The project information clearly requires it
    
- It introduces no prohibited platform
    
- It creates no paid commitment without authorization
    
- It creates no irreversible architecture without authorization
    
- It does not expand project scope
    
- It follows the approved architecture
    
- Its selection reason is recorded
    

A material or uncertain capability choice must be routed through `DECISIONS.xlsx`.

Until a capability module is explicitly registered with a valid path and version, it is not executable.

---

# 16. Structured Execution Conditions

Modules must use structured conditions.

Allowed condition types include:

```yaml
condition_types:
  - always
  - project_types
  - requires_all_capabilities
  - requires_any_capability
  - excludes_capabilities
  - Microsoft_environment
  - architecture_contains
  - project_has_integration
  - project_requires_authentication
  - project_requires_cloud
  - project_requires_deployment
  - project_requires_compliance
  - no_initialization_blockers
  - final_validation_passed
```

Do not use unrestricted natural-language conditions as execution authority.

Natural-language explanations may supplement structured conditions but must not replace them.

---

# 17. Read and Write Scope Enforcement

Scopes may contain:

- Exact file paths
    
- Exact directory paths
    
- Controlled glob-style paths
    
- Named virtual scopes such as `repository tree` or `Git metadata`
    

A module must not modify anything outside its write scope.

When a module discovers a related issue outside its scope, it must report:

```yaml
out_of_scope_issue:
  discovered_by_module:
  affected_file_or_component:
  evidence:
  impact:
  likely_owner_module:
  blocking_effect:
  recommended_action:
```

The Primary Orchestrator must then:

1. Identify the registered owning module.
    
2. Determine whether the owning module should be scheduled.
    
3. Record the scheduling reason.
    
4. Route any material choice through `DECISIONS.xlsx`.
    
5. Prevent the discovering module from making the change itself.
    

---

# 18. Parallelization Rules

A module may run in parallel only when:

- It is marked eligible
    
- All prerequisites are satisfied
    
- Write scopes do not overlap
    
- No shared binary file is modified
    
- No shared owner file is modified concurrently
    
- Shared interfaces are already defined
    
- No common blocking decision remains unresolved
    
- The Primary Orchestrator can monitor the work
    
- Integration and validation capacity are sufficient
    

Only one authorized writer may modify:

```text
DECISIONS.xlsx
DECISIONS.md
PROJECT.md
AUTHORITATIVE_ARCHITECTURE.md
CLAUDE.md
BACKLOG.md
STATUS.md
README.md
.claude/settings.json
```

at a time.

Parallel execution must be used to improve speed or isolation, not merely to increase agent count.

---

# 19. Module Versioning

Every executable module must have a version.

Use simple semantic versions:

```text
1.0
1.1
2.0
```

Version meaning:

- Patch-level wording corrections that do not change behavior may retain the same displayed version during early template development.
    
- Minor versions indicate backward-compatible behavior changes.
    
- Major versions indicate material changes to outputs, dependencies, authority, or execution behavior.
    

Repair mode may compare the repository’s recorded template and module versions against a newer template.

Repair mode must not automatically upgrade modules.

Proposed upgrades must be added to `DECISIONS.xlsx`.

Checksums are not required in version 1.

---

# 20. Initialization Cleanup Registry

The following temporary artifacts must normally be removed after successful validation:

```yaml
cleanup_registry:
  - path: create.md
    behavior: remove_after_initialization
    sequence: last

  - path: prompts/initialization/INITIALIZATION_MANIFEST.md
    behavior: remove_after_initialization

  - path: INITIALIZATION_STATUS.md
    behavior: remove_after_initialization

  - path: prompts/initialization/**
    behavior: remove_after_initialization

  - path: prompts/initialization/project-types/**
    behavior: remove_after_initialization

  - path: prompts/initialization/capabilities/**
    behavior: remove_after_initialization

  - path: prompts/initialization/**
    behavior: convert_to_permanent_output

  - path: prompts/initialization/**
    behavior: remove_after_initialization
```

Permanent outputs that must remain include:

```yaml
permanent_outputs:
  - CLAUDE.md
  - PROJECT.md
  - AUTHORITATIVE_ARCHITECTURE.md
  - DECISIONS.xlsx
  - DECISIONS.md
  - BACKLOG.md
  - STATUS.md
  - README.md
  - .gitignore
  - .gitattributes
  - .editorconfig
  - .claude/settings.json
  - .claude/rules/**
  - docs/70-audit/initialization-record.md
  - architecture-approved project directories
  - project-specific permanent documentation
```

Cleanup must not occur until final validation passes.

`create.md` must be the final initialization control file removed.

---

# 21. Initialization Record

The cleanup module must create:

```text
docs/70-audit/initialization-record.md
```

It must include:

- Organization
    
- Project name
    
- Repository name
    
- Initialization date
    
- Initialization mode
    
- Manifest version
    
- Template version
    
- Microsoft environment
    
- Azure applicability
    
- Project type
    
- Modules executed
    
- Modules skipped
    
- Project-type modules selected
    
- Capability modules selected
    
- Initial durable decision IDs
    
- Permanent outputs created
    
- Validation result
    
- Temporary files removed
    
- Known remaining risks
    
- First recommended milestone
    

It must not include:

- Full prompt contents
    
- Full runtime logs
    
- Deleted question text unless recorded as a durable decision
    
- Secrets
    
- Credentials
    
- Machine-specific paths
    
- Detailed agent transcripts
    

---

# 22. Manifest Completion Rule

This manifest is successfully applied only when:

- `create.md` parses it successfully.
    
- The normalized runtime plan is created.
    
- Only registered modules are executed.
    
- Module dependencies are enforced.
    
- Write scopes are enforced.
    
- Shared-file ownership is enforced.
    
- Azure-only policy is enforced when cloud is applicable.
    
- Commercial or GCC High is established when relevant.
    
- Entra ID is used as the default identity provider when authentication is required.
    
- Material user decisions are routed through `DECISIONS.xlsx`.
    
- Failed modules block only their dependents.
    
- Independent safe work continues.
    
- Required modules complete.
    
- Final validation passes.
    
- Permanent outputs exist.
    
- Temporary prompts are removed.
    
- `docs/70-audit/initialization-record.md` remains.
    
- The repository is ready for project work.

---

# 23. v1.1 Hardening Reconciliation (authoritative addendum)

This addendum resolves the prior three-way drift between `create.md`, this manifest, and
`prompts/initialization/99-cleanup.md`, and makes the environment interfaces durable.

## 23.1 Canonical permanent-outputs registry
`prompts/initialization/expected-artifacts.yaml` is now the SINGLE source of truth for what the
delivered repo must contain. `90-final-validation.md` asserts each `required` artifact exists and is
non-empty; `99-cleanup.md` refuses to self-delete until every knowledge-bearing source has its
durable target present. The lists in section 20 and in `create.md` section 24 defer to that file.

## 23.2 New durable environment interfaces (permanent outputs)
`VAULT.md`, `SHAREPOINT.md`, `SECURITY.md`, `DATA-CLASSIFICATION.md`, `CONVENTIONS.md`, `VERIFY.md`,
`.gitleaks.toml`, `.pre-commit-config.yaml`, `.github/workflows/ci.yml`, `CODEOWNERS`,
`scripts/check_references.py`, `scripts/verify.ps1`, `.template-provenance.json`, and `BUILD_PATTERN.md`
are permanent outputs. They carry the vault, SharePoint, secrets, data-classification, conventions,
and verify interfaces so a delivered repo is never born without them.

## 23.3 Required data-governance gate
A `data_governance` responsibility owns `DATA-CLASSIFICATION.md`. The declaration (target tenant,
CUI-eligibility, data categories) is a REQUIRED, terminal gate: `create.md` must not proceed to
project work, and final validation FAILS, if it is missing or contradictory
(`cui_eligible: yes` with `target_tenant: Commercial` is a hard failure — no CUI on the commercial tenant).

## 23.4 Cleanup path consolidation
All initialization modules live under `prompts/initialization/`. Cleanup globs referencing
`prompts/orchestration/`, `prompts/finalization/`, `prompts/project-types/`, `prompts/capabilities/`
are consolidated to `prompts/initialization/**`. The controller is `create.md` (root); the manifest is
`prompts/initialization/INITIALIZATION_MANIFEST.md`.

## 23.5 No hard-coded model names
Module 20 uses capability roles (Primary Orchestrator / Efficient / Standard / Advanced Reasoning
Worker / Escalation Review Agent). Named models are illustrative tiers only.
