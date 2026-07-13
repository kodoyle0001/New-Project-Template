

# Scope and Success Criteria

## 1. Purpose

This module creates the authoritative project charter:

```text
PROJECT.md
```

It converts the user’s approved project information into a clear, traceable definition of:

- What the project exists to accomplish
    
- What the project will deliver
    
- What is included
    
- What is excluded
    
- What successful completion means
    
- What constraints govern the work
    
- What requirements future architecture and implementation must satisfy
    

This module is part of the project-definition phase.

It may begin after project identity is established, but it must not complete until enough user information has been received through `DECISIONS.xlsx` to define the project accurately.

This module must not create implementation plans, build tasks, backlog items, architecture, or speculative features.

---

# 2. Primary Output

Create or update:

```text
PROJECT.md
```

`PROJECT.md` is the authoritative source for:

- Project purpose
    
- Desired outcome
    
- Intended users
    
- Deliverable type
    
- Scope
    
- Exclusions
    
- Success criteria
    
- Acceptance criteria
    
- Constraints
    
- Dependencies
    
- Security and compliance expectations
    
- Formal project requirements
    
- Temporary assumptions
    
- Unresolved required information
    
- Definition of project completion
    

Detailed technical architecture belongs in:

```text
AUTHORITATIVE_ARCHITECTURE.md
```

Implementation work belongs in:

```text
BACKLOG.md
```

Current implementation state belongs in:

```text
STATUS.md
```

---

# 3. Phase-Two Dependency

This module may inspect available information during the initial bootstrap phase, but it must not finalize `PROJECT.md` until the minimum project-definition information is available.

Before completion, determine whether the repository contains enough reliable information to define:

- The problem being solved
    
- The desired result
    
- Intended users
    
- Deliverable type
    
- Initial project boundaries
    
- Important exclusions
    
- Success criteria
    
- Acceptance expectations
    
- Material constraints
    
- Security or compliance expectations
    

When enough information already exists, proceed without asking questions.

When information is insufficient:

1. Determine the smallest number of questions needed.
    
2. Submit the questions through `DECISIONS.xlsx`.
    
3. Combine related questions when one clear answer can resolve several fields.
    
4. Continue all work that does not depend on those answers.
    
5. Mark this module `BLOCKED_BY_DECISION` only when it cannot safely complete.
    
6. Resume automatically after the answers are processed.
    

Do not ask project questions in chat.

---

# 4. User Input Requirement

The user must provide the core intent and success definition for the project.

The AI may:

- Organize the user’s information
    
- Normalize wording
    
- Remove duplication
    
- Identify contradictions
    
- Convert broad goals into structured requirements
    
- Derive necessary technical-quality expectations
    
- Apply approved Swif7Edge standards
    
- Recommend clear project boundaries
    

The AI must not independently invent:

- The project’s business purpose
    
- User-desired capabilities
    
- Customer commitments
    
- Success criteria
    
- Deadlines
    
- Budget limits
    
- Regulatory obligations
    
- Sensitive-data requirements
    
- Production-readiness expectations
    
- Features the user did not request
    

The AI should ask the user for outcomes and constraints, not require the user to design the technical solution.

---

# 5. Minimum Questioning Standard

Ask only questions whose answers are necessary to define the repository and future work correctly.

A single broad question is preferred when it can reliably establish several related facts.

An example broad question may ask the user to describe:

- What the project must accomplish
    
- What the final result should be
    
- Who or what will use it
    
- What successful completion means
    
- What must specifically be included or excluded
    

Additional questions are justified only when they materially affect:

- Scope
    
- Success criteria
    
- Security
    
- Compliance
    
- Data handling
    
- Microsoft environment
    
- Deployment expectations
    
- Cost
    
- Testing
    
- Acceptance
    
- Project completion
    

Do not create a fixed questionnaire.

---

# 6. Recommended Scope Development

The AI should create a recommended project scope from the user’s stated desired outcome.

The AI is authorized to add ordinary supporting requirements that are logically necessary to achieve the approved outcome.

Examples may include:

- Authentication when authorized users must access an application
    
- Error handling for external integrations
    
- Validation for user or system inputs
    
- Documentation required to operate the result
    
- Testing required to demonstrate the stated success criteria
    
- Logging required to troubleshoot system behavior
    
- Security controls required by the approved data and deployment context
    

Derived requirements must:

- Be directly connected to an approved user outcome
    
- Be appropriate to the project level
    
- Avoid expanding the business purpose
    
- Avoid introducing unsupported features
    
- Be identified as derived rather than user-specified
    
- Include an authority and source
    

The AI must not convert optional enhancements into required scope.

---

# 7. Project-Level Proportionality

The depth of `PROJECT.md` must match the project.

A small internal script does not require the same success framework as:

- A production web application
    
- A regulated data-processing system
    
- A Microsoft 365 integration
    
- An Azure-hosted service
    
- A customer delivery
    
- A security or compliance automation platform
    

Technical-quality expectations should be proportional to:

- Project impact
    
- Data sensitivity
    
- Number of users
    
- Operational dependency
    
- Security exposure
    
- Compliance requirements
    
- Deployment environment
    
- Complexity
    
- Expected lifetime
    
- Cost of failure
    

Do not add enterprise-level requirements when they are not justified.

Do not omit necessary controls from a high-impact project merely to keep the document short.

---

# 8. No Initialization Backlog

Initialization must create a standardized repository, not a speculative work plan.

`BACKLOG.md` must exist after initialization, but it must contain no work items.

The backlog should initially state only:

```markdown
# Backlog

No backlog items have been authorized or added. Project work has not started.
```

This module does not own `BACKLOG.md`.

The Work Memory module owns the final creation and maintenance of that file.

This module must provide the following requirement to the Work Memory module:

> Create `BACKLOG.md` with the standard empty state. Do not generate milestones, tasks, build slices, future features, recommendations, or implementation work during initialization.

No project work has begun merely because the repository was initialized.

---

# 9. Requirement Traceability

Formal project requirements must use stable identifiers:

```text
REQ-001
REQ-002
REQ-003
```

Do not reuse a requirement ID.

Every formal requirement must identify:

- Requirement ID
    
- Requirement
    
- Requirement type
    
- Authority
    
- Source
    
- Verification method when known
    
- Status
    

Recommended requirement types include:

```text
User Requirement
Organizational Standard
Derived Requirement
Security Requirement
Compliance Requirement
Operational Requirement
Quality Requirement
Constraint
```

Recommended authority values include:

```text
User decision
Explicit user instruction
Swif7Edge standard
Contractual requirement
Regulatory requirement
Derived from approved requirement
Existing authoritative project artifact
```

Examples:

|ID|Requirement|Type|Authority|Source|Verification|Status|
|---|---|---|---|---|---|---|
|REQ-001|The application must operate in Azure Commercial.|Constraint|User decision|Q-0003|Architecture and deployment review|Approved|
|REQ-002|Authentication must use Microsoft Entra ID.|Security Requirement|Swif7Edge standard|Platform policy|Architecture and authentication tests|Approved|

Do not create requirements merely to populate the table.

---

# 10. Requirement Grounding

Every formal requirement must be grounded in one of the following:

- An explicit user instruction
    
- A processed answer from `DECISIONS.xlsx`
    
- An accepted entry in `DECISIONS.md`
    
- An approved Swif7Edge standard
    
- A contractual or regulatory requirement
    
- A logical dependency of an approved requirement
    
- An existing authoritative project artifact
    

Information without a valid source must not be presented as an approved requirement.

The project charter must state:

> Information not documented in an authoritative repository artifact must not be treated as an approved project requirement.

This rule supports drift and hallucination prevention.

---

# 11. User Requirements, Derived Requirements, and Standards

Clearly distinguish among:

## User requirements

Requirements directly stated or approved by the user.

## Organizational standards

Requirements inherited from approved Swif7Edge policies, including:

- Azure as the only cloud platform when cloud is applicable
    
- Microsoft 365 as the enterprise platform
    
- Commercial or GCC High environment selection when relevant
    
- Microsoft Entra ID as the default identity provider
    
- Microsoft Graph as the default Microsoft 365 integration API
    
- Azure-native tools and services where appropriate
    

## Derived requirements

Requirements logically necessary to satisfy approved outcomes.

Derived requirements must not:

- Change the project’s purpose
    
- Expand the intended user population
    
- Add an unrequested business capability
    
- Create a paid commitment
    
- Introduce a prohibited platform
    
- Override a user decision
    

## Temporary assumptions

Explicit, low-risk assumptions used only to continue repository initialization.

---

# 12. Temporary Assumptions

Temporary assumptions are permitted only when they are:

- Explicitly labeled
    
- Necessary to continue initialization
    
- Low risk
    
- Reversible
    
- Consistent with known user intent
    
- Consistent with Swif7Edge standards
    
- Unlikely to materially affect architecture or cost
    
- Scheduled for later confirmation or removal when necessary
    

Every temporary assumption must include:

- Assumption ID
    
- Assumption
    
- Reason it is temporarily needed
    
- Evidence supporting it
    
- Risk if incorrect
    
- Validation or replacement method
    
- Status
    

Use identifiers such as:

```text
ASM-001
ASM-002
```

Temporary assumptions must not silently become approved requirements.

When an assumption becomes confirmed:

- Convert it to the appropriate fact or requirement.
    
- Preserve relevant traceability.
    
- Remove it from the active assumptions section.
    

When an assumption is disproven:

- Correct affected project artifacts.
    
- Identify potential drift.
    
- Revalidate dependent requirements and architecture.
    

Do not use temporary assumptions for:

- Security-critical choices
    
- Compliance obligations
    
- Sensitive-data classification
    
- Production deployment
    
- Paid commitments
    
- Destructive actions
    
- Irreversible architecture
    
- User-facing scope
    

---

# 13. Drift and Hallucination Prevention

`PROJECT.md` must be structured so future AI sessions can distinguish approved facts from unsupported statements.

Apply these controls:

1. Use stable requirement IDs.
    
2. Record requirement authority.
    
3. Record the source of each requirement.
    
4. Separate user requirements from derived requirements.
    
5. Separate approved requirements from assumptions.
    
6. Record unresolved information instead of guessing.
    
7. Do not silently broaden scope.
    
8. Do not silently change success criteria.
    
9. Do not treat descriptive text as authority when it conflicts with the formal requirements table.
    
10. Require material scope changes to be processed through `DECISIONS.xlsx`.
    
11. Require durable changes to be reflected in `DECISIONS.md`.
    
12. Reconcile `PROJECT.md` with architecture and permanent memory during validation.
    

When future work proposes a change that conflicts with `PROJECT.md`, the AI must:

- Identify the conflict
    
- Preserve the existing approved requirement
    
- Route the material change through the decision process
    
- Avoid implementation until the conflict is resolved when necessary
    

---

# 14. Required `PROJECT.md` Structure

Create `PROJECT.md` using this structure:

```markdown
# Project

## Project Identity

## Project Purpose

## Desired Outcome

## Intended Users and Stakeholders

## Deliverable Type

## In Scope

## Out of Scope

## Success Criteria

## Acceptance Criteria

## Technical Quality Expectations

## Security and Compliance Expectations

## Constraints

## Dependencies

## Formal Requirements

## Temporary Assumptions

## Unresolved Required Information

## Definition of Project Completion

## Document Authority
```

Remove empty boilerplate that does not help the project.

Use `None identified` or `Not yet known` only when that is an accurate and useful statement.

---

# 15. Project Purpose

The project-purpose section must explain:

- Why the project exists
    
- What problem or need it addresses
    
- What value or capability it is intended to provide
    

Keep the purpose concise.

Do not include detailed architecture or implementation steps.

---

# 16. Desired Outcome

The desired outcome must describe the completed result.

It should answer:

> What meaningful result must exist when this project is successfully completed?

The desired outcome must:

- Be user-centered or mission-centered
    
- Describe an end state rather than a list of tasks
    
- Be consistent with the project purpose
    
- Avoid unapproved technical detail
    
- Be specific enough to guide architecture
    

---

# 17. Deliverable Type

Identify the nature of the expected result.

Examples may include:

- Production web application
    
- Internal tool
    
- Automation
    
- Microsoft 365 integration
    
- Azure service
    
- Proof of concept
    
- Reusable library
    
- Infrastructure deployment
    
- Documentation package
    
- Research deliverable
    
- Data-analysis capability
    

The deliverable type must come from user information or a reliable inference supported by the approved desired outcome.

When the difference materially affects the repository, success criteria, or architecture, route the question through `DECISIONS.xlsx`.

---

# 18. In Scope

Document capabilities, responsibilities, and results that are approved as part of the project.

Scope statements should:

- Be outcome-oriented
    
- Be testable or reviewable where practical
    
- Avoid unnecessary implementation detail
    
- Map to formal requirements when material
    
- Remain within the approved user intent
    

Do not add optional future capabilities.

---

# 19. Out of Scope

Document boundaries that prevent future drift.

Include:

- Explicit user exclusions
    
- Deferred capabilities that are not currently approved
    
- Platforms or environments prohibited by organizational policy
    
- Responsibilities owned by external systems
    
- Activities intentionally excluded from this repository
    

Do not infer major exclusions without sufficient evidence.

When an exclusion materially affects the project and is unknown, use `DECISIONS.xlsx`.

---

# 20. Success Criteria

Success criteria must be obtained from or approved by the user because they influence repository design and validation.

The AI may structure and clarify the criteria.

Success criteria may cover:

- Required user outcome
    
- Functional completion
    
- Security expectations
    
- Compliance expectations
    
- Reliability
    
- Testing
    
- Documentation
    
- Deployment readiness
    
- Operational usability
    
- Evidence or audit requirements
    

Use criteria appropriate to the project.

Do not invent:

- Arbitrary percentages
    
- Unsupported performance targets
    
- Deadlines
    
- Availability targets
    
- User-volume targets
    
- Financial results
    
- Compliance claims
    

Numeric criteria require a valid source or explicit user approval.

---

# 21. Acceptance Criteria

Acceptance criteria define how the user or another authorized party will determine that the project satisfies its approved requirements.

Acceptance criteria should:

- Map to the desired outcome
    
- Map to formal requirements
    
- Be observable
    
- Be verifiable
    
- Avoid implementation prescriptions unless necessary
    
- Identify evidence or testing when relevant
    

Do not define acceptance criteria that exceed the approved scope.

---

# 22. Technical Quality Expectations

Define technical-quality expectations only at the appropriate project level.

Potential areas include:

- Testing
    
- Security
    
- Reliability
    
- Maintainability
    
- Documentation
    
- Error handling
    
- Observability
    
- Data integrity
    
- Accessibility
    
- Performance
    
- Recoverability
    

These expectations must be grounded in:

- User success criteria
    
- Project impact
    
- Approved architecture
    
- Data sensitivity
    
- Operational need
    
- Swif7Edge standards
    

Do not add every possible quality category to every project.

---

# 23. Security and Compliance Expectations

Summarize known project-level expectations without designing the controls.

Potential items include:

- Microsoft environment
    
- Authentication expectation
    
- Data sensitivity
    
- Access-control requirements
    
- Compliance framework
    
- Auditability
    
- Evidence expectations
    
- Retention requirements
    
- Prohibited data handling
    

Detailed implementation belongs in architecture and scoped security rules.

Unknown material security or compliance information must be added to `DECISIONS.xlsx`.

---

# 24. Constraints and Dependencies

Record only known constraints and dependencies.

Examples include:

- Azure-only cloud policy
    
- Commercial or GCC High
    
- Microsoft 365 integration
    
- Microsoft Graph permissions
    
- Required external systems
    
- Licensing limitations
    
- Delivery restrictions
    
- Data availability
    
- Existing services
    
- Required tools
    

Do not invent external dependencies.

Do not treat a likely dependency as confirmed without evidence.

---

# 25. Unresolved Required Information

List material information that remains unresolved after processing current user answers.

Each item must state:

- What is unknown
    
- Why it matters
    
- Whether it blocks architecture or later work
    
- Whether it has been added to `DECISIONS.xlsx`
    

Do not use this section as a general brainstorming list.

Nonmaterial unknowns should not clutter the project charter.

---

# 26. Definition of Project Completion

Define when the project itself—not repository initialization—is complete.

This definition should be based on:

- Approved desired outcome
    
- Success criteria
    
- Acceptance criteria
    
- Required deliverables
    
- Required validation
    
- Required documentation
    
- Required security or compliance evidence
    

Do not confuse this with initialization completion.

Do not create implementation tasks from the definition.

---

# 27. Changes to Scope or Success Criteria

After `PROJECT.md` is created:

- Material scope changes require a user decision through `DECISIONS.xlsx`.
    
- Material success-criteria changes require a user decision.
    
- Derived requirements may be refined when the refinement preserves approved intent.
    
- Routine wording improvements do not require user approval.
    
- Changes must preserve requirement IDs where meaning remains the same.
    
- Replaced requirements must retain traceability.
    
- Architecture and memory files must be reconciled after material changes.
    

---

# 28. Validation

Before completing this module, verify:

- `PROJECT.md` exists.
    
- Project purpose is supported by user information.
    
- Desired outcome is clear.
    
- Intended users are documented.
    
- Deliverable type is known or a required question is queued.
    
- In-scope statements are supported.
    
- Out-of-scope statements are supported.
    
- Success criteria were obtained from or approved by the user.
    
- Acceptance criteria map to the success criteria.
    
- Technical-quality expectations are proportional.
    
- Requirements have IDs, authority, and sources.
    
- Temporary assumptions are explicit.
    
- Unsupported claims were not introduced.
    
- No implementation backlog was created.
    
- The Work Memory module received the empty-backlog requirement.
    
- No architecture was invented.
    
- No unauthorized file was modified.
    
- `PROJECT.md` can guide the architecture module without relying on chat history.
    

---

# 29. Completion Criteria

This module is complete when:

- The minimum required user information has been processed.
    
- `PROJECT.md` exists.
    
- Scope and exclusions are clear enough to guide architecture.
    
- Success and acceptance criteria are grounded.
    
- Formal requirements are traceable.
    
- Temporary assumptions are controlled.
    
- Material unknowns are in `DECISIONS.xlsx`.
    
- The empty-backlog requirement has been passed to the Work Memory module.
    
- Validation passes.
    

---

# 30. Module Completion Report

Report to the Primary Orchestrator:

```text
MODULE_STATUS:
MODULE_ID: scope_and_success_criteria
PROJECT_FILE:
USER_REQUIREMENTS_CREATED:
ORGANIZATIONAL_REQUIREMENTS_CREATED:
DERIVED_REQUIREMENTS_CREATED:
TEMPORARY_ASSUMPTIONS:
UNRESOLVED_REQUIRED_INFORMATION:
QUESTIONS_ADDED:
EMPTY_BACKLOG_REQUIREMENT_RECORDED:
VALIDATION_PERFORMED:
VALIDATION_RESULT:
BLOCKING_ISSUES:
```

Do not list individual questions in chat.