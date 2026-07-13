

# Authoritative Architecture and Continuous Assurance

## 1. Purpose

This module creates and maintains the authoritative architecture for the project.

It must create:

```text
AUTHORITATIVE_ARCHITECTURE.md
docs/architecture/architecture.html
```

`AUTHORITATIVE_ARCHITECTURE.md` is the machine-readable and human-readable source of architectural truth.

`docs/architecture/architecture.html` is the self-contained visual interface generated from the authoritative architecture.

The architecture must provide enough reliable information for later modules and autonomous AI sessions to:

- Create the correct repository structure
    
- Select approved project-type and capability modules
    
- Understand system and operational boundaries
    
- Define components and responsibilities
    
- Define agents and sub-agents
    
- Understand user and system interactions
    
- Define data flows and schemas
    
- Define integrations
    
- Define identity and access boundaries
    
- Define Azure hosting and resource relationships
    
- Define logging, monitoring, audit, and evidence flows
    
- Define failure handling and recovery
    
- Detect architectural drift
    
- Prevent hallucinated requirements or components
    
- Complete future engineering work without relying on chat history
    

This module creates architecture and architectural documentation.

It must not:

- Build the application
    
- Populate the project backlog
    
- Create implementation tasks
    
- Deploy Azure resources
    
- Purchase capabilities
    
- Commit licensing costs
    
- Modify the live Microsoft environment
    
- Treat proposed architecture as implemented architecture
    
- Ask the user to choose routine technical patterns
    

---

# 2. Architecture Authority

The autonomous AI is authorized to select the best reasonable architecture when the selection:

- Supports the approved project requirements
    
- Follows Swif7Edge standards
    
- Uses Microsoft Azure when cloud capability is applicable
    
- Uses Microsoft 365 when enterprise productivity or tenant integration is applicable
    
- Prefers Azure-native and Microsoft-native services
    
- Uses Microsoft Entra ID as the default identity provider
    
- Uses Microsoft Graph as the default Microsoft 365 API
    
- Uses existing approved APIs before creating new integrations
    
- Is secure, maintainable, testable, and auditable
    
- Introduces no unauthorized paid commitment
    
- Does not expand project scope
    
- Does not create an irreversible or destructive condition
    
- Can be justified through requirements, standards, evidence, and engineering reasoning
    

The AI should not ask the user to select ordinary Azure services, component boundaries, repository patterns, testing patterns, logging patterns, or implementation approaches when the AI can make a safe and supportable choice.

Material decisions outside delegated authority must be added to:

```text
DECISIONS.xlsx
```

---

# 3. Required Standards Baseline

The architecture must support the applicable intent and requirements of:

- NIST SP 800-53 Revision 5 as the primary security and control framework
    
- CMMC Level 1
    
- CMMC Level 2 when applicable
    
- SOC 2
    
- ISO/IEC/IEEE 42010:2022
    
- CMMI Development Level 5 process principles
    
- Swif7Edge Azure standards
    
- Swif7Edge Microsoft 365 standards
    
- Swif7Edge identity and access standards
    
- Swif7Edge data standards
    
- Swif7Edge continuous-assurance standards
    
- Existing organizational policies and approved project decisions
    

The architecture must not state that the project, repository, application, or organization is formally certified merely because these practices are followed.

Use language such as:

- Designed to support
    
- Aligned with
    
- Mapped to
    
- Implements applicable controls from
    
- Produces evidence supporting
    
- Requires independent assessment to confirm
    

Architecture and compliance claims must be supported by evidence.

---

# 4. Architecture Description Standard

Structure the architecture according to ISO/IEC/IEEE 42010:2022 principles.

Identify, when applicable:

- Stakeholders
    
- Stakeholder concerns
    
- Architecture viewpoints
    
- Architecture views
    
- Model kinds
    
- Correspondence among views
    
- Architecture decisions
    
- Architecture rationale
    
- Known risks
    
- Known limitations
    
- Unresolved concerns
    

The document must remain practical.

Do not create unnecessary enterprise-architecture ceremony for a small project.

The depth of the architecture must be proportional to:

- Project scope
    
- Operational impact
    
- Security exposure
    
- Data sensitivity
    
- Compliance impact
    
- Number of users
    
- Number of integrations
    
- Deployment complexity
    
- Cost of failure
    
- Expected project lifetime
    

---

# 5. Authoritative Inputs

Read and reconcile:

1. `PROJECT.md`
    
2. `DECISIONS.md`
    
3. Processed answers from `DECISIONS.xlsx`
    
4. Swif7Edge platform policy
    
5. Swif7Edge data standards
    
6. Existing architecture files
    
7. Existing repository content
    
8. Existing approved APIs and integration standards
    
9. Applicable security and compliance requirements
    
10. `INITIALIZATION_STATUS.md`
    

Do not use chat history as architectural authority when the information is not represented in a durable repository artifact.

When important information exists only in chat or cannot be verified:

1. Identify the gap.
    
2. Determine whether a safe standard resolves it.
    
3. Add a question to `DECISIONS.xlsx` when user input is materially required.
    
4. Do not silently invent the architecture.
    

---

# 6. Fixed Authority Order

Architecture and future engineering work must use this lookup order:

1. Component- or service-specific authoritative files
    
2. `AUTHORITATIVE_ARCHITECTURE.md`
    
3. `PROJECT.md`
    
4. Accepted ADRs and `DECISIONS.md`
    
5. Root `CLAUDE.md`
    
6. Scoped `.claude/rules/`
    
7. Approved standards and references
    
8. Supporting documentation
    

A lower source must not silently override a higher source.

When an answer is not documented in an authoritative source, the AI must:

- Identify the gap
    
- Use a safe reversible default when authorized
    
- Record a temporary assumption when permitted
    
- Route a material decision through `DECISIONS.xlsx`
    
- Avoid fabricating an approved requirement or architecture decision
    

---

# 7. Architecture State Separation

`AUTHORITATIVE_ARCHITECTURE.md` must clearly separate:

## Current Repository State

What currently exists after initialization.

## Approved Target Architecture

The architecture the project is authorized to implement.

## Not-Yet-Implemented Components

Approved components that do not currently exist.

## Proposed Architecture Pending Decision

Recommendations awaiting required user authorization.

## Open Architecture Questions

Material unresolved questions currently represented in `DECISIONS.xlsx`.

## Known Extension Requirements

Only approved future constraints that the current architecture must preserve.

Do not present target architecture as completed implementation.

Do not allow proposed architecture to control implementation until approved.

Do not fill the architecture with speculative future ideas.

---

# 8. Single Live Environment Standard

Swif7Edge currently operates one live Microsoft environment and does not maintain separate development or test environments.

The selected Microsoft environment must be one of:

```text
Commercial
GCC High
```

The environment selection must be made through `DECISIONS.xlsx` when it is not already approved.

The architecture must design for safe engineering inside the single live environment.

This does not authorize uncontrolled changes against live users, live data, or production services.

Apply these safeguards when relevant:

- Read-only discovery before mutation
    
- Current-state capture before change
    
- Deterministic plan before apply
    
- Explicit apply mode for mutation
    
- Small bounded change units
    
- Least-privilege identities
    
- Test identities where practical
    
- Synthetic or sanitized test data where practical
    
- Feature flags where practical
    
- Deployment slots or isolated non-user-facing resources within the live Azure environment when supported
    
- Pre-change backups or exports
    
- Health checks
    
- Post-change verification
    
- Idempotence testing
    
- Rollback or recovery instructions
    
- Failure containment
    
- Change evidence
    
- Independent audit review
    

The project must not create separate environment-specific code paths.

Environment differences must be isolated through:

- Configuration
    
- Endpoint registries
    
- Capability matrices
    
- Deployment parameters
    
- Authentication metadata
    
- Policy files
    
- Environment-specific runtime values
    

The same implementation should operate against the selected environment through controlled configuration.

---

# 9. Three-Layer Truth and Convergence Model

When the project manages Azure, Microsoft 365, infrastructure, policy, or configuration, use the following truth model:

```text
POLICY
What is allowed
        ↓
DESIRED STATE
What should exist
        +
RUNTIME CONFIGURATION
Environment-specific values
        ↓
PLAN AND DIFF
Compare intended state to live state
        ↓
LIVE ENVIRONMENT
Actual current state
        ↓
RECORDED APPLIED STATE
What was verified and applied
```

Authority flows in one direction.

The live environment is authoritative evidence of what currently exists.

Desired state must not blindly overwrite unexplained live drift.

When drift is detected:

1. Read the live state.
    
2. Compare it to policy, desired state, and recorded applied state.
    
3. Identify whether the drift is expected, authorized, manual, external, malicious, or unexplained.
    
4. Block mutation when drift is unexplained and material.
    
5. Reconcile the authoritative files or the live state.
    
6. Record the resolution.
    
7. Apply only after the difference is understood.
    

When applicable, define patterns equivalent to:

```text
policy/
services/<service>/state.md
config/<environment>/<service>.json
current-state/
schemas/
evidence/
scripts/read/
scripts/write/
```

The final directory names are determined by `15-repository-structure.md`.

---

# 10. Deterministic Plan and Apply

All state-changing engineering workflows must distinguish planning from mutation.

Default behavior must be read-only planning.

Mutation must require an explicit apply mode.

Examples may include:

```text
-Apply
--apply
apply
```

Requirements:

- Planning must not modify the live environment.
    
- The plan must identify intended changes.
    
- The plan must identify affected resources.
    
- The plan must identify risks.
    
- The plan must identify rollback or recovery.
    
- Apply must execute only the approved plan.
    
- A second run must be a no-op when desired state has been reached.
    
- Partial failure must not silently leave unknown state.
    
- Applied state must be recorded after verification.
    
- Unexplained drift must block apply.
    
- Destructive changes require explicit user authorization.
    

PowerShell mutation commands must use `SupportsShouldProcess` and honor `-WhatIf` when technically applicable.

---

# 11. System Context and Boundaries

The architecture must define:

- Project system boundary
    
- Microsoft tenant boundary
    
- Azure boundary
    
- User boundary
    
- Administrative boundary
    
- External-system boundary
    
- Data boundary
    
- Trust boundary
    
- Responsibility boundary
    
- Repository boundary
    

Identify:

- What the project owns
    
- What the project controls
    
- What the project reads
    
- What the project writes
    
- What remains external
    
- What requires administrator action
    
- What requires user authorization
    
- What requires external consent
    
- What cannot be automated
    

The system context must prevent future agents from assuming ownership of external systems or capabilities.

---

# 12. Component Architecture

Assign lightweight stable IDs to major components:

```text
CMP-001
CMP-002
CMP-003
```

For every major component, define:

- Component ID
    
- Name
    
- Purpose
    
- Responsibilities
    
- Inputs
    
- Outputs
    
- Owned data
    
- Dependencies
    
- Interfaces
    
- Trust level
    
- Deployment location
    
- Availability requirement
    
- Failure behavior
    
- Related requirements
    
- Related architecture decisions
    
- Current implementation status
    

Do not assign IDs to trivial helper functions or every file.

Components must have clear, non-overlapping responsibilities.

Avoid unnecessary microservices, layers, wrappers, brokers, databases, or abstraction frameworks.

Prefer the smallest architecture that safely satisfies the approved requirements.

---

# 13. Agent and Sub-Agent Architecture

Define agents and sub-agents when autonomous AI work is part of the project.

Assign IDs such as:

```text
AGT-001
AGT-002
```

For each agent, define:

- Agent ID
    
- Role
    
- Purpose
    
- Assigned responsibilities
    
- Inputs
    
- Outputs
    
- Read scope
    
- Write scope
    
- Prohibited scope
    
- Required tools
    
- Required model capability
    
- Validation responsibility
    
- Evidence responsibility
    
- Feedback requirements
    
- Failure behavior
    
- Retry policy
    
- Escalation path
    
- Stop conditions
    
- Related requirements
    

Agent trees must be controlled.

Only the Primary Orchestrator may spawn agents by default.

An agent may not create an unmanaged sub-agent chain.

Agents modifying the same file, schema, cloud resource, or configuration object must not work concurrently without a defined coordination mechanism.

---

# 14. Independent Audit Agent

Every engineering repository must define an independent Audit Agent.

The Audit Agent must be:

- Independent from the implementer
    
- Read-only by default
    
- Able to inspect the complete repository
    
- Able to inspect authorized live-state evidence
    
- Able to compare implementation against requirements
    
- Able to compare implementation against architecture
    
- Able to compare claims against evidence
    
- Able to block completion
    
- Prohibited from silently repairing the implementation it audits
    

The Audit Agent must evaluate:

- Requirement drift
    
- Architecture drift
    
- Scope drift
    
- Hallucinated requirements
    
- Hallucinated completion claims
    
- Unsupported compliance claims
    
- Missing evidence
    
- Missing tests
    
- Untested failure paths
    
- Security regressions
    
- Compliance degradation
    
- Data-schema violations
    
- Documentation debt
    
- Unrecorded decisions
    
- Unexplained live-state drift
    
- Incomplete rollback or recovery planning
    
- Differences between plan and applied result
    

Material audit findings block completion until resolved, accepted through the decision process, or formally deferred when deferral is permitted.

---

# 15. User and System Interactions

Define the major interactions among:

- Users
    
- Administrators
    
- Operators
    
- Applications
    
- Agents
    
- APIs
    
- Microsoft 365
    
- Azure
    
- External systems
    
- Audit and monitoring services
    

The initialization architecture does not need to define every detailed screen or click.

It must define enough interaction context to guide later work.

For each major interaction, identify:

- Actor
    
- Trigger
    
- System response
    
- Data exchanged
    
- Authorization required
    
- Evidence generated
    
- Failure behavior
    
- Related requirements
    

---

# 16. Data Architecture

The Swif7Edge canonical data schema is the default data authority.

The canonical schema must be:

- Centrally authoritative
    
- Versioned
    
- Available through a controlled Swif7Edge source
    
- Copied locally into each relevant repository at a known version
    
- Traceable to its central source
    
- Validated before use
    
- Updated only through a controlled schema-change process
    

The local copy supports offline operation, repository stability, and repeatable validation.

The central version remains authoritative.

For each major data entity, define:

- Entity ID
    
- Name
    
- Purpose
    
- Data owner
    
- Source
    
- Destination
    
- Schema version
    
- Classification
    
- Sensitivity
    
- Required encryption
    
- Retention
    
- Provenance
    
- Validation rules
    
- Access rules
    
- Logging restrictions
    
- Disposal requirements
    
- Related requirements
    

Use IDs such as:

```text
DAT-001
DAT-002
```

Do not log secrets, tokens, sensitive payloads, or regulated data unless explicitly required and protected.

---

# 17. Data Flow Architecture

Assign stable IDs to important data flows:

```text
DF-001
DF-002
DF-003
```

For every important data flow, define:

- Flow ID
    
- Source
    
- Destination
    
- Trigger
    
- Data exchanged
    
- Schema
    
- Classification
    
- Authentication
    
- Authorization
    
- Encryption in transit
    
- Encryption at rest
    
- Validation
    
- Transformation
    
- Logging
    
- Error handling
    
- Retry behavior
    
- Idempotency
    
- Related requirements
    
- Related components
    
- Trust boundaries crossed
    

Data flows must be represented in both:

```text
AUTHORITATIVE_ARCHITECTURE.md
docs/architecture/architecture.html
```

---

# 18. Integration Architecture

Use this preference order:

1. Existing approved Swif7Edge API
    
2. Microsoft Graph
    
3. Existing Azure API Management-managed API
    
4. Vendor-supported API
    
5. Approved direct Azure-native integration
    
6. Controlled alternative integration
    
7. Scraping only as an explicitly approved exception
    

The AI must first determine whether the required interface already exists.

Avoid rebuilding an integration that Swif7Edge already operates.

## API Management

Use Azure API Management, when applicable, for:

- API cataloging
    
- API exposure
    
- Versioning
    
- Policy enforcement
    
- Access mediation
    
- Rate control
    
- Transformation
    
- Observability
    
- Reusable internal APIs
    

## Key Vault

Use Azure Key Vault for:

- Secrets
    
- API credentials
    
- Cryptographic keys
    
- Certificates
    
- Protected connection material
    

Do not store API definitions, contracts, schemas, or source code in Key Vault.

## Repository

Store in Git:

- API contracts
    
- OpenAPI definitions
    
- Schemas
    
- Integration documentation
    
- Infrastructure definitions
    
- Validation rules
    
- Approved endpoint metadata that contains no secret
    
- API version dependencies
    

## Access

Prefer:

- Managed identities
    
- Workload identities
    
- Certificate-based application authentication
    
- Least-privilege access
    
- Short-lived credentials where supported
    

The repository itself does not receive vault permission.

An authorized workload, user, agent, or automation identity receives least-privilege access.

Scraping requires an answered decision in `DECISIONS.xlsx`.

---

# 19. Authentication and Authorization

Microsoft Entra ID is the default identity provider.

Define:

- User authentication
    
- Workload authentication
    
- Application identities
    
- Managed identities
    
- Administrative identities
    
- Service principals
    
- Permission boundaries
    
- Role assignments
    
- PIM use
    
- Tenant consent requirements
    
- Session and token handling
    
- Break-glass access
    
- Authorization enforcement
    
- Audit events
    

Prefer:

- Managed identity
    
- Certificate-based app-only authentication
    
- Least privilege
    
- Separated administrative accounts
    
- PIM activation
    
- Explicit scope allowlists
    

Avoid:

- Embedded credentials
    
- Shared user accounts
    
- Long-lived secrets when another option exists
    
- Interactive authentication in unattended automation
    
- Device-code authentication in unattended automation
    
- Broad Graph permissions without justification
    
- Tenant-wide consent without authorization
    

Broad Graph permissions, tenant-wide consent, role changes, and privileged identity changes require an answered row in `DECISIONS.xlsx`.

---

# 20. Break-Glass Safeguard

Before any automated change to:

- Conditional Access
    
- Privileged role assignments
    
- Authentication policy
    
- Identity protection policy
    
- Tenant-wide access control
    
- Emergency-access-sensitive configuration
    

the system must:

1. Identify the approved break-glass accounts.
    
2. Verify that the accounts exist.
    
3. Verify that the accounts are enabled.
    
4. Verify that their required authentication approach is available.
    
5. Ensure that the accounts are included in required policy exclusions before mutation.
    
6. Prevent removal of the final valid emergency-access path.
    
7. Record evidence of verification.
    
8. Block the change if verification fails.
    

A Conditional Access or privileged identity change must never create an emergency-access lockout condition.

---

# 21. Trust Boundaries

Assign IDs such as:

```text
TRUST-001
TRUST-002
```

Define trust boundaries involving:

- Users
    
- Administrators
    
- AI agents
    
- Repository automation
    
- Microsoft 365
    
- Azure resources
    
- External APIs
    
- Data stores
    
- Key Vault
    
- API Management
    
- Monitoring systems
    
- CI/CD systems
    
- Audit systems
    

For each trust boundary, define:

- Systems on each side
    
- Authentication required
    
- Authorization required
    
- Data crossing the boundary
    
- Validation required
    
- Encryption required
    
- Monitoring required
    
- Failure behavior
    
- Threat considerations
    
- Related requirements
    

---

# 22. Azure Hosting Architecture

Azure is the only approved public cloud platform when cloud hosting is applicable.

The AI may select appropriate Azure-native services autonomously when the selection falls within delegated authority.

Evaluate only the services relevant to the project.

Potential service areas include:

- Compute
    
- Storage
    
- Databases
    
- Messaging
    
- API management
    
- Identity
    
- Networking
    
- Secrets
    
- Monitoring
    
- Security
    
- Automation
    
- AI services
    
- Data processing
    
- Backup
    
- Recovery
    

Prefer:

- Azure-native services
    
- Managed services
    
- Managed identities
    
- Built-in monitoring
    
- Built-in encryption
    
- Infrastructure as code
    
- Azure Verified Modules where appropriate
    
- Bicep as the preferred Azure infrastructure language
    

Do not add Azure services merely because they exist.

Every selected service must support an approved requirement or architectural responsibility.

---

# 23. Purchase and Licensing Authorization

Architecture may identify and recommend paid capabilities.

Architecture does not automatically authorize a purchase.

Before any new cost, paid subscription, licensing commitment, marketplace purchase, consumption commitment, or recurring charge is created:

1. Add a question to `DECISIONS.xlsx`.
    
2. Identify the capability.
    
3. Explain why it is needed.
    
4. Identify alternatives.
    
5. Estimate one-time and recurring cost.
    
6. Explain implementation and maintenance impact.
    
7. Obtain explicit user approval.
    
8. Record the durable decision.
    
9. Apply only the approved commitment.
    

This is a hard rule.

Existing prepaid, licensed, or already-authorized capabilities may be reused autonomously when their use is within the approved project scope.

---

# 24. Logging, Monitoring, and Observability

Use Swif7Edge’s existing standardized Azure and Microsoft monitoring capabilities.

Prefer, when applicable:

- Azure Monitor
    
- Application Insights
    
- Log Analytics
    
- Microsoft 365-native alerting
    
- Microsoft Defender signals
    
- Structured application logs
    
- Trace correlation
    
- Health checks
    
- Audit events
    
- Change records
    
- Deployment records
    
- Failure alerts
    

Define:

- What must be logged
    
- What must not be logged
    
- Metrics
    
- Traces
    
- Alerts
    
- Retention
    
- Access
    
- Correlation identifiers
    
- Evidence requirements
    
- Incident triggers
    
- Drift alerts
    
- Failure conditions
    

Do not create a parallel third-party monitoring platform when approved Microsoft-native capability satisfies the requirement.

A paid or third-party monitoring dependency requires a user decision.

---

# 25. Failure Handling and Recovery

For each critical component or operation, define:

- Expected failure modes
    
- Detection method
    
- Containment
    
- Retry behavior
    
- Retry limit
    
- Backoff
    
- Timeout
    
- Duplicate-action protection
    
- Partial-failure behavior
    
- Recovery procedure
    
- Rollback procedure
    
- Operator notification
    
- Evidence produced
    
- Audit review requirement
    

Failures must not cascade into:

- Tenant lockout
    
- Cloud-wide failure
    
- Data corruption
    
- Duplicate mutation
    
- Unbounded retry loops
    
- Excessive cost
    
- Uncontrolled agent spawning
    
- Unsupported completion claims
    

Rollback or recovery notes must be created under an approved runbook location when implementation begins.

---

# 26. Testing and Validation Boundaries

The architecture must define the required testing boundaries appropriate to the project.

Potential boundaries include:

- Unit
    
- Schema
    
- Static analysis
    
- Policy scan
    
- Integration
    
- Authentication
    
- Authorization
    
- Failure path
    
- Idempotence
    
- Plan/apply equivalence
    
- Drift detection
    
- Live authorized-resource verification
    
- Security
    
- Compliance
    
- Performance
    
- Recovery
    
- End-to-end
    
- User acceptance
    
- Audit verification
    

For state-management automation, the validation harness must prove:

1. The read-only plan is correct.
    
2. Apply matches the approved plan.
    
3. A second run is a no-op.
    
4. Failure paths do not leave unknown or partially destructive state.
    
5. Recorded applied state matches verified live state.
    

Do not claim success based only on mocks when the requirement concerns a live external resource.

Live verification must use an authorized resource and must respect the single-environment safeguards.

---

# 27. Engineering Hard Denies

When applicable to the project, policy scans must prohibit:

- Deprecated AzureAD modules
    
- Deprecated MSOnline modules
    
- Deprecated Msol commands
    
- `Invoke-Expression`
    
- `iex`
    
- Hardcoded secrets
    
- Plaintext credentials
    
- Unsafe plaintext `ConvertTo-SecureString`
    
- Interactive authentication in unattended automation
    
- Device-code authentication in unattended automation
    
- Direct mutation without an explicit apply mode
    
- Unbounded retries
    
- Silent exception suppression
    
- Unsupported completion claims
    
- Unrecorded architecture degradation
    
- Non-Azure cloud dependencies
    
- Unapproved paid commitments
    

For PowerShell engineering, prohibit `Write-Host` in reusable source or automation scripts when structured output, logging, verbose output, warning output, or information streams should be used instead.

Exceptions require a documented rationale and, when material, explicit user approval.

---

# 28. Controlled Allows

When applicable, require:

- `SupportsShouldProcess`
    
- `-WhatIf`
    
- Deterministic planning
    
- Explicit apply mode
    
- Idempotent execution
    
- Schema validation
    
- Pester or equivalent testing
    
- Failure-path testing
    
- Rollback or recovery documentation
    
- Break-glass verification
    
- Least privilege
    
- Managed identity
    
- Key Vault-sourced secrets
    
- Structured logs
    
- Evidence generation
    
- Architecture traceability
    
- Documentation updates with implementation
    

---

# 29. Continuous Assurance

Continuous Assurance must be built into the architecture.

It must not be treated as a final inspection performed after development.

The architecture must define controls for:

- Requirement conformance
    
- Architecture conformance
    
- Policy conformance
    
- Data-schema conformance
    
- Security conformance
    
- Compliance mapping
    
- Drift detection
    
- Hallucination detection
    
- Evidence sufficiency
    
- Documentation synchronization
    
- Live-state verification
    
- Applied-state recording
    
- Audit review
    
- Remediation tracking
    

Assurance checks should occur:

- Before a meaningful change
    
- After a meaningful change
    
- At the end of a work wave
    
- When a decision changes architecture
    
- When drift is detected
    
- When a material risk is discovered
    
- Before completion is claimed
    
- At defined operational intervals when the project reaches operations
    

The project must distinguish:

- Verified results
    
- Assumptions
    
- Recommendations
    
- Unverified claims
    
- Known gaps
    
- Accepted risks
    
- Deferred work
    

---

# 30. Architecture Drift

Architecture drift occurs when implementation, configuration, data, agents, integrations, or live resources no longer match the approved architecture.

The system must detect:

- New unregistered components
    
- Removed required components
    
- Changed interfaces
    
- Changed data flows
    
- Changed trust boundaries
    
- Changed permissions
    
- Changed deployment topology
    
- Changed schemas
    
- Changed agent authority
    
- Changed external dependencies
    
- Changed cost commitments
    
- Changed security controls
    
- Changed compliance posture
    

When material drift is detected:

1. Block completion.
    
2. Identify the source of drift.
    
3. Determine whether the implementation or architecture is correct.
    
4. Update the appropriate source of truth.
    
5. Route a material choice through `DECISIONS.xlsx`.
    
6. Update related ADRs.
    
7. Regenerate the visual architecture.
    
8. Revalidate affected controls.
    

---

# 31. Hallucination Control

The architecture must prevent future AI sessions from treating unsupported statements as facts.

Apply these rules:

- Every major component maps to one or more requirements.
    
- Every major interface maps to components and requirements.
    
- Every important data flow identifies a source and destination.
    
- Every architecture decision identifies authority and rationale.
    
- Every material claim identifies evidence or an approved source.
    
- Unknowns remain unknown.
    
- Proposed architecture remains separate from approved architecture.
    
- Implemented state remains separate from target state.
    
- A confident agent statement is not evidence.
    
- Missing repository authority must not be replaced with invented context.
    

The Audit Agent must check for unsupported claims before completion.

---

# 32. Architecture Traceability

Use lightweight stable IDs:

```text
CMP-NNN   Major component
INT-NNN   Interface
DF-NNN    Data flow
DAT-NNN   Data entity
TRUST-NNN Trust boundary
AGT-NNN   Agent
VIEW-NNN  Architecture view
ADR-NNN   Architecture decision
```

Each major architectural element must identify:

- Related project requirements
    
- Related decisions
    
- Related components
    
- Implementation status
    
- Validation method
    
- Evidence location when implemented
    

Do not assign IDs to every sentence or minor implementation detail.

---

# 33. Architecture Decisions and ADRs

Material architecture decisions must use:

```text
docs/decisions/ADR-NNN-meaningful-title.md
```

`DECISIONS.md` must contain a summary index that links to the individual ADR files.

Each ADR must contain:

- ADR ID
    
- Title
    
- Status
    
- Date
    
- Decision owner
    
- Source question when applicable
    
- Context
    
- Stakeholders and concerns
    
- Decision
    
- Alternatives considered
    
- Rationale
    
- Consequences
    
- Risks
    
- Compensating controls
    
- Cost impact
    
- Security impact
    
- Compliance impact
    
- Architecture elements affected
    
- Requirements affected
    
- Validation
    
- Review or expiration date when applicable
    
- Supersedes
    
- Superseded by
    

The Architecture module must submit structured ADR content to the Decision Management module when that module owns the ADR files.

Architecture changes must not be stored only in chat.

---

# 34. Control-Degradation Rule

Any proposed change that degrades an applicable:

- Security control
    
- Compliance control
    
- Architecture standard
    
- Quality gate
    
- Data-protection requirement
    
- Auditability requirement
    
- Reliability requirement
    
- Evidence requirement
    

must halt before application and require explicit user approval through `DECISIONS.xlsx`.

The decision must document:

- Existing control
    
- Proposed degradation
    
- Reason
    
- Alternatives
    
- Expected impact
    
- Risk
    
- Compensating controls
    
- Duration
    
- Owner
    
- Recovery plan
    
- Review date
    
- Affected framework mappings
    

This is a hard rule.

An AI agent may not approve its own control degradation.

---

# 35. Repeatable Skills

When a routine project operation will be repeated, define it through a two-layer skill pattern:

```text
SKILL.md
+
deterministic implementation
```

The skill contract should define:

- Purpose
    
- Invocation
    
- Inputs
    
- Outputs
    
- Preconditions
    
- Required permissions
    
- Read scope
    
- Write scope
    
- Validation
    
- Evidence
    
- Failure behavior
    
- Stop conditions
    

The implementation should live in the project’s approved tools or scripts structure.

Do not create skills merely to increase the skill count.

Create repeatable skills when doing so improves:

- Reliability
    
- Auditability
    
- Safety
    
- Consistency
    
- Validation
    
- Cost
    
- Operator usability
    

---

# 36. Standardized Build Pattern

The architecture must reference the permanent standardized build pattern.

The required workflow is:

```text
Digest requirements and applicable standards
→ inspect authoritative files and current state
→ identify drift, gaps, and unknowns
→ update architecture and traceability
→ develop or update an instrumented validation harness
→ decompose work into bounded ownership packages
→ plan
→ implement
→ test
→ independently review
→ audit for drift and hallucination
→ integrate
→ verify against authorized live resources
→ update authoritative artifacts
→ record evidence
→ report verified results separately from assumptions
```

The permanent Multi-Agent Orchestration module must create and own:

```text
BUILD_PATTERN.md
```

The architecture must identify this workflow as an operational architecture dependency.

Initialization must not populate the backlog with work items.

---

# 37. CI and Quality-Control Architecture

When CI is applicable, evaluate these standard gates:

|Gate|Responsibility|
|---|---|
|Policy scan|Enforce hard-deny patterns|
|Lint|Static analysis and code quality|
|Test|Unit, integration, failure-path, and idempotence tests|
|Infrastructure validation|Validate Bicep and deployment definitions|
|Documentation check|Detect documentation debt and required updates|
|Schema validation|Validate configuration and data schemas|
|Architecture check|Detect implementation-to-architecture drift|
|Traceability check|Verify requirement-to-implementation and requirement-to-test relationships|
|Security scan|Detect secrets, dependency risk, and insecure patterns|
|Audit review|Confirm claims and evidence|

Use only the gates relevant to the project.

Do not create a CI system solely to satisfy a checklist when another deterministic control is more appropriate.

---

# 38. Visual Architecture HTML

Create:

```text
docs/architecture/architecture.html
```

The file must be:

- Self-contained
    
- Usable offline
    
- Free of CDN dependencies
    
- Free of external script dependencies
    
- Portable to restricted environments
    
- Readable in a standard browser
    
- Derived from `AUTHORITATIVE_ARCHITECTURE.md`
    
- Regenerated whenever material architecture changes
    

It must clearly state:

> `AUTHORITATIVE_ARCHITECTURE.md` is the authoritative source. This HTML file is a rendered visual interface.

Include applicable visual sections for:

- Executive architecture summary
    
- OV-1-equivalent operational view
    
- System context
    
- Stakeholders and concerns
    
- Components and responsibilities
    
- Agent and sub-agent relationships
    
- User and system interactions
    
- Data entities
    
- Data flows
    
- Data classification and encryption
    
- Authentication
    
- Authorization
    
- Trust boundaries
    
- API and external integrations
    
- Azure deployment topology
    
- Configuration and secrets
    
- Logging and monitoring
    
- Audit and evidence
    
- Three-layer truth and convergence
    
- Failure handling and recovery
    
- Testing and validation boundaries
    
- Standards traceability
    
- Cost considerations
    
- Known gaps
    
- Known risks
    

Use clear visual techniques such as:

- Interactive SVG
    
- Expandable sections
    
- Relationship graphs
    
- Flow diagrams
    
- Dependency maps
    
- Filterable tables
    
- Traceability links
    
- Tooltips
    
- Layer toggles
    
- Search
    
- Print-friendly formatting
    

Do not use visual complexity merely for appearance.

Every visual must help the user understand a real architectural relationship.

---

# 39. OV-1-Equivalent View

The OV-1-equivalent must communicate, at a glance:

- Mission or business purpose
    
- Primary actors
    
- Major systems
    
- Major agents
    
- Important information exchanges
    
- External dependencies
    
- Operational boundaries
    
- Main workflow
    
- Decision gates
    
- Audit and assurance loop
    

It should be understandable to:

- Executives
    
- Engineers
    
- Administrators
    
- Security personnel
    
- Auditors
    
- Future AI agents
    

---

# 40. Required `AUTHORITATIVE_ARCHITECTURE.md` Structure

Use this structure, removing irrelevant sections when appropriate:

```markdown
# Authoritative Architecture

## Document Authority

## Architecture Metadata

## Current Repository State

## Approved Target Architecture

## Project Requirements Addressed

## Standards and Frameworks

## Stakeholders and Concerns

## Architecture Principles

## System Context and Boundaries

## OV-1-Equivalent Operational View

## User and System Interactions

## Components and Responsibilities

## Agent and Sub-Agent Architecture

## Data Architecture

## Canonical Schema

## Data Flows

## Interfaces and APIs

## External Integrations

## Authentication and Authorization

## Trust Boundaries

## Azure Hosting

## Microsoft Environment

## Configuration and Secrets

## Logging, Monitoring, and Observability

## Continuous Assurance

## Drift and Convergence

## Audit and Evidence

## Failure Handling and Recovery

## Testing and Validation Boundaries

## Deployment and Change Safety

## Cost and Licensing Constraints

## Architecture Traceability

## Architecture Decisions

## Not-Yet-Implemented Components

## Proposed Architecture Pending Decision

## Open Architecture Questions

## Known Risks and Gaps

## Architecture Change Process

## Visual Architecture
```

---

# 41. Architecture Change Process

After initialization, material architecture changes must:

1. Be compared to `PROJECT.md`.
    
2. Be compared to accepted requirements.
    
3. Be checked against Swif7Edge standards.
    
4. Be checked for security and compliance impact.
    
5. Be checked for cost impact.
    
6. Be checked for live-environment risk.
    
7. Be recorded in an ADR.
    
8. Be reflected in `DECISIONS.md`.
    
9. Update `AUTHORITATIVE_ARCHITECTURE.md`.
    
10. Regenerate `docs/architecture/architecture.html`.
    
11. Reconcile repository structure.
    
12. Reconcile scoped rules.
    
13. Reconcile testing and audit controls.
    
14. Reconcile data schema and flows.
    
15. Revalidate affected implementation.
    

Routine refinements that preserve the approved architecture do not require user approval.

Material user-level choices must go through `DECISIONS.xlsx`.

---

# 42. Questions Requiring User Input

Route a question through `DECISIONS.xlsx` when architecture requires:

- Commercial versus GCC High
    
- Any new paid commitment
    
- Material recurring cost
    
- Licensing
    
- Public internet exposure
    
- Broad Microsoft Graph permissions
    
- Tenant-wide consent
    
- Privileged role changes
    
- Sensitive, regulated, or controlled-data handling
    
- Third-party services
    
- Scraping
    
- A new external system
    
- Destructive migration
    
- Irreversible architecture
    
- A material scope tradeoff
    
- An exception to Azure-only policy
    
- An exception to Entra ID
    
- An exception to Microsoft Graph
    
- A security or compliance degradation
    
- A decision only the user can authorize
    

Ask the fewest questions necessary.

Continue all independent safe architecture work while waiting.

---

# 43. Architecture Validation

Before completing this module, verify:

- `AUTHORITATIVE_ARCHITECTURE.md` exists.
    
- `docs/architecture/architecture.html` exists.
    
- The HTML opens offline.
    
- The HTML has no external dependencies.
    
- The selected Microsoft environment is documented or queued for decision.
    
- Azure-only policy is followed.
    
- Entra ID is the default identity provider when applicable.
    
- Microsoft Graph is the default M365 API.
    
- Existing approved APIs were evaluated.
    
- Key Vault is used only for protected secrets, keys, and certificates.
    
- API contracts and schemas remain in Git or API Management.
    
- System boundaries are defined.
    
- Major components have responsibilities.
    
- Agents and sub-agents have bounded authority.
    
- An independent Audit Agent is defined.
    
- Important data entities and flows are documented.
    
- The canonical schema approach is documented.
    
- Authentication and authorization are documented.
    
- Trust boundaries are documented.
    
- Logging and monitoring are documented.
    
- Failure handling and recovery are documented.
    
- Single-live-environment safeguards are documented.
    
- Drift detection is documented.
    
- Plan/apply separation is documented.
    
- Continuous Assurance is documented.
    
- Requirements are traceable.
    
- Proposed and approved architecture are separated.
    
- Paid commitments remain unapproved until a user decision.
    
- Control degradation requires explicit approval.
    
- No implementation backlog was created.
    
- No Azure resources were deployed.
    
- No unauthorized files were modified.
    
- Architecture can guide `15-repository-structure.md` without relying on chat history.
    

---

# 44. Completion Criteria

This module is complete when:

- Enough approved project information exists to establish architecture.
    
- Material unresolved questions are represented in `DECISIONS.xlsx`.
    
- `AUTHORITATIVE_ARCHITECTURE.md` defines the approved target architecture.
    
- The current state and target state are separated.
    
- Repository structural requirements are clear.
    
- Architecture elements are traceable.
    
- Continuous Assurance is defined.
    
- Single-live-environment safeguards are defined.
    
- The Audit Agent is defined.
    
- The visual HTML architecture is generated and validated.
    
- No paid commitment was made.
    
- No live environment was changed.
    
- Validation passes.
    

---

# 45. Module Completion Report

Report to the Primary Orchestrator:

```text
MODULE_STATUS:
MODULE_ID: authoritative_architecture
ARCHITECTURE_FILE:
VISUAL_ARCHITECTURE_FILE:
MICROSOFT_ENVIRONMENT:
AZURE_APPLICABLE:
COMPONENTS_DEFINED:
AGENTS_DEFINED:
DATA_ENTITIES_DEFINED:
DATA_FLOWS_DEFINED:
INTERFACES_DEFINED:
TRUST_BOUNDARIES_DEFINED:
ADRS_CREATED_OR_PROPOSED:
QUESTIONS_ADDED:
PAID_CAPABILITIES_REQUIRING_APPROVAL:
CONTINUOUS_ASSURANCE_DEFINED:
AUDIT_AGENT_DEFINED:
VALIDATION_PERFORMED:
VALIDATION_RESULT:
BLOCKING_ISSUES:
```

Do not list individual user questions in chat.