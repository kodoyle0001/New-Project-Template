


# Technical Guardrails and Continuous Assurance Controls

## 1. Purpose

This module establishes the permanent technical, security, data-integrity, platform, automation, AI, validation, and Continuous Assurance guardrails for the repository.

It must create or safely update:

```text
docs/50-security/technical-guardrails.md
```

This file is the human-readable source for the repository’s technical guardrails.

The module must also provide structured guardrail requirements to:

```text
18-scoped-rules.md
20-multi-agent-orchestration.md
90-final-validation.md
```

Those modules translate the approved guardrails into scoped AI instructions, orchestration behavior, automated checks, and final validation.

This module must not:

- Implement the project
    
- Populate the backlog
    
- Deploy resources
    
- Purchase services
    
- Modify the live environment
    
- Create speculative technology rules unrelated to the project
    
- Create every possible CI job
    
- Treat a compliance framework as proof of certification
    
- Approve exceptions to its own rules
    

---

# 2. Guardrail Authority

Technical guardrails are derived from:

1. `PROJECT.md`
    
2. `AUTHORITATIVE_ARCHITECTURE.md`
    
3. `BUILD_PATTERN.md`
    
4. `DECISIONS.md`
    
5. Approved ADRs
    
6. Swif7Edge organizational standards
    
7. Applicable security and compliance requirements
    
8. Selected technology stack
    
9. Selected Microsoft environment
    
10. Approved external systems and APIs
    

The repository must not rely on chat history as the permanent source of technical rules.

---

# 3. Proportional Application

Guardrails must be proportional to the project.

A small documentation repository does not need the same controls as:

- A production internal application
    
- An Azure service
    
- An M365 tenant automation
    
- A pricing engine
    
- A compliance platform
    
- A data-processing system
    
- An autonomous agent system
    

However, all repositories must preserve the universal controls for:

- Authority
    
- Evidence
    
- Secret protection
    
- Drift prevention
    
- Hallucination prevention
    
- Decision handling
    
- Documentation synchronization
    
- Safe autonomy
    

Do not add irrelevant guardrails merely to make the control set appear comprehensive.

---

# 4. Standards Baseline

Apply the applicable intent and requirements of:

- NIST SP 800-53 Revision 5
    
- CMMC Level 1
    
- CMMC Level 2 when applicable
    
- SOC 2
    
- ISO/IEC/IEEE 42010:2022
    
- CMMI Development Level 5 principles
    
- Swif7Edge Azure standards
    
- Swif7Edge Microsoft 365 standards
    
- Swif7Edge identity standards
    
- Swif7Edge data standards
    
- Swif7Edge Continuous Assurance standards
    
- Approved project-specific standards
    

Do not state that the repository, application, or organization is certified merely because the work follows these guardrails.

Use evidence-based language such as:

- Designed to support
    
- Aligned with
    
- Mapped to
    
- Implements applicable controls
    
- Requires independent verification
    

---

# 5. Universal Hard Rules

The following are universal hard rules:

- Do not store secrets in Git.
    
- Do not fabricate requirements.
    
- Do not fabricate implementation status.
    
- Do not fabricate test results.
    
- Do not fabricate compliance evidence.
    
- Do not claim completion without applicable evidence.
    
- Do not silently broaden project scope.
    
- Do not silently change architecture.
    
- Do not silently change data semantics.
    
- Do not silently approve a standards exception.
    
- Do not allow an implementer to be the only reviewer of material work.
    
- Do not continue after unresolved material drift.
    
- Do not create paid commitments without authorization.
    
- Do not perform destructive or irreversible actions without authorization.
    
- Do not hide known gaps.
    
- Do not treat confidence as evidence.
    
- Do not build from memory when current repository evidence is available.
    

---

# 6. Approved Platform Direction

When cloud capability is required:

```text
Microsoft Azure
```

is the approved public cloud.

Do not introduce:

- Amazon Web Services
    
- Google Cloud Platform
    
- Oracle Cloud Infrastructure
    
- Another public cloud
    

without an explicit standards exception approved through `DECISIONS.xlsx`.

Microsoft 365 is the approved enterprise productivity and tenant platform when applicable.

Microsoft-native and Azure-native capabilities are preferred when they satisfy the requirement safely and effectively.

Do not add Azure services merely because they exist.

Every service must support an approved requirement or architecture responsibility.

---

# 7. Microsoft Environment

The approved Microsoft environment must be explicitly identified as:

```text
Commercial
```

or:

```text
GCC High
```

The repository must not assume the environment when it materially affects:

- Endpoints
    
- Authentication
    
- Data handling
    
- Compliance
    
- Integration capability
    
- Licensing
    
- Deployment
    
- CUI boundaries
    

Swif7Edge operates one live environment for the selected project context.

Do not create fictional deployed dev, test, and production environments.

Local-only build tools, stubs, synthetic data, deployment slots, or isolated non-user-facing resources may be used when they preserve the one-live-environment rule.

---

# 8. Single-Live-Environment Safety

Because there is no separate deployed development or test environment, changes affecting live services require additional safeguards.

Before mutation:

1. Read current state.
    
2. Validate authority.
    
3. Capture relevant current-state evidence.
    
4. Compare current state to policy and desired state.
    
5. Detect drift.
    
6. Produce a deterministic plan.
    
7. Identify affected resources.
    
8. Identify failure modes.
    
9. Identify rollback or recovery.
    
10. Validate break-glass or emergency access when identity controls are affected.
    
11. Obtain required decisions.
    
12. Apply only the approved plan.
    

After mutation:

1. Verify actual state.
    
2. Compare actual state to the plan.
    
3. Re-run drift detection.
    
4. Confirm idempotence.
    
5. Record applied state.
    
6. Record evidence.
    
7. Update authoritative documentation.
    
8. Run independent audit.
    

---

# 9. Policy, Desired State, Runtime, and Recorded State

When the project manages live configuration or infrastructure, use:

```text
Policy
→ Desired state
→ Runtime configuration
→ Plan and diff
→ Live state
→ Recorded applied state
```

Rules:

- Policy defines what is allowed.
    
- Desired state defines what should exist.
    
- Runtime configuration provides environment-specific values.
    
- Planning compares desired state to live state.
    
- Apply converges only authorized differences.
    
- Recorded state captures what was verified and applied.
    
- Unexplained material drift blocks mutation.
    
- Live state does not silently overwrite policy.
    
- Desired state does not blindly overwrite unexplained live state.
    

---

# 10. Plan and Apply Separation

State-changing workflows must separate planning from mutation.

Default behavior must be read-only.

Mutation requires an explicit operation such as:

```text
-Apply
--apply
apply
```

Requirements:

- Planning does not mutate.
    
- The plan identifies intended changes.
    
- The plan identifies affected resources.
    
- The plan identifies data impact.
    
- The plan identifies security impact.
    
- The plan identifies cost impact.
    
- The plan identifies rollback or recovery.
    
- Apply executes only the approved plan.
    
- Apply fails closed when preconditions are not met.
    
- A second run is a no-op when state is converged.
    
- Partial failure does not silently leave unknown state.
    
- Applied state is recorded only after verification.
    

---

# 11. PowerShell Guardrails

For PowerShell source and automation, prohibit:

- Deprecated AzureAD modules
    
- Deprecated MSOnline modules
    
- Deprecated Msol commands
    
- `Invoke-Expression`
    
- `iex`
    
- Hardcoded credentials
    
- Plaintext secrets
    
- Unsafe plaintext `ConvertTo-SecureString`
    
- Interactive authentication in unattended automation
    
- Device-code authentication in unattended automation
    
- Silent error suppression
    
- Unbounded retries
    
- Mutation without explicit apply behavior
    
- `Write-Host` in reusable `/src` or `/scripts` code when structured output streams should be used
    

Require, when applicable:

- `SupportsShouldProcess`
    
- `-WhatIf`
    
- `Set-StrictMode`
    
- Explicit error handling
    
- Structured output
    
- Appropriate `Write-Verbose`, `Write-Warning`, `Write-Error`, or information streams
    
- Pester tests
    
- Idempotence
    
- Timeouts
    
- Bounded retries
    
- Duplicate-action protection
    

---

# 12. Microsoft Graph Standard

Microsoft Graph is the default API for Microsoft 365 automation.

Do not use deprecated AzureAD, MSOnline, or Msol tooling.

Graph integrations must:

- Use the correct cloud endpoint.
    
- Use least-privilege permissions.
    
- Distinguish delegated and application permissions.
    
- Document required consent.
    
- Validate tenant and audience.
    
- Handle pagination.
    
- Handle throttling.
    
- Use bounded retry and backoff.
    
- Validate response schemas.
    
- Log correlation information without exposing tokens.
    
- Record permission and consent requirements.
    
- Detect API-version or endpoint drift.
    

Broad Graph permissions or tenant-wide consent require explicit user authorization.

---

# 13. API-First Integration

Use this integration preference order:

1. Existing approved Swif7Edge API
    
2. Microsoft Graph
    
3. Existing Azure API Management-managed API
    
4. Vendor-supported API
    
5. Approved Azure-native integration
    
6. Controlled alternative
    
7. Scraping only as an approved exception
    

Before building an integration:

- Determine whether an approved interface already exists.
    
- Inspect the current API contract.
    
- Reuse the approved interface when it satisfies the requirement.
    
- Avoid creating duplicate connectors.
    
- Avoid recreating existing organizational capability.
    

Scraping requires explicit user authorization.

---

# 14. API Management and Key Vault

Use Azure API Management, when applicable, for:

- API catalog
    
- API exposure
    
- Versioning
    
- Policies
    
- Access mediation
    
- Rate controls
    
- Transformations
    
- Observability
    

Use Azure Key Vault for:

- Secrets
    
- Keys
    
- Certificates
    
- Protected connection material
    

Do not store in Key Vault:

- API source code
    
- API contracts
    
- OpenAPI definitions
    
- Schemas
    
- Ordinary endpoint metadata
    
- Non-secret configuration
    

Prefer managed identity for access to Key Vault and other Azure resources.

---

# 15. Secret Management

Secrets must never be:

- Hardcoded
    
- Committed
    
- Printed
    
- Logged
    
- Added to screenshots
    
- Included in test fixtures
    
- Placed in `DECISIONS.xlsx`
    
- Placed in `report.html`
    
- Embedded in URLs
    
- Returned in agent reports
    

Use:

- Azure Key Vault
    
- Managed identities
    
- Workload identities
    
- Certificate-based authentication
    
- Approved runtime secret injection
    

Identifiers such as tenant IDs and client IDs are not secrets, but they must still be handled accurately.

---

# 16. Authentication Standard

Microsoft Entra ID is the default identity provider.

Prefer:

- Managed identity for Azure workloads
    
- Certificate-based app-only authentication for unattended services
    
- Authorization-code flow with PKCE for approved SPA sign-in
    
- Server-side token validation
    
- Least privilege
    
- Group object IDs rather than display names
    
- PIM for privileged roles
    
- Separated administrative identities
    
- Explicit scope allowlists
    

Do not use:

- Shared accounts
    
- Frontend-trusted roles
    
- Unvalidated JWT claims
    
- Client secrets in public SPA clients
    
- Device-code authentication in unattended automation
    
- Interactive authentication in unattended automation
    
- Email aliases as durable identity keys when a stable Entra identifier is available
    

---

# 17. Entra SSO Pattern Activation

For an applicable internal SPA-plus-API application, activate the approved standard:

```text
docs/50-security/entra-sso-internal-apps.md
```

The architecture must define:

- Entra authority
    
- Tenant
    
- Client and resource identifiers
    
- PKCE
    
- Redirect URIs
    
- Token validation
    
- Group gating
    
- Group-overage handling
    
- Role resolution
    
- Dev-stub prohibition on deployed systems
    
- Logging
    
- Live validation
    
- Commercial versus GCC High boundaries
    

A deviation requires an approved ADR and user decision.

---

# 18. Break-Glass Protection

Before changing:

- Conditional Access
    
- Privileged roles
    
- Authentication policy
    
- Identity protection
    
- Tenant-wide access
    
- Emergency-access-sensitive configuration
    

the automation must:

1. Identify approved break-glass accounts.
    
2. Verify the accounts exist.
    
3. Verify the accounts are enabled.
    
4. Verify required emergency authentication is available.
    
5. Inject or confirm required policy exclusions before applying changes.
    
6. Prevent removal of the final valid emergency-access path.
    
7. Record evidence.
    
8. Block mutation if validation fails.
    

The AI may not waive this safeguard.

---

# 19. Authorization and Role Changes

The following require explicit user authorization:

- Broad Graph permissions
    
- Tenant-wide administrator consent
    
- Privileged role assignments
    
- Conditional Access changes
    
- Public exposure
    
- New administrator identities
    
- Removal of emergency-access exclusions
    
- Application assignment-policy changes
    
- Material authorization-model changes
    

The AI may prepare:

- Required permissions
    
- Rationale
    
- Risk analysis
    
- Alternatives
    
- Least-privilege recommendation
    
- Administrative procedure
    

It may not authorize the change itself.

---

# 20. Data Classification

Every major data entity must identify, as applicable:

- Owner
    
- Source
    
- Classification
    
- Sensitivity
    
- CUI status
    
- Encryption
    
- Retention
    
- Access rules
    
- Logging restrictions
    
- Disposal requirements
    
- Schema
    
- Provenance
    

Do not process data whose classification is materially unclear.

Commercial repositories and Commercial-tenant applications must not process CUI unless an explicit approved architecture states otherwise and the environment is authorized.

---

# 21. Canonical Data Schema

Use the Swif7Edge canonical schema when applicable.

The standard model is:

- Centrally authoritative
    
- Versioned
    
- Copied locally at a known version
    
- Validated before use
    
- Traceable to its central source
    
- Updated through a controlled change process
    

Do not silently create an incompatible local schema.

A project-specific extension must:

- Preserve canonical identifiers and classifications.
    
- Document the extension.
    
- Avoid naming collisions.
    
- Include migration and compatibility analysis.
    
- Receive approval when materially incompatible.
    

---

# 22. Data-Integrity Hard Gate

Stop affected work before implementing changes involving:

- Currency
    
- Pricing
    
- Rates
    
- Percentages
    
- Decimal precision
    
- Measurement units
    
- Dates
    
- Timezones
    
- Identifiers
    
- Enumerations
    
- Compliance scores
    
- Schema migrations
    
- Existing production records
    
- Data transformations
    
- Import or export semantics
    

Validate:

- Existing source of truth
    
- Existing schema
    
- Existing units
    
- Existing precision
    
- Existing migration history
    
- Proposed semantics
    
- Conversion logic
    
- Backward compatibility
    
- Rollback
    
- Evidence
    

Values such as:

```text
0.30
```

and:

```text
30.0
```

must not be treated as equivalent without documented semantic proof.

Prefer referencing an existing authoritative table or schema over forking it.

---

# 23. Database and Migration Guardrails

Database and schema changes must:

- Inspect current schema.
    
- Inspect existing migrations.
    
- Identify data ownership.
    
- Identify dependencies.
    
- Preserve existing semantics.
    
- Define forward migration.
    
- Define rollback or recovery.
    
- Include compatibility analysis.
    
- Include representative tests.
    
- Avoid destructive operations by default.
    
- Avoid silent column repurposing.
    
- Avoid duplicate sources of truth.
    
- Avoid changing units without migration logic.
    

A destructive or irreversible migration requires explicit user authorization.

---

# 24. Input and Output Validation

Validate all external input.

Applicable validation includes:

- Type
    
- Range
    
- Format
    
- Length
    
- Encoding
    
- Schema
    
- Allowed values
    
- Authorization
    
- Resource ownership
    
- File type
    
- File size
    
- Data classification
    

Do not trust:

- Frontend input
    
- Agent output
    
- API responses
    
- Imported files
    
- Environment variables
    
- Live tenant data
    
- Generated model content
    

Malformed or unsupported output must be rejected rather than coerced silently.

---

# 25. Error Handling

Errors must be:

- Detected
    
- Classified
    
- Contained
    
- Logged appropriately
    
- Returned safely
    
- Retried only when retryable
    
- Escalated when necessary
    
- Preserved as evidence when material
    

Do not:

- Swallow exceptions silently
    
- Return stack traces to unauthorized users
    
- Log secrets
    
- Retry permanent failures indefinitely
    
- Continue after an unknown partial mutation
    
- Mark a task complete after an unhandled error
    

---

# 26. Retry and Timeout Controls

Every external or long-running operation must define:

- Timeout
    
- Maximum retry count
    
- Backoff
    
- Retryable error classes
    
- Nonretryable error classes
    
- Duplicate-action protection
    
- Idempotency
    
- Cancellation
    
- Orphan cleanup
    
- Escalation
    

Agent failure must not become cloud or tenant failure.

Unbounded retries are prohibited.

---

# 27. Dependency Guardrails

Dependencies must be:

- Necessary
    
- Maintained
    
- Compatible
    
- License-reviewed when relevant
    
- Security-reviewed
    
- Version-controlled
    
- Locked through the selected package manager
    
- Updated deliberately
    

Do not:

- Add duplicate libraries for the same purpose without justification.
    
- Add a third-party service when approved Azure capability satisfies the requirement.
    
- Add abandoned packages without a documented reason.
    
- Add competing package-manager lockfiles.
    
- Hide major dependency changes inside unrelated work.
    

Material third-party services require user authorization.

---

# 28. Infrastructure as Code

Use infrastructure as code when Azure infrastructure is part of the project.

Preferred order:

1. Bicep
    
2. Azure Verified Modules
    
3. Another approved Azure-native method
    
4. Terraform only when justified and explicitly approved
    

Infrastructure definitions must:

- Be reviewable
    
- Be versioned
    
- Be validated
    
- Avoid hardcoded secrets
    
- Use managed identity where practical
    
- Include tags and ownership
    
- Include logging and monitoring
    
- Include rollback or recovery
    
- Reflect the approved architecture
    
- Respect cost authorization
    

Do not manually create permanent infrastructure that should be reproducible through code unless a true external gate requires it.

---

# 29. Cost Guardrail

Before creating any new:

- Paid service
    
- Subscription
    
- License
    
- Marketplace item
    
- Recurring consumption
    
- Capacity commitment
    
- Third-party account
    
- Premium feature
    

the AI must:

1. Identify the requirement.
    
2. Identify the capability.
    
3. Estimate one-time and recurring cost.
    
4. Identify alternatives.
    
5. Explain maintenance impact.
    
6. Add the decision to `DECISIONS.xlsx`.
    
7. Obtain explicit authorization.
    
8. Record the durable decision.
    

Existing already-authorized or prepaid capabilities may be reused within approved scope.

---

# 30. Public Exposure

Do not expose an application, API, storage account, endpoint, dashboard, or administrative interface publicly without explicit authorization.

When public exposure is required, define:

- Business reason
    
- Authentication
    
- Authorization
    
- Network restrictions
    
- Rate controls
    
- Input validation
    
- Logging
    
- Monitoring
    
- Threat protection
    
- Data boundary
    
- Recovery
    
- Cost
    
- Evidence
    

Anonymous access is prohibited unless explicitly required and approved.

---

# 31. Logging and Monitoring

Use approved Microsoft-native capabilities when applicable:

- Azure Monitor
    
- Application Insights
    
- Log Analytics
    
- Microsoft Defender
    
- Microsoft 365-native alerting
    
- Structured application logs
    
- Audit logs
    
- Correlation identifiers
    
- Health checks
    

Log:

- Material state changes
    
- Authentication events
    
- Authorization denials
    
- Administrative actions
    
- Drift
    
- Failures
    
- Recovery
    
- Audit findings
    
- Evidence references
    

Do not log:

- Secrets
    
- Tokens
    
- Private keys
    
- Sensitive payloads without approval
    
- Complete regulated records
    
- Unnecessary personal information
    

---

# 32. Evidence Requirements

Evidence is required for material claims.

Evidence may include:

- Test output
    
- Screenshots
    
- Live-state verification
    
- Diffs
    
- Logs
    
- Schema-validation results
    
- Audit reports
    
- Deployment verification
    
- Access-control verification
    
- Compliance Manager evidence
    
- Recorded current state
    

Compliance screenshot evidence must be stored as actual image files when screenshots are required.

Do not replace screenshot evidence with a text statement that a screenshot was viewed.

---

# 33. Testing Guardrails

Testing must be proportional to the project and risk.

Applicable tests include:

- Unit tests
    
- Schema tests
    
- Static analysis
    
- Policy scans
    
- Integration tests
    
- Authentication tests
    
- Authorization tests
    
- Data-integrity tests
    
- Migration tests
    
- Failure-path tests
    
- Idempotence tests
    
- Drift-detection tests
    
- Recovery tests
    
- Live authorized-resource verification
    
- End-to-end tests
    
- User acceptance
    

Mocks may support development.

Mocks alone do not prove a live external integration works.

---

# 34. CI Control Categories

When CI is applicable, evaluate:

- Policy scan
    
- Lint
    
- Test
    
- Infrastructure validation
    
- Documentation check
    
- Schema validation
    
- Architecture-drift check
    
- Requirement-traceability check
    
- Secret scan
    
- Dependency scan
    
- Audit review
    

Do not create irrelevant CI jobs.

Every configured gate must have:

- Purpose
    
- Trigger
    
- Pass criteria
    
- Failure behavior
    
- Evidence
    
- Owner
    

---

# 35. Documentation Cascade

Code, configuration, architecture, rules, schemas, and documentation must remain synchronized.

A material change must update applicable:

- `PROJECT.md`
    
- `AUTHORITATIVE_ARCHITECTURE.md`
    
- `DECISIONS.md`
    
- ADRs
    
- `BUILD_PATTERN.md`
    
- `STATUS.md`
    
- `BACKLOG.md`
    
- Designs
    
- API contracts
    
- Schemas
    
- Runbooks
    
- Security documentation
    
- Architecture HTML
    
- `report.html`
    

A change is not complete while its authoritative documentation is stale.

---

# 36. AI and Agent Guardrails

AI agents must:

- Use bounded scope.
    
- Have explicit read and write authority.
    
- Use current repository evidence.
    
- Trace work to requirements.
    
- Validate outputs.
    
- Report assumptions.
    
- Reject malformed outputs.
    
- Preserve unrelated work.
    
- Use bounded retries.
    
- Respect kill switches.
    
- Avoid unmanaged agent trees.
    
- Avoid overlapping writes.
    
- Produce machine-checkable completion reports.
    

Agents must not:

- Approve their own exception.
    
- Fabricate evidence.
    
- Expand scope silently.
    
- Modify files outside assigned ownership.
    
- Spawn uncontrolled sub-agents.
    
- Treat a model response as deterministic proof.
    
- Claim a live integration works without applicable verification.
    

---

# 37. Independent Review and Audit

Material work requires review independent from the implementer.

Every Slice must receive an audit.

Every Wave must receive a consolidated audit.

The Audit Agent must evaluate:

- Goal alignment
    
- Requirement conformance
    
- Architecture conformance
    
- Scope drift
    
- Data integrity
    
- Security
    
- Compliance
    
- Testing
    
- Evidence
    
- Documentation synchronization
    
- Live-state drift
    
- Hallucinated claims
    
- Unsupported completion
    
- Exceptions
    
- Cost authorization
    

The Audit Agent may block completion.

It must not silently fix the implementation it audits.

---

# 38. Hallucination Prevention

The repository must distinguish:

- Approved facts
    
- Requirements
    
- Architecture
    
- Implemented state
    
- Verified results
    
- Assumptions
    
- Recommendations
    
- Proposed work
    
- Unknowns
    

Rules:

- Unknown information remains unknown.
    
- Planned work is not implemented work.
    
- Target architecture is not current state.
    
- An AI statement is not evidence.
    
- Unsupported claims must be rejected.
    
- Requirements need authority and source.
    
- Major components map to requirements.
    
- Major decisions have durable records.
    
- Completion claims identify evidence.
    

---

# 39. Drift Prevention

Detect drift involving:

- Requirements
    
- Architecture
    
- Schemas
    
- Data semantics
    
- APIs
    
- Permissions
    
- Authentication
    
- Authorization
    
- Infrastructure
    
- Configuration
    
- Agent authority
    
- Dependencies
    
- Documentation
    
- Live state
    
- Compliance controls
    
- Cost commitments
    

Material unexplained drift blocks completion and applicable mutation.

The system must determine whether:

- The implementation is wrong.
    
- The documentation is stale.
    
- The live state changed.
    
- The requirement changed.
    
- An external administrator changed the environment.
    
- An unauthorized change occurred.
    

---

# 40. Control-Degradation Gate

A change that degrades an applicable:

- Security control
    
- Compliance control
    
- Quality control
    
- Architecture standard
    
- Data-protection requirement
    
- Reliability safeguard
    
- Auditability requirement
    
- Evidence requirement
    

must stop before application.

The AI must document:

- Existing control
    
- Proposed degradation
    
- Reason
    
- Alternatives
    
- Risks
    
- Compensating controls
    
- Duration
    
- Owner
    
- Recovery plan
    
- Review date
    
- Framework impact
    

Explicit user approval through `DECISIONS.xlsx` is required.

The AI may recommend the exception.

The AI may not approve it.

---

# 41. Exception Handling

A technical exception requires:

1. Identified rule.
    
2. Reason an approved standard cannot be followed.
    
3. Alternatives.
    
4. Security analysis.
    
5. Compliance analysis.
    
6. Data-impact analysis.
    
7. Cost analysis.
    
8. Operational impact.
    
9. Compensating controls.
    
10. Duration.
    
11. Recovery or exit plan.
    
12. User authorization.
    
13. ADR.
    
14. Validation.
    
15. Audit.
    

Temporary exceptions must have an expiration or review condition.

---

# 42. Required Technical Guardrail Document

Create:

```text
docs/50-security/technical-guardrails.md
```

Use this structure:

```markdown
# Technical Guardrails

## Document Authority

## Applicable Standards

## Platform Rules

## Microsoft Environment

## Single-Live-Environment Safety

## Policy and Desired-State Rules

## Plan and Apply

## Identity and Access

## Microsoft Graph

## APIs and Integrations

## Secrets and Key Vault

## Data Classification

## Canonical Schema

## Data Integrity

## Databases and Migrations

## Input Validation

## Error Handling

## Retry and Timeout Controls

## Dependencies

## Infrastructure as Code

## Cost Authorization

## Public Exposure

## Logging and Monitoring

## Testing

## Evidence

## AI and Agent Controls

## Independent Review

## Drift Prevention

## Hallucination Prevention

## Control-Degradation Rule

## Exceptions

## Validation
```

Remove sections that are genuinely inapplicable.

Do not weaken universal hard rules.

---

# 43. Handoff to Scoped Rules

Provide `18-scoped-rules.md` with a structured mapping of:

- Universal repository rules
    
- Language-specific rules
    
- Directory-specific rules
    
- Security-specific rules
    
- Infrastructure-specific rules
    
- Data-specific rules
    
- M365-specific rules
    
- Agent-specific rules
    
- Testing rules
    
- Documentation rules
    
- Evidence rules
    

Do not create duplicate conflicting instructions.

The human-readable technical guardrail document remains the source.

Scoped rules provide context-specific enforcement.

---

# 44. Validation

Before completing this module, verify:

- The technical-guardrail document exists.
    
- Guardrails match the project and architecture.
    
- Azure-only policy is preserved when cloud applies.
    
- The Microsoft environment is identified or queued for decision.
    
- One-live-environment safeguards are defined.
    
- Plan/apply separation is defined.
    
- Drift blocking is defined.
    
- Microsoft Graph is the default for M365.
    
- Deprecated Microsoft modules are prohibited.
    
- Secret rules are defined.
    
- Key Vault use is correct.
    
- API-first integration is defined.
    
- Authentication and authorization rules are defined.
    
- Break-glass protection is defined when applicable.
    
- Data classification is defined.
    
- Canonical schema use is defined.
    
- Data-integrity gates are defined.
    
- Migration safeguards are defined.
    
- Bounded retries and timeouts are defined.
    
- Cost authorization is defined.
    
- Public exposure requires authorization.
    
- Evidence requirements are defined.
    
- Independent review is defined.
    
- Slice and Wave audit requirements are defined.
    
- Hallucination prevention is defined.
    
- Control degradation requires user approval.
    
- Exceptions require ADRs and decisions.
    
- No backlog items were created.
    
- No resources were deployed.
    
- No purchase was made.
    
- No live environment was changed.
    

---

# 45. Completion Criteria

This module is complete when:

- Permanent technical guardrails exist.
    
- The guardrails reflect approved project requirements.
    
- Universal hard rules are clear.
    
- Project-specific rules are proportional.
    
- Continuous Assurance is integrated.
    
- Hard safety gates are defined.
    
- Exception authority remains with the user.
    
- Later modules have the information needed for scoped enforcement.
    
- Validation passes.
    

---

# 46. Module Completion Report

Report to the Primary Orchestrator:

```text
MODULE_STATUS:
MODULE_ID: technical_guardrails
GUARDRAIL_FILE:
UNIVERSAL_RULES_DEFINED:
PROJECT_SPECIFIC_RULES_DEFINED:
M365_RULES_APPLICABLE:
AZURE_RULES_APPLICABLE:
DATA_INTEGRITY_RULES_DEFINED:
IDENTITY_RULES_DEFINED:
PLAN_APPLY_DEFINED:
DRIFT_CONTROLS_DEFINED:
HALLUCINATION_CONTROLS_DEFINED:
AUDIT_CONTROLS_DEFINED:
EXCEPTIONS_REQUIRING_DECISION:
SCOPED_RULE_HANDOFF_CREATED:
VALIDATION_PERFORMED:
VALIDATION_RESULT:
BLOCKING_ISSUES:
```

Do not list individual user questions in chat.


