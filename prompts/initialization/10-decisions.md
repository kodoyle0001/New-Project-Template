# Decision Interface and Durable Decision Management

## 1. Purpose

This module creates and manages the project’s decision interface.

It must create and maintain:

```text
DECISIONS.xlsx
DECISIONS.md
```

`DECISIONS.xlsx` is the communication interface between the autonomous AI system and the user.

`DECISIONS.md` is the permanent Git-readable record of material decisions that future project work must understand.

The AI system must remain autonomous. It should make normal architecture, engineering, implementation, testing, documentation, orchestration, and repository-management decisions without repeatedly asking the user for approval.

The Excel interface must be used only when the AI genuinely needs information or authorization that it cannot safely determine itself.

---

# 2. Core Decision Rule

The AI must make a reasonable decision itself when the decision is:

- Within the approved project scope
    
- Consistent with the authoritative architecture
    
- Consistent with Swif7Edge standards
    
- Consistent with Azure and Microsoft 365 platform requirements
    
- Safe
    
- Reversible
    
- Low or moderate risk
    
- Free from material licensing or monetary commitments
    
- Unlikely to constrain future project choices materially
    
- Testable or otherwise verifiable
    

The AI must not ask the user to decide routine matters such as:

- File naming
    
- Normal directory organization
    
- Markdown formatting
    
- Standard repository hygiene
    
- Test-file placement
    
- Normal Azure-native implementation details
    
- Normal Microsoft 365 integration patterns
    
- Agent assignments
    
- Model routing
    
- Documentation formatting
    
- Reversible implementation choices
    
- Routine refactoring decisions
    
- Standard validation methods
    

A user question is justified only when the answer materially affects one or more of the following:

- User intent
    
- Project purpose
    
- Scope
    
- Success criteria
    
- Architecture
    
- Security
    
- Compliance
    
- Data sensitivity
    
- Microsoft environment selection
    
- Deployment
    
- External integration authority
    
- Identity or access
    
- Material cost
    
- Licensing commitment
    
- Destructive action
    
- Irreversible migration
    
- Legal or contractual obligations
    
- A choice that cannot be reliably inferred from the repository
    

The controlling rule is:

> Ask the fewest questions necessary while preserving the user’s intent, project safety, architectural integrity, and ability to complete the work.

---

# 3. No Direct Questions in Chat

The AI must not ask project-specific questions directly in chat.

All user questions must be added to:

```text
DECISIONS.xlsx
```

When a decision gate is reached, the AI may state:

> A decision gate has been reached. Review the open questions in `DECISIONS.xlsx`, complete the user fields, save and close the workbook, and instruct Claude Code to continue.

The AI must not:

- Repeat the questions in chat
    
- Summarize each question in chat
    
- Ask the user to answer in chat
    
- Infer an answer from silence
    
- Treat blank fields as approval
    
- Treat user notes alone as formal approval
    
- Stop immediately every time a question is identified
    

The AI must continue all safe and independent work until it reaches the next point that genuinely requires the unresolved answer.

---

# 4. Workbook Location and Name

Create the workbook in the repository root:

```text
DECISIONS.xlsx
```

Do not create another active question workbook.

Do not rename the workbook unless the user explicitly authorizes the change.

The workbook must remain in the finished repository even when it contains no active questions.

---

# 5. Required Workbook Sheets

Create exactly these sheets:

```text
Decisions
Deferred
```

## `Decisions`

Contains only questions that currently require a user answer.

## `Deferred`

Contains questions that the user intentionally postponed.

Do not create:

- A completed-decisions sheet
    
- A history sheet
    
- A processing sheet
    
- A dashboard sheet
    
- A separate instructions sheet
    
- A validation-list sheet unless technically required for dropdown validation
    

The workbook must remain a simple human-to-AI decision interface.

---

# 6. Required Columns

Use the same core columns on both sheets.

|Column|Header|Purpose|
|---|---|---|
|A|Question ID|Unique identifier for the question.|
|B|Decision Area|Scope, architecture, security, cost, deployment, integration, or another relevant area.|
|C|Question|The exact decision or information the user must provide.|
|D|Why It Matters|Explains why the answer is needed and why the AI cannot safely decide alone.|
|E|AI Recommendation|States the option the AI recommends.|
|F|Alternatives|Lists other reasonable choices when alternatives exist.|
|G|Expected Impact / Benefit|Explains what the recommended choice enables or changes.|
|H|Risks / Tradeoffs|Explains material risks, disadvantages, limitations, or consequences.|
|I|Cost / Effort|Explains relevant monetary cost, licensing, implementation effort, schedule impact, or ongoing maintenance.|
|J|Answer Needed|States exactly what information or selection the AI needs in order to continue.|
|K|User Action|Standardized user-response selection.|
|L|User Decision|The user’s selected option, answer, or custom direction.|
|M|User Notes|Additional explanation, constraints, qualifications, or instructions.|

The workbook should provide enough information for the user to make a meaningful, fact-based decision and enough structure for the AI to understand and apply the answer.

Do not add metadata columns that are not necessary for the user-AI interaction.

---

# 7. User Action Values

The `User Action` field should provide these dropdown options:

```text
Approve AI Recommendation
Select an Alternative
Provide Custom Direction
Defer
Request More Analysis
Not Applicable
```

## Approve AI Recommendation

The user accepts the recommendation in the row.

## Select an Alternative

The user chooses one of the alternatives and identifies it in `User Decision`.

## Provide Custom Direction

The user provides another direction in `User Decision` and may explain it in `User Notes`.

## Defer

The user postpones the decision.

The row must move to the `Deferred` sheet.

## Request More Analysis

The AI must perform additional analysis and update the same row with better information.

The row remains on the `Decisions` sheet until the user answers it.

## Not Applicable

The AI must confirm that the underlying requirement is no longer applicable, record that fact where appropriate, and remove the question after successful processing.

---

# 8. Question ID Standard

Assign question identifiers using:

```text
Q-0001
Q-0002
Q-0003
```

Rules:

- Question IDs must be unique.
    
- IDs must not be reused during the project.
    
- Deleting a processed row does not release its ID.
    
- Moving a row to `Deferred` must preserve the ID.
    
- Clarifying the same question must preserve the ID.
    
- A separate material decision must receive a new ID.
    

The AI may track the next available ID in a small workbook property, hidden named value, or another reliable internal method that does not complicate the visible workbook.

---

# 9. Question Quality Standard

Every question must be:

- Necessary
    
- Atomic
    
- Specific
    
- Self-contained
    
- Understandable without chat history
    
- Written in plain language
    
- Supported by relevant facts
    
- Accompanied by an AI recommendation
    
- Accompanied by alternatives when meaningful
    
- Accompanied by impacts and risks
    
- Accompanied by cost or effort information when relevant
    
- Clear about the exact answer needed
    

Do not:

- Combine unrelated decisions into one row
    
- Ask vague questions
    
- Ask the user to design a technical solution from scratch
    
- Ask for information already present in the repository
    
- Ask the same question more than once
    
- Ask the user to approve routine AI decisions
    
- Use questions to avoid normal engineering judgment
    
- Add hypothetical questions that do not affect current work
    
- Add a fixed number of questions merely to complete a questionnaire
    

The number of questions must depend on the project and the information already available.

---

# 10. Initial Question Generation

When the workbook is first created:

1. Inspect `create.md`.
    
2. Inspect existing repository files.
    
3. Inspect available project descriptions or notes.
    
4. Identify what is already known.
    
5. Infer only facts that can be supported reliably.
    
6. Apply approved defaults.
    
7. Identify the minimum unresolved information required for the next productive work wave.
    
8. Add only those questions to the `Decisions` sheet.
    

When one broad project-description question is sufficient, create one question.

When the project description already provides sufficient information, create no unnecessary intake question.

Additional project-specific questions may be added later only when the AI reaches a material decision it cannot safely resolve.

---

# 11. Long-Running Autonomous Work

The decision system must support long uninterrupted work waves.

When the AI identifies a noncritical question:

1. Add it to the `Decisions` sheet.
    
2. Continue all work that does not depend on the answer.
    
3. Use a safe reversible default when one exists.
    
4. Defer only the dependent task.
    
5. Group other material questions discovered during the work wave.
    
6. Stop only when the unresolved questions prevent further meaningful safe work.
    

The AI should not create repeated short decision gates.

The AI should gather the questions needed to unlock the next substantial work wave.

---

# 12. Processing User Answers

When the user instructs the AI to continue:

1. Open `DECISIONS.xlsx`.
    
2. Read every row containing a user action or answer.
    
3. Validate all answers as a batch.
    
4. Check answers for conflicts with one another.
    
5. Check answers against:
    
    - `PROJECT.md`
        
    - `AUTHORITATIVE_ARCHITECTURE.md`
        
    - `DECISIONS.md`
        
    - Security requirements
        
    - Compliance requirements
        
    - Existing implementation
        
    - Swif7Edge Azure and Microsoft 365 standards
        
6. Determine the appropriate repository destination for each answer.
    
7. Update the appropriate repository files.
    
8. Record material durable decisions in `DECISIONS.md`.
    
9. Validate the resulting repository changes.
    
10. Permanently delete successfully processed rows from the `Decisions` sheet.
    
11. Move deferred rows to the `Deferred` sheet.
    
12. Leave incomplete, unclear, or conflicting rows on the `Decisions` sheet.
    
13. Update unclear rows to explain what answer is still needed.
    
14. Save the workbook.
    
15. Reopen and validate the workbook.
    
16. Continue autonomous work.
    

Successfully processed questions must not remain in the active workbook.

---

# 13. Answer Validation

An answer is valid when:

- `User Action` is completed
    
- The required user decision is present
    
- The answer is understandable
    
- The answer does not create an unresolved contradiction
    
- The answer provides enough authority for the intended action
    
- The answer does not violate a higher-priority security, legal, contractual, or compliance constraint
    

An answer is not valid when:

- The action field is blank
    
- A custom or alternative selection has no actual decision value
    
- The answer is ambiguous
    
- The answer refers to missing information
    
- The answer conflicts with another answer
    
- The answer would authorize more scope than the question presented
    
- The answer would create an unaddressed critical risk
    

When an answer is invalid:

- Preserve the row
    
- Preserve the user’s answer
    
- Clarify the `Question`, `Why It Matters`, or `Answer Needed` field
    
- Add better options or analysis when useful
    
- Do not ask the user in chat
    

---

# 14. Deferred Questions

When the user selects `Defer`:

1. Move the complete row from `Decisions` to `Deferred`.
    
2. Preserve the Question ID.
    
3. Preserve all question content.
    
4. Preserve the user’s notes.
    
5. Treat the decision as not approved.
    
6. Continue all work that can proceed without it.
    
7. Do not repeatedly ask the deferred question.
    
8. Do not treat deferral as authorization.
    
9. Record any resulting limitation in `STATUS.md` or `BACKLOG.md` when relevant.
    

A deferred question may return to `Decisions` when:

- The user moves it back
    
- The user explicitly asks the AI to revisit it
    
- The deferred issue becomes a genuine blocker for a later work wave
    
- New project information materially changes the recommendation
    
- A security, compliance, cost, or architectural dependency requires resolution
    

When the AI returns a deferred question to `Decisions`, it must update the context to explain why the answer is now required.

Deferred questions are not permanent project history.

Once a deferred question is later answered and processed successfully, permanently delete it from the workbook.

---

# 15. Request More Analysis

When the user selects `Request More Analysis`:

1. Keep the same Question ID.
    
2. Perform additional repository, architecture, technical, security, cost, or integration analysis.
    
3. Update:
    
    - AI Recommendation
        
    - Alternatives
        
    - Expected Impact / Benefit
        
    - Risks / Tradeoffs
        
    - Cost / Effort
        
    - Answer Needed
        
4. Preserve the original user notes.
    
5. Clear the action only after the requested analysis is added.
    
6. Leave the row on the `Decisions` sheet.
    
7. Continue other safe work.
    

Create a new question only when the analysis reveals a genuinely separate decision.

---

# 16. Repository Answer Routing

The AI must place each accepted answer into the appropriate source of truth.

Examples:

|Answer type|Primary destination|
|---|---|
|Project name and purpose|`PROJECT.md`|
|Intended users|`PROJECT.md`|
|Scope and exclusions|`PROJECT.md`|
|Deliverables|`PROJECT.md`|
|Success and acceptance criteria|`PROJECT.md`|
|Architecture selection|`AUTHORITATIVE_ARCHITECTURE.md`|
|Material architecture rationale|`DECISIONS.md`|
|Repository-layout decision|`AUTHORITATIVE_ARCHITECTURE.md`|
|Technology selection|`AUTHORITATIVE_ARCHITECTURE.md` and `DECISIONS.md`|
|Commercial or GCC High selection|`AUTHORITATIVE_ARCHITECTURE.md` and `DECISIONS.md`|
|Integration requirement|Architecture and relevant integration documentation|
|Security requirement|Architecture and `.claude/rules/security.md`|
|Compliance requirement|`PROJECT.md`, architecture, and relevant scoped rules|
|Deployment choice|Architecture and `DECISIONS.md`|
|Cost constraint|`PROJECT.md` or the relevant durable decision|
|Work priority|`BACKLOG.md`|
|Current blocker|`STATUS.md`|
|Permanent AI behavior|`CLAUDE.md` or `.claude/rules/`|
|Multi-agent operating decision|Permanent orchestration rules and, when material, `DECISIONS.md`|

An answer may update multiple repository files when required.

One file must remain the primary authority.

Do not duplicate full content across files when a reference is sufficient.

---

# 17. Durable Decision Record

Create and maintain:

```text
DECISIONS.md
```

Only material decisions belong in this file.

Examples include:

- Architecture choices
    
- Technology choices
    
- Commercial versus GCC High
    
- Security boundaries
    
- Compliance interpretations
    
- Identity and access architecture
    
- Deployment architecture
    
- Major repository-structure choices
    
- Material scope choices
    
- Paid licensing commitments
    
- Important rejected alternatives
    
- Irreversible or difficult-to-reverse decisions
    
- Permanent multi-agent operating rules
    

Routine facts and minor implementation choices do not require durable decision entries.

Each durable decision should include:

```markdown
## DEC-0001 — Decision title

**Status:** Accepted  
**Date:** YYYY-MM-DD  
**Source question:** Q-0001, when applicable  
**Decision owner:** User, AI under delegated authority, or named role  
**Category:**  

### Context

### Decision

### AI recommendation

### Alternatives considered

### Rationale

### Impact

### Risks and tradeoffs

### Mitigation

### Cost and effort

### Implementation effect

### Validation

### Related decisions

### Supersedes

### Superseded by
```

Do not fabricate missing information.

Use `Not applicable`, `Unknown`, or `Not yet implemented` when necessary.

---

# 18. AI-Authorized Decisions

The AI may record a durable decision without asking the user when:

- The choice falls within delegated authority
    
- It follows approved project and platform standards
    
- It is safe and supportable
    
- It introduces no material cost without authorization
    
- It does not expand scope
    
- It is consistent with the authoritative architecture
    
- It is reversible or reasonably maintainable
    
- It is important enough that future work should understand the rationale
    

Mark the decision owner as:

```text
AI under delegated project authority
```

Do not create excessive decision records for routine implementation choices.

---

# 19. Workbook Formatting

Keep the workbook simple and usable.

At minimum:

- Freeze the header row
    
- Enable filters
    
- Use readable column widths
    
- Wrap long text
    
- Align long text to the top
    
- Use a clear header style
    
- Add dropdown validation to `User Action`
    
- Keep user-entry fields editable
    
- Avoid formulas
    
- Avoid macros
    
- Avoid password protection
    
- Avoid decorative dashboards
    
- Avoid unnecessary hidden metadata
    

The workbook must open correctly in Microsoft Excel.

Use a reliable Excel-compatible library, such as `openpyxl`, when programmatic creation or editing is required.

Do not substitute CSV.

---

# 20. Workbook Safety

Only one authorized AI writer may edit `DECISIONS.xlsx` at a time.

Before saving:

1. Confirm the workbook has not changed unexpectedly.
    
2. Preserve all user-entered answers and notes.
    
3. Save safely.
    
4. Reopen the workbook.
    
5. Confirm both sheets still exist.
    
6. Confirm all expected columns still exist.
    
7. Confirm unanswered and deferred rows were preserved.
    
8. Confirm processed rows were deleted.
    
9. Confirm the workbook is not corrupted.
    

If the workbook cannot be safely updated:

- Preserve the original file
    
- Do not silently recreate it
    
- Do not lose user answers
    
- Report the technical failure in chat
    
- Stop only the work requiring unresolved authorization
    

---

# 21. Integration with Permanent Repository Rules

Ensure the permanent repository instructions state:

1. The AI must remain autonomous.
    
2. The AI must make routine safe decisions itself.
    
3. The AI must not ask project-specific questions in chat.
    
4. Questions requiring user input must be added to `DECISIONS.xlsx`.
    
5. The workbook contains only active and deferred questions.
    
6. Successfully processed questions must be deleted.
    
7. Deferred questions must move to the `Deferred` sheet.
    
8. Durable material decisions must be recorded in `DECISIONS.md`.
    
9. Blank fields and silence are not approval.
    
10. The AI must continue independent work around unresolved questions.
    
11. The AI should group questions to unlock long uninterrupted work waves.
    

These rules must be reflected in `CLAUDE.md` or the appropriate `.claude/rules/` files by their owning modules.

---

# 22. Validation Requirements

After creating or modifying the decision system, validate:

- `DECISIONS.xlsx` exists
    
- `DECISIONS.md` exists
    
- The `Decisions` sheet exists
    
- The `Deferred` sheet exists
    
- Both sheets use the required columns
    
- User Action dropdowns work
    
- The workbook opens after saving
    
- The workbook contains no completed questions
    
- Successfully processed questions were deleted
    
- Deferred questions are on the correct sheet
    
- User answers were preserved
    
- Durable decisions were routed into `DECISIONS.md`
    
- No direct user questions were asked in chat
    
- No unnecessary questions were created
    
- The AI continued safe independent work where possible
    

---

# 23. Completion Criteria

This module is complete when:

- `DECISIONS.xlsx` has been created or safely updated
    
- `DECISIONS.md` has been created or safely updated
    
- The workbook contains the required sheets and columns
    
- Existing user answers were preserved
    
- The active sheet contains only current questions
    
- The deferred sheet contains only postponed questions
    
- Material processed answers are represented in the repository
    
- Successfully processed questions were deleted
    
- Durable decisions are recorded appropriately
    
- The workbook reopens successfully
    
- The initialization state has been updated
    

---

# 24. Module Completion Report

Report to the Primary Orchestrator:

```text
MODULE_STATUS:
MODULE_ID: decision_management
FILES_CREATED:
FILES_MODIFIED:
ACTIVE_QUESTIONS:
DEFERRED_QUESTIONS:
ANSWERS_PROCESSED:
ROWS_DELETED:
DURABLE_DECISIONS_RECORDED:
VALIDATION_PERFORMED:
VALIDATION_RESULT:
BLOCKING_ISSUES:
```

Do not list the individual questions in chat.

When unresolved questions prevent further safe progress, report only that a decision gate has been reached.