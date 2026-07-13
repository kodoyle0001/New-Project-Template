


# Swif7Edge Standard Build Pattern

## 1. Purpose

This document defines the mandatory work pattern for planning, designing, building, validating, auditing, and reporting work in this repository.

The pattern exists to ensure that:

- Every task advances an approved project goal.
    
- Work is organized into coherent, substantial units.
    
- AI agents operate autonomously within safe boundaries.
    
- Repository evidence takes priority over memory or confident assertions.
    
- Requirements, architecture, implementation, testing, and documentation remain synchronized.
    
- Drift and hallucinations are detected before completion is claimed.
    
- Data integrity, security, compliance, and operational safety are protected.
    
- The user can understand the entire project through one consolidated human-facing report.
    
- Work can continue across sessions without depending on chat history.
    

This pattern applies to all material work performed in the repository.

---

# 2. Mandatory Use

All human users, AI orchestrators, build executors, specialist agents, reviewers, and audit agents must follow this build pattern.

The pattern applies to:

- Software development
    
- Automation
    
- Infrastructure
    
- Microsoft 365 changes
    
- Azure changes
    
- Data engineering
    
- API integrations
    
- Security engineering
    
- Compliance automation
    
- Documentation systems
    
- AI-agent systems
    
- Research or analysis that produces repository artifacts
    

Small changes may use a proportionally lighter version of the pattern, but they must still preserve:

- Goal alignment
    
- Scope reconciliation
    
- Validation
    
- Evidence
    
- Documentation synchronization
    
- Drift checking
    
- Auditability
    

---

# 3. Core Operating Principle

The canonical work loop is:

```text
Understand the authorized outcome
→ inspect the repository and authorized environment
→ reconcile requested scope with actual state
→ confirm goal and requirement alignment
→ design before building
→ create or update the validation harness
→ organize work into waves, slices, and tasks
→ implement bounded work
→ validate with evidence
→ audit for drift and hallucination
→ integrate
→ update authoritative artifacts
→ update report.html
→ provide a consolidated report
→ obtain or infer authorization for the next wave
```

The system must not build from memory when current repository evidence is available.

The system must not report completion based solely on an agent’s statement.

---

# 4. Work Hierarchy

Work is organized into three levels:

```text
Wave
  └── Slice
        └── Task
```

## 4.1 Wave

A Wave is the program-level unit of work.

A Wave:

- Advances a significant portion of the project goal.
    
- Contains one or more related Slices.
    
- Produces a coherent, reviewable project outcome.
    
- May run for a substantial work session.
    
- Is re-evaluated against the full project before it begins.
    
- Ends with consolidated validation, audit, documentation, and reporting.
    

A Wave is comparable to a program containing several related projects.

A Wave should be large enough to create meaningful progress without becoming too large to validate, audit, or recover safely.

An exact time duration is not required.

## 4.2 Slice

A Slice is the project-level unit within a Wave.

A Slice:

- Delivers an integrated and meaningful capability.
    
- Contains one or more bounded Tasks.
    
- Builds on previously validated Slices.
    
- Has a clear purpose and definition of done.
    
- Maps to approved requirements.
    
- Includes applicable design, implementation, testing, documentation, and audit.
    
- Must leave the repository in a coherent validated state.
    

A Slice should represent a vertical or otherwise complete increment, not an arbitrary collection of files.

The concept is similar to additive manufacturing: each validated Slice builds on prior Slices until the larger outcome exists.

## 4.3 Task

A Task is the smallest bounded execution unit.

A Task must define:

- Purpose
    
- Requirement or Slice supported
    
- Inputs
    
- Expected outputs
    
- File or resource scope
    
- Owner
    
- Dependencies
    
- Validation
    
- Evidence
    
- Failure behavior
    
- Completion condition
    

Tasks should be large enough to be useful but small enough to assign, validate, retry, or replace independently.

---

# 5. Goal Alignment

Every Wave, Slice, and Task must trace back to the approved project goal.

The alignment chain is:

```text
Project goal
→ desired outcome
→ approved requirement
→ Wave
→ Slice
→ Task
→ implementation
→ validation evidence
```

Before work begins, the orchestrator must be able to explain:

1. What project goal the work advances.
    
2. Which approved requirements it satisfies.
    
3. Why the work is necessary.
    
4. How successful completion will be verified.
    
5. What would happen if the work were omitted.
    

Work that cannot be connected to an approved goal or requirement must not be treated as authorized project work.

Routine supporting engineering may be derived when it is logically necessary to complete an approved requirement.

Derived work must not silently expand the project’s business scope.

---

# 6. Authoritative Sources

The build process must use the repository’s fixed authority order:

1. Component- or service-specific authoritative files
    
2. `AUTHORITATIVE_ARCHITECTURE.md`
    
3. `PROJECT.md`
    
4. Accepted ADRs and `DECISIONS.md`
    
5. `BUILD_PATTERN.md`
    
6. Root `CLAUDE.md`
    
7. Scoped `.claude/rules/`
    
8. Approved standards and references
    
9. Supporting documentation
    
10. Current repository and authorized live-state evidence
    

A lower source must not silently override a higher source.

When sources conflict:

1. Identify the conflict.
    
2. Determine which source is authoritative.
    
3. Stop only the affected work.
    
4. Correct routine documentation drift autonomously when authority is clear.
    
5. Route a material decision through `DECISIONS.xlsx`.
    
6. Do not invent a resolution.
    

---

# 7. Roles

Use tool-independent role names so the workflow remains valid as models and platforms change.

## 7.1 Human Project Authority

The Human Project Authority:

- Defines or approves project intent.
    
- Authorizes material exceptions.
    
- Authorizes paid commitments.
    
- Resolves decisions outside AI authority.
    
- May explicitly or implicitly authorize a Wave.
    
- Remains the final authority for consequential scope, risk, cost, and control-degradation decisions.
    

## 7.2 Primary Orchestrator

The Primary Orchestrator:

- Interprets user intent.
    
- Inspects the repository and available evidence.
    
- Determines whether work is authorized.
    
- Reconciles requested work with actual state.
    
- Designs Waves and Slices.
    
- Decomposes Slices into bounded Tasks.
    
- Assigns agents and models.
    
- Maintains file and resource ownership.
    
- Integrates outputs.
    
- Resolves routine failures autonomously.
    
- Enforces decision and safety gates.
    
- Updates authoritative documentation.
    
- Produces consolidated reports.
    
- Remains accountable for the complete result.
    

Delegation does not transfer accountability.

## 7.3 Build Executor

The Build Executor:

- Performs assigned implementation work.
    
- Works only within defined scope.
    
- Uses the approved design and architecture.
    
- Runs required tests.
    
- Produces evidence.
    
- Reports exact files and resources changed.
    
- Does not expand scope.
    
- Does not approve exceptions to standards.
    

## 7.4 Specialist Agent

A Specialist Agent performs bounded work requiring specialized knowledge, such as:

- Security review
    
- Data modeling
    
- API analysis
    
- Infrastructure review
    
- Compliance mapping
    
- User experience
    
- Testing
    
- Documentation
    

A Specialist Agent must have explicit read, write, and prohibited scopes.

## 7.5 Independent Reviewer

The Independent Reviewer:

- Reviews implementation independently from its author.
    
- Evaluates correctness and maintainability.
    
- Verifies requirements and design alignment.
    
- Challenges unsupported assumptions.
    
- Reviews high-risk Slices before integration.
    

## 7.6 Audit Agent

The Audit Agent:

- Is independent from the implementer.
    
- Is read-only by default.
    
- Evaluates evidence, not confidence.
    
- Checks for drift, hallucination, unsupported claims, and standards violations.
    
- Audits every Slice.
    
- Performs a consolidated audit at Wave completion.
    
- May block Slice or Wave completion.
    
- Must not silently repair the work it audits.
    

---

# 8. Work Authorization

The Primary Orchestrator determines whether work is authorized from the Human Project Authority’s instructions.

Authorization may be:

- Explicit
    
- Clearly implied by the user’s requested outcome
    
- Already represented in an approved requirement
    
- Already represented in an authorized backlog item
    
- A logically necessary supporting activity for authorized work
    

The orchestrator must document its interpretation when authorization is implied rather than explicit.

The orchestrator may not infer authorization for:

- Scope expansion
    
- New paid commitments
    
- Licensing purchases
    
- Public exposure
    
- Broad Microsoft Graph permissions
    
- Tenant-wide consent
    
- Privileged-role changes
    
- Conditional Access changes
    
- New third-party platforms
    
- Scraping
    
- Destructive actions
    
- Irreversible migrations
    
- Security or compliance degradation
    
- Exceptions to Swif7Edge standards
    
- Processing newly identified sensitive or regulated data
    
- Material architecture changes outside approved requirements
    

These require explicit user authorization through the decision process.

---

# 9. Backlog Relationship

`BACKLOG.md` contains authorized future work after project work begins.

During repository initialization, `BACKLOG.md` must remain empty because no project work has yet been authorized or started.

After initialization:

- Authorized work may be recorded as Waves, Slices, or Tasks.
    
- The backlog must not contain speculative enhancements.
    
- The AI must not populate the backlog merely because it can imagine useful features.
    
- Proposed future work must remain clearly separate from authorized work.
    
- Completed work must not remain represented as pending work.
    
- Backlog items must maintain goal and requirement traceability.
    

`BUILD_PATTERN.md` defines how work is performed.

`BACKLOG.md` identifies authorized work that remains.

---

# 10. Design-First Requirement

Every material capability must be designed before it is built.

Design depth must be proportional to:

- Complexity
    
- Risk
    
- Data sensitivity
    
- Security impact
    
- Compliance impact
    
- Number of users
    
- Number of integrations
    
- Cost of failure
    
- Difficulty of reversal
    

The design must address the applicable parts of:

- Purpose
    
- Goal alignment
    
- Requirements
    
- Definition of done
    
- User interactions
    
- Components
    
- Data
    
- Data schema
    
- Interfaces
    
- APIs
    
- Security
    
- Authorization
    
- Failure behavior
    
- Recovery
    
- Testing
    
- Acceptance
    
- Evidence
    
- Architecture impact
    

A small, low-risk change may use a design section inside the Slice definition.

A substantial capability should use a dedicated design document under an approved design location.

Design-first applies to:

- User interfaces
    
- APIs
    
- Automation
    
- Data models
    
- Migrations
    
- Infrastructure
    
- Integrations
    
- Agents
    
- Security controls
    
- Compliance workflows
    

The purpose of design-first is to define done before implementation begins.

---

# 11. Reconcile-Scope Requirement

Every Wave must begin with a fresh reconciliation.

Every Slice must perform a proportional reconciliation before implementation.

The reconciliation must inspect, as applicable:

- `PROJECT.md`
    
- `AUTHORITATIVE_ARCHITECTURE.md`
    
- `DECISIONS.md`
    
- ADRs
    
- `BUILD_PATTERN.md`
    
- Current backlog authorization
    
- Current `STATUS.md`
    
- Existing source code
    
- Existing database schemas
    
- Existing migrations
    
- Current API contracts
    
- Existing configuration
    
- Current tests
    
- Git branch
    
- Git status
    
- Previous Wave or Slice results
    
- Authorized live resources
    
- Recorded current state
    
- Known drift
    
- Open audit findings
    

The build plan must be based on what actually exists.

It must not be based solely on:

- Previous-session memory
    
- Chat summaries
    
- Assumed file structures
    
- Outdated designs
    
- Unverified completion claims
    

When the actual repository differs from the initial request, the orchestrator should correct the plan autonomously unless the difference affects:

- User intent
    
- Scope
    
- Data integrity
    
- Security
    
- Compliance
    
- Architecture
    
- Cost
    
- Irreversible actions
    
- External authorization
    

---

# 12. Wave Planning

Before starting a Wave, the orchestrator must define:

- Wave purpose
    
- Goal supported
    
- Requirements addressed
    
- Authorized outcome
    
- In scope
    
- Out of scope
    
- Slices
    
- Slice order
    
- Dependencies
    
- Expected integration points
    
- Safety gates
    
- Validation approach
    
- Audit approach
    
- Evidence expectations
    
- Documentation impact
    
- Architecture impact
    
- Git approach
    
- Expected Wave completion condition
    

The orchestrator should compress overly fragmented work into substantial coherent Slices.

Avoid turning one cohesive capability into dozens of tiny Slices merely to create process artifacts.

A good Wave should produce meaningful, integrated progress.

---

# 13. Slice Planning

Every Slice must define:

- Slice identifier
    
- Slice title
    
- Purpose
    
- Parent Wave
    
- Requirements supported
    
- Design reference
    
- Existing state
    
- Intended result
    
- In scope
    
- Out of scope
    
- Tasks
    
- Dependencies
    
- File ownership
    
- Resource ownership
    
- Validation plan
    
- Audit criteria
    
- Evidence
    
- Definition of done
    
- Recovery behavior
    

A Slice is complete only when:

- Its Tasks are complete.
    
- Integration works.
    
- Tests pass.
    
- Evidence exists.
    
- Documentation is synchronized.
    
- Requirements remain traceable.
    
- Architecture remains accurate.
    
- The Slice audit passes.
    
- Material unresolved issues are documented.
    

---

# 14. Task Packages

Each Task package must provide the executor with:

- Task identifier
    
- Clear outcome
    
- Parent Slice
    
- Requirements supported
    
- Exact deliverables
    
- Allowed files and resources
    
- Prohibited files and resources
    
- Dependencies
    
- Applicable standards
    
- Required tests
    
- Required evidence
    
- Failure behavior
    
- Completion return contract
    

A recommended return contract is:

```json
{
  "task": "TASK-NNN",
  "status": "complete | blocked | failed",
  "filesCreated": [],
  "filesModified": [],
  "resourcesChanged": [],
  "testsRun": [],
  "evidenceCreated": [],
  "issues": [],
  "assumptions": [],
  "notes": ""
}
```

Tasks with overlapping write scopes must not execute concurrently unless the orchestrator defines a safe coordination mechanism.

---

# 15. Default Single-Lane Build Model

The default implementation model is a single-lane Build Wave.

Use:

- One primary working tree
    
- One active implementation branch
    
- One Build Executor writing to that branch at a time
    
- Multiple bounded Tasks and Slices
    
- Validation throughout
    
- Coherent local commits
    
- One Primary Orchestrator controlling integration
    

This is the preferred model because it:

- Reduces merge risk
    
- Preserves repository context
    
- Simplifies data and schema coordination
    
- Reduces branch confusion
    
- Reduces human tracking burden
    
- Produces consistent integrated results
    

Parallelism may still be used for:

- Read-only analysis
    
- Independent review
    
- Research
    
- Test design
    
- Documentation review
    
- Audit
    
- Other work that does not create write conflicts
    

---

# 16. Git and Commit Pattern

Within the default single-lane workflow:

1. Inspect branch and working-tree state.
    
2. Preserve existing user work.
    
3. Do not reset or clean unrelated work.
    
4. Complete a coherent Task package or Slice increment.
    
5. Run applicable validation.
    
6. Review the diff.
    
7. Update associated documentation.
    
8. Create a coherent local commit.
    
9. Continue to the next package.
    

Commits should:

- Represent coherent validated changes
    
- Use meaningful messages
    
- Avoid combining unrelated work
    
- Include required documentation changes
    
- Preserve traceability
    

The AI may create local commits autonomously when repository rules allow it.

The AI must not automatically:

- Push
    
- Merge
    
- Release
    
- Deploy
    
- Rewrite history
    
- Force push
    
- Delete remote branches
    

unless authorized by the applicable repository rules or user direction.

---

# 17. Parallel Worktree Exception

Parallel implementation is an exception, not the default.

It may be used only when:

- The user or orchestrator has authorized parallel execution.
    
- Work is genuinely independent.
    
- Each lane has a separate Git worktree.
    
- Each lane has a separate branch.
    
- File ownership is disjoint.
    
- Resource ownership is disjoint.
    
- Database and schema dependencies are coordinated.
    
- Migration order is defined.
    
- Merge order is defined before implementation.
    
- One orchestrator owns the integration plan.
    
- Each lane returns a machine-checkable completion report.
    
- Integration risk is acceptable.
    

Never run two build executors against the same mutable working directory.

Never switch a shared working tree underneath another active executor.

If parallel lanes begin to overlap:

1. Stop the affected lanes.
    
2. Preserve both results.
    
3. Reconcile ownership.
    
4. Redesign the integration plan.
    
5. Resume only after collision risk is removed.
    

---

# 18. Autonomous Failure Resolution

The orchestrator must attempt to resolve ordinary failures autonomously.

When a Task or Slice fails:

1. Contain the failure.
    
2. Preserve logs and evidence.
    
3. Identify the root cause.
    
4. Determine affected files and resources.
    
5. Block dependent work.
    
6. Continue unrelated work when safe.
    
7. Attempt bounded repair.
    
8. Re-run validation.
    
9. Replace the executor when appropriate.
    
10. Restore the last validated state when necessary and safe.
    
11. Avoid discarding unrelated work.
    
12. Escalate only when a true decision or safety gate is reached.
    

A failed Task must not automatically cancel the entire Wave.

The system must not retry indefinitely.

Retry behavior must define:

- Maximum attempts
    
- Backoff
    
- Timeout
    
- Duplicate-action protection
    
- Idempotency
    
- Escalation
    
- Orphaned-task cleanup
    
- Kill switch
    

---

# 19. Hard Safety Gates

The affected work must stop before implementation or application when any of the following is discovered:

- An authoritative data model may be duplicated or forked.
    
- An existing authoritative table, schema, pipeline, or configuration source may be replaced unnecessarily.
    
- Currency semantics may change.
    
- Percentage semantics may change.
    
- Decimal precision may change.
    
- Units of measure may change.
    
- Date or timezone semantics may change.
    
- Existing records may be reinterpreted.
    
- A migration may corrupt or silently transform data.
    
- A destructive database or storage action is required.
    
- Authentication boundaries may change.
    
- Authorization boundaries may change.
    
- Broad Graph permissions are required.
    
- Tenant-wide consent is required.
    
- Privileged roles may change.
    
- Conditional Access may change.
    
- A security or compliance control may be degraded.
    
- Public exposure may be introduced.
    
- A new paid commitment is required.
    
- A third-party dependency is required.
    
- Scraping is required.
    
- Unexplained live-state drift exists.
    
- Evidence contradicts a completion claim.
    
- Approved requirements conflict with actual repository state.
    
- An irreversible or difficult-to-reverse action is required.
    
- A Swif7Edge standard must be bypassed.
    

The AI may:

- Investigate
    
- Explain the issue
    
- Develop alternatives
    
- Recommend a resolution
    
- Prepare a safe plan
    
- Continue unrelated work
    

The AI may not approve its own exception.

The required decision must be routed through `DECISIONS.xlsx`.

---

# 20. Data-Integrity Gate

Data-integrity review is mandatory for changes involving:

- Pricing
    
- Rates
    
- Percentages
    
- Financial calculations
    
- Compliance scores
    
- Dates
    
- Timezones
    
- Identifiers
    
- Enumerations
    
- Units
    
- Schema migrations
    
- Import or export transformations
    
- Existing production records
    

The review must compare:

- Existing source of truth
    
- Existing schema
    
- Existing units
    
- Existing precision
    
- Existing migration history
    
- Proposed schema
    
- Proposed units
    
- Proposed conversion logic
    
- Backward compatibility
    
- Validation evidence
    

A change from values such as:

```text
0.30
```

to:

```text
30.0
```

must never be assumed equivalent without documented semantic confirmation.

The system must prefer referencing an existing authoritative structure over forking or duplicating it.

---

# 21. Validation Harness

Every material capability must have an instrumented validation approach.

The harness must be capable of proving the applicable parts of:

- The plan matches approved requirements.
    
- Implementation matches the plan.
    
- Schemas are valid.
    
- Tests pass.
    
- Failure paths are controlled.
    
- Security rules are enforced.
    
- Required evidence is generated.
    
- Documentation reflects implementation.
    
- A second state-convergence run is a no-op.
    
- Live verification matches recorded state.
    
- Unsupported claims are rejected.
    

For mutation workflows, prove:

1. Read-only planning is correct.
    
2. Apply matches the plan.
    
3. The second run is a no-op.
    
4. Failure paths do not leave unknown state.
    
5. Recovery works.
    
6. Recorded state matches verified actual state.
    

---

# 22. Continuous Assurance

Continuous Assurance is integrated into every Wave, Slice, and applicable Task.

It is not deferred until final completion.

Assurance must evaluate:

- Goal alignment
    
- Requirement conformance
    
- Architecture conformance
    
- Scope conformance
    
- Standards conformance
    
- Security
    
- Compliance
    
- Data integrity
    
- Schema conformance
    
- Documentation synchronization
    
- Evidence sufficiency
    
- Live-state drift
    
- Agent hallucination
    
- Unsupported completion claims
    
- Failure containment
    
- Recovery readiness
    
- Cost authorization
    

Continuous Assurance occurs:

- Before implementation
    
- During implementation
    
- After each meaningful Task package
    
- At Slice completion
    
- At Wave completion
    
- When a decision changes requirements or architecture
    
- When drift is detected
    
- When material risk is discovered
    
- Before completion is claimed
    

---

# 23. Slice Audit

Every Slice must receive an audit.

The Slice audit must determine:

- Did the Slice advance the approved goal?
    
- Did it satisfy the mapped requirements?
    
- Did implementation match the approved design?
    
- Did implementation remain within architecture?
    
- Were unauthorized features introduced?
    
- Were unsupported assumptions introduced?
    
- Were data semantics preserved?
    
- Were security and compliance controls preserved?
    
- Were applicable tests run?
    
- Were failure paths tested?
    
- Is evidence sufficient?
    
- Were documentation and diagrams updated?
    
- Were decisions recorded?
    
- Did the Slice introduce drift?
    
- Are completion claims accurate?
    

The Slice cannot be marked complete when a material audit finding remains unresolved.

Slice audit findings feed the consolidated Wave audit.

---

# 24. Wave Audit

At Wave completion, the Audit Agent must perform a full review of:

- All Slices
    
- Slice audit findings
    
- Cross-Slice integration
    
- Goal advancement
    
- Requirement coverage
    
- Architecture consistency
    
- Data consistency
    
- Security posture
    
- Compliance posture
    
- Testing
    
- Evidence
    
- Documentation
    
- Git history
    
- Decisions
    
- Known gaps
    
- Drift
    
- Hallucination risks
    
- Cost impact
    
- Operational readiness
    

The Wave audit must identify:

- Verified results
    
- Unsupported claims
    
- Unresolved risks
    
- Accepted exceptions
    
- Deferred matters
    
- Improvement opportunities
    
- Architecture or process debt
    
- Recommendations for the next Wave
    

---

# 25. Standards Review

Every Wave must perform an applicable standards review.

The baseline includes:

- NIST SP 800-53 Revision 5
    
- CMMC Level 1
    
- CMMC Level 2 when applicable
    
- SOC 2
    
- ISO/IEC/IEEE 42010:2022
    
- CMMI Development Level 5 principles
    
- Swif7Edge engineering standards
    
- Swif7Edge Azure standards
    
- Swif7Edge Microsoft 365 standards
    
- Swif7Edge data standards
    
- Swif7Edge Continuous Assurance standards
    

The review must be proportional to the work performed.

The repository must not claim certification solely because these practices were followed.

---

# 26. Documentation Cascade

Documentation must change with implementation.

When a change affects an authoritative concept, update the applicable files in the same work package or commit.

Potentially affected artifacts include:

- `PROJECT.md`
    
- `AUTHORITATIVE_ARCHITECTURE.md`
    
- `DECISIONS.md`
    
- ADRs
    
- `BUILD_PATTERN.md`
    
- `BACKLOG.md`
    
- `STATUS.md`
    
- API contracts
    
- Data schemas
    
- Runbooks
    
- Security rules
    
- Architecture diagrams
    
- `docs/architecture/architecture.html`
    
- `report.html`
    

A change is not complete when the code is updated but the authoritative documentation remains stale.

---

# 27. Consolidated Human Report

The repository must maintain:

```text
report.html
```

`report.html` is the consolidated human-facing project report.

It allows the user to open one file and understand:

- What the repository is
    
- Why it exists
    
- The project goal
    
- The desired outcome
    
- Current project status
    
- Approved architecture
    
- Work completed
    
- Work currently underway
    
- Authorized future work
    
- Requirements
    
- Decisions
    
- Waves
    
- Slices
    
- Tests
    
- Evidence
    
- Risks
    
- Problems
    
- Drift
    
- Audit results
    
- Standards alignment
    
- Improvements
    
- Recommended next work
    

The underlying authoritative Markdown, schema, code, decision, and evidence files remain the controlling machine-readable sources.

When `report.html` conflicts with an authoritative source, the authoritative source prevails and the report must be regenerated.

---

# 28. Required `report.html` Characteristics

The report must be:

- Self-contained
    
- Usable offline
    
- Free from required CDN dependencies
    
- Free from required external script dependencies
    
- Readable in a standard browser
    
- Searchable
    
- Navigable
    
- Print-friendly
    
- Understandable by non-engineers
    
- Detailed enough for engineers and auditors
    
- Generated from repository evidence
    
- Updated after every completed Slice
    
- Fully reconciled after every Wave
    

The report must clearly distinguish:

- Approved facts
    
- Implemented state
    
- Verified results
    
- Work in progress
    
- Authorized future work
    
- Recommendations
    
- Assumptions
    
- Known gaps
    
- Deferred decisions
    
- Unverified claims
    

It must not present proposed or planned work as completed.

---

# 29. Required `report.html` Sections

Include applicable sections for:

## Executive Overview

- Project name
    
- Organization
    
- Purpose
    
- Goal
    
- Desired outcome
    
- Current lifecycle stage
    
- Overall status
    

## Goal and Requirement Alignment

- Goal hierarchy
    
- Requirement coverage
    
- Wave-to-requirement mapping
    
- Slice-to-requirement mapping
    
- Uncovered requirements
    
- Drift indicators
    

## Architecture

- Executive architecture summary
    
- OV-1-equivalent view
    
- System context
    
- Components
    
- Agent and sub-agent relationships
    
- Data flows
    
- Authentication flow
    
- Trust boundaries
    
- Deployment topology
    
- Audit and assurance flow
    

## Work Structure

- Waves
    
- Slices
    
- Tasks
    
- Current Wave
    
- Current Slice
    
- Completed work
    
- Authorized upcoming work
    
- Dependencies
    

## Progress

- Progress by requirement
    
- Progress by Wave
    
- Progress by Slice
    
- Validation status
    
- Audit status
    
- Documentation status
    

## Changes

- Files created
    
- Files modified
    
- Resources changed
    
- Commits
    
- Migrations
    
- Configuration changes
    
- Architecture changes
    

## Testing and Evidence

- Tests performed
    
- Results
    
- Live verification
    
- Evidence locations
    
- Failed validations
    
- Recovery verification
    

## Risks and Problems

- Active risks
    
- Resolved risks
    
- Blockers
    
- Data-integrity concerns
    
- Security concerns
    
- Compliance concerns
    
- Known drift
    
- Known documentation debt
    

## Decisions

- Material decisions
    
- ADRs
    
- Pending decisions
    
- Deferred decisions
    
- Exceptions
    
- Paid commitments
    

## Continuous Assurance

- Slice audit results
    
- Wave audit result
    
- Drift findings
    
- Hallucination findings
    
- Standards review
    
- Unsupported claims rejected
    
- Control degradation
    
- Compensating controls
    

## Improvements

- What worked well
    
- What caused friction
    
- Root causes
    
- What should change in later Waves
    
- Reusable lessons
    
- Process improvements
    
- Architecture improvements
    
- Testing improvements
    
- Audit improvements
    

## Next Work

- Recommended next Wave
    
- Goal advanced
    
- Requirements addressed
    
- Expected Slices
    
- Risks
    
- Dependencies
    
- Decisions needed
    
- Authorization status
    

---

# 30. Report Visualizations

Use clear visualizations for complex relationships.

Applicable visuals include:

- Goal-to-requirement graph
    
- Requirement-to-Wave traceability
    
- Wave-Slice-Task hierarchy
    
- Architecture diagram
    
- OV-1-equivalent operational diagram
    
- Component relationship graph
    
- Agent relationship graph
    
- Data-flow diagram
    
- Authentication flow
    
- Trust-boundary diagram
    
- Deployment topology
    
- Progress graph
    
- Audit findings graph
    
- Drift indicators
    
- Risk matrix
    
- Decision timeline
    
- Test and evidence coverage
    
- Standards traceability
    

Visuals should use:

- Embedded SVG
    
- Expandable sections
    
- Filters
    
- Tooltips
    
- Search
    
- Relationship highlighting
    
- Clear legends
    
- Accessible labels
    

Do not add complex visualizations merely for appearance.

Every graph must help the user understand the project.

---

# 31. Progress Reporting During Work

The Build Executor and orchestrator should avoid interrupting the user during routine execution.

User-facing updates are required when:

- A true decision gate is reached.
    
- Material risk is discovered.
    
- Material drift is discovered.
    
- A recovery attempt fails.
    
- Evidence contradicts the plan.
    
- The authorized Wave must materially change.
    
- A security or compliance issue blocks work.
    
- The Wave is complete.
    

Routine progress must be recorded in repository artifacts, including:

- `STATUS.md`
    
- Applicable Slice state
    
- Test results
    
- Evidence
    
- `report.html`
    

At Wave completion, provide one consolidated report.

---

# 32. Wave Completion

A Wave is complete only when:

1. Every included Slice is complete or explicitly resolved.
    
2. Applicable tests pass.
    
3. Cross-Slice integration is validated.
    
4. Independent review is complete.
    
5. Slice audits are complete.
    
6. The Wave audit is complete.
    
7. Requirements remain traceable.
    
8. Architecture is synchronized.
    
9. Documentation is synchronized.
    
10. Evidence is recorded.
    
11. `STATUS.md` is updated.
    
12. `BACKLOG.md` is reconciled.
    
13. `report.html` is regenerated and validated.
    
14. Known gaps are stated honestly.
    
15. Verified results are separated from assumptions.
    
16. A critique and improvement assessment is completed.
    
17. The recommended next Wave is related to the project goal.
    

A Wave must not be marked complete because most implementation appears finished.

---

# 33. Wave Critique and Improvement Loop

Every completed Wave must include a critical assessment.

The assessment must answer:

- Did the Wave advance the project goal effectively?
    
- Was the Wave too large or too small?
    
- Were the Slices coherent?
    
- Were Tasks appropriately bounded?
    
- Did the orchestrator make good routing decisions?
    
- Were agents given sufficient context?
    
- Was repository scope reconciled correctly?
    
- Did design-first prevent rework?
    
- Did testing catch meaningful defects?
    
- Did audit detect unsupported claims?
    
- Did any work drift from requirements?
    
- Did documentation remain synchronized?
    
- Were any safety gates triggered?
    
- Could failures have been contained better?
    
- Were commits appropriately structured?
    
- Did any process step create unnecessary delay?
    
- What should be improved in the next Wave?
    
- Should any lesson become a permanent rule or repeatable skill?
    

Improvements must be documented in `report.html`.

Material permanent improvements must update the applicable authoritative process files.

---

# 34. Next-Wave Feedback Loop

At Wave completion, the orchestrator must recommend the next logical Wave.

The recommendation must identify:

- Project goal advanced
    
- Requirements addressed
    
- Why this Wave should occur next
    
- Proposed Slices
    
- Dependencies
    
- Risks
    
- Decisions required
    
- Expected validation
    
- Expected evidence
    
- Expected architecture impact
    

The next Wave may begin when the orchestrator reasonably determines that the Human Project Authority has explicitly or implicitly authorized continued work.

The orchestrator must not infer authorization for a hard gate, exception, paid commitment, scope expansion, or control degradation.

When authorization is not sufficiently clear, the next Wave remains recommended but not started.

---

# 35. No Uncontrolled Auto-Advance

The system must not automatically move into unrelated or speculative work merely because the current Wave completed successfully.

Continued work must remain within:

- The approved project goal
    
- The approved scope
    
- Existing user authorization
    
- Approved requirements
    
- Approved architecture
    
- Safe delegated authority
    

The system may continue autonomously across Slices inside an authorized Wave.

It may continue across Waves only when current human direction reasonably authorizes continued progression.

---

# 36. Completion Claims

A completion claim must identify:

- What was authorized
    
- What was completed
    
- What was tested
    
- What was independently reviewed
    
- What was audited
    
- What was verified against a live authorized resource
    
- What remains unverified
    
- What assumptions remain
    
- What risks remain
    
- What decisions remain
    
- What evidence supports the claim
    

Prohibited completion language includes unsupported statements such as:

- Fully complete
    
- Production ready
    
- Secure
    
- Compliant
    
- Connected
    
- Verified
    
- Deployed
    
- Working as intended
    

unless the claim is supported by applicable evidence.

A confident AI statement is not evidence.

---

# 37. Standard Completion Report

At the end of every Wave, report:

```text
WAVE:
AUTHORIZED OUTCOME:
PROJECT GOAL ADVANCED:
REQUIREMENTS ADDRESSED:
SLICES COMPLETED:
TASKS COMPLETED:
FILES CREATED:
FILES MODIFIED:
RESOURCES CHANGED:
LOCAL COMMITS:
TESTS PERFORMED:
LIVE VERIFICATION:
EVIDENCE:
ARCHITECTURE UPDATES:
DOCUMENTATION UPDATES:
DECISIONS AND ADRS:
SLICE AUDIT RESULTS:
WAVE AUDIT RESULT:
DRIFT FOUND:
DRIFT RESOLVED:
HALLUCINATION OR UNSUPPORTED CLAIMS FOUND:
KNOWN GAPS:
ACTIVE RISKS:
ASSUMPTIONS:
IMPROVEMENTS IDENTIFIED:
RECOMMENDED NEXT WAVE:
NEXT-WAVE AUTHORIZATION STATUS:
```

Do not blend verified facts with assumptions.

---

# 38. Prohibited Workflow Patterns

The following patterns are prohibited:

- Building from memory without inspecting the repository
    
- Starting implementation before defining done
    
- Creating dozens of tiny Slices for one coherent capability
    
- Multiple executors sharing one mutable working directory
    
- Uncontrolled sub-agent spawning
    
- Overlapping file ownership without coordination
    
- Silent schema duplication
    
- Silent data-semantic changes
    
- Unverified migrations
    
- Direct mutation without planning
    
- Unlimited retries
    
- Ignoring failed tests
    
- Treating mocks as live verification
    
- Marking work complete without evidence
    
- Updating code without documentation
    
- Hiding known gaps
    
- Inventing backlog items
    
- Auto-approving standards exceptions
    
- Allowing the implementer to be its only auditor
    
- Reporting planned work as implemented
    
- Allowing `report.html` to become stale
    
- Continuing after material unexplained drift
    

---

# 39. Initialization State

When a new repository is initialized:

- `BUILD_PATTERN.md` must exist.
    
- `report.html` must exist as an initialized project report.
    
- `BACKLOG.md` must exist but contain no work items.
    
- No Waves, Slices, or Tasks should be invented.
    
- The project goal, requirements, architecture, and standards should be represented as far as approved information allows.
    
- `report.html` should clearly state that project work has not yet begun.
    
- The repository should be ready for the user and orchestrator to authorize the first Wave.
    

---

# 40. Document Authority

This file is the authoritative repository standard for how project work is executed.

Material changes to this pattern must:

1. Be justified.
    
2. Be compared against project and organizational standards.
    
3. Be reviewed for security, compliance, audit, and operational impact.
    
4. Be recorded in a durable decision.
    
5. Receive user authorization when they alter a control, gate, authority boundary, or exception rule.
    
6. Update related orchestration rules.
    
7. Update `report.html`.
    

Routine wording or clarification changes that preserve the established workflow may be performed autonomously.