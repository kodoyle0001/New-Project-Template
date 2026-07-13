
# Project Identity

## 1. Purpose

This module establishes the stable identity of the project.

It must determine and normalize:

- Organization
    
- Official project name
    
- Repository name
    
- Project owner
    
- Project purpose
    
- Primary desired outcome
    
- Intended users or stakeholders
    
- General project type
    
- Lifecycle stage
    

This identity becomes the common reference used by later initialization modules.

This module must remain narrow.

It must not:

- Design the system architecture
    
- Define detailed project scope
    
- Create application components
    
- Create repository directories
    
- Select technologies
    
- Define deployment infrastructure
    
- Build the project
    
- Duplicate the responsibilities of later modules
    

---

# 2. Organization

Every repository initialized through this template is a Swif7Edge project.

Use:

```text
Organization: Swif7Edge
```

Swif7Edge is organization metadata.

Do not automatically add `Swif7Edge` to:

- The project name
    
- The repository name
    
- Application names
    
- Package names
    
- Service names
    
- User-facing product names
    

Include the organization name in those identifiers only when the project information or user direction specifically requires it.

---

# 3. Authoritative Inputs

Inspect the following sources before determining that information is missing:

1. `create.md`
    
2. `DECISIONS.xlsx`
    
3. `DECISIONS.md`
    
4. Existing repository files
    
5. Existing README or project descriptions
    
6. Repository directory name
    
7. Configured Git remote, when present
    
8. `INITIALIZATION_STATUS.md`
    

Prefer explicit user-provided information over inferred information.

Do not ask for information that already exists in the repository.

---

# 4. Project Name

Establish one official project name.

The project name should:

- Clearly identify the project
    
- Be concise
    
- Be understandable to a human
    
- Avoid unnecessary technical jargon
    
- Avoid temporary labels such as `New Project`
    
- Avoid adding Swif7Edge automatically
    
- Remain stable unless the project purpose materially changes
    

The project name may contain normal capitalization and spaces.

Examples:

```text
Employee Workflow Dashboard
Proposal Intelligence Engine
M365 Compliance Automation
Corporate Website
Email Intake Automation
```

Do not invent branding.

When only a repository name is available, convert it into a reasonable human-readable working project name unless doing so would materially misrepresent the project.

---

# 5. Repository Naming Standard

Repository names must use lowercase kebab case.

Required pattern:

```text
lowercase-words-separated-by-hyphens
```

Examples:

```text
employee-workflow-dashboard
proposal-intelligence-engine
m365-compliance-automation
corporate-website
email-intake-automation
```

Repository names must:

- Use lowercase letters
    
- Use numbers only when meaningful
    
- Separate words with single hyphens
    
- Avoid spaces
    
- Avoid underscores
    
- Avoid consecutive hyphens
    
- Avoid leading or trailing hyphens
    
- Avoid punctuation other than hyphens
    
- Avoid unnecessary organization prefixes
    
- Describe the repository’s primary purpose
    

Preserve recognized technical abbreviations when useful:

```text
m365
api
ai
cicd
cmmc
rmf
```

Do not rename the local directory, Git repository, remote repository, or configured remote automatically.

When the current repository name does not follow the standard:

1. Determine the recommended standardized name.
    
2. Record the mismatch.
    
3. Continue local initialization when the mismatch does not create a functional problem.
    
4. Add a question to `DECISIONS.xlsx` only when renaming requires user action or affects external systems.
    
5. Do not block unrelated initialization work.
    

---

# 6. Project Owner

The project owner may be:

- A named person
    
- A role
    
- A team
    

Examples:

```text
Kelly Doyle
Chief Digital Information Officer
Swif7Edge Engineering
Business Development Team
```

Do not require a named individual when a role or team provides sufficient ownership.

When the owner is not known:

- Record it as `Not yet assigned`.
    
- Continue initialization when ownership is not a blocker.
    
- Add a question to `DECISIONS.xlsx` only when an owner is required for approval, access, accountability, deployment, or another material project responsibility.
    

Do not invent an owner.

---

# 7. Project Purpose

Create a concise purpose statement explaining what the project exists to do.

The purpose should answer:

> Why does this repository and project exist?

The purpose statement should:

- Be one or two sentences
    
- Describe the problem or need
    
- Avoid implementation detail unless essential
    
- Avoid promising capabilities that have not been approved
    
- Be understandable without reviewing chat history
    
- Reflect current user intent
    

Example:

```text
This project exists to create a centralized workflow dashboard that consolidates actionable information from Microsoft 365 and Azure services for Swif7Edge users.
```

Do not confuse purpose with architecture.

---

# 8. Primary Desired Outcome

Define the primary result the project is expected to produce.

The desired outcome should describe:

- What will exist when the project succeeds
    
- What meaningful capability the user receives
    
- What operational or business result is expected
    

It should not be a list of technical tasks.

Example:

```text
Deliver a secure web application that gives authorized users one place to view and act on current workflow information.
```

When several outcomes exist, identify one primary outcome and allow later modules to document secondary outcomes.

---

# 9. Intended Users and Stakeholders

Identify the people, roles, teams, systems, or customers expected to:

- Use the project
    
- Operate the project
    
- Maintain the project
    
- Depend on its output
    
- Approve material decisions
    

Keep this section concise.

Do not invent users or customer groups.

When the exact users are not known, use the narrowest supported description.

Examples:

```text
Swif7Edge executives
Swif7Edge engineering team
Authorized Microsoft 365 users
Proposal-development staff
Internal administrators
Customer-designated users
```

Unknown user details may be refined by later modules.

---

# 10. General Project Type

Describe the project type using plain language based on what the project will do.

Do not force the project into a rigid classification list.

Examples include:

```text
Web application
Microsoft 365 automation
Azure-hosted internal tool
Email integration
Data analytics platform
Infrastructure automation
Documentation repository
Research and analysis project
Hybrid application and automation project
```

The project type may contain more than one relevant description.

The purpose of project type is to help the Primary Orchestrator select appropriate approved project-type and capability modules.

It is not a permanent taxonomy.

---

# 11. Lifecycle Stage

For a newly initialized repository, use:

```text
Lifecycle stage: Initialization
```

Change the lifecycle stage only when repository evidence clearly shows that the project is already in another stage.

Possible later stages may include:

```text
Planning
Design
Development
Testing
Deployment
Operations
Maintenance
Archived
```

This module does not establish a complex lifecycle model.

---

# 12. Autonomous Identity Decisions

The AI is authorized to normalize identity information without asking the user when the change:

- Preserves the user’s meaning
    
- Applies the repository naming standard
    
- Corrects capitalization or spacing
    
- Converts a project name into a valid repository slug
    
- Uses `Swif7Edge` as organization metadata
    
- Sets the lifecycle stage to `Initialization`
    
- Records an unknown owner as `Not yet assigned`
    
- Uses a supported description already found in the repository
    

The AI must not ask the user to approve routine normalization.

---

# 13. When a User Question Is Required

Add a question to `DECISIONS.xlsx` only when:

- No meaningful project purpose can be established
    
- Two conflicting project names exist
    
- The intended repository name materially conflicts with an external repository
    
- The project outcome is unclear enough to affect later architecture
    
- The project may serve materially different user groups with different requirements
    
- Project ownership is required before a later authorized action
    
- Available descriptions indicate substantially different project types
    
- Choosing incorrectly would materially affect scope, architecture, security, cost, or deployment
    

Ask the fewest questions necessary.

When one broad question can resolve several identity fields, use one broad question rather than several narrow questions.

Do not ask identity questions in chat.

---

# 14. Normalized Identity Output

Produce a normalized identity record with this structure:

```markdown
## Project Identity

- **Organization:** Swif7Edge
- **Project name:**
- **Repository name:**
- **Project owner:**
- **Project purpose:**
- **Primary desired outcome:**
- **Intended users or stakeholders:**
- **General project type:**
- **Lifecycle stage:** Initialization
```

The normalized identity must be provided to:

- `13-scope-and-success-criteria.md`
    
- `14-authoritative-architecture.md`
    
- `19-work-memory.md`
    
- Any selected project-type modules
    

Store the normalized identity in the project initialization state or another temporary working location approved by the Primary Orchestrator.

Do not create another permanent identity document unless the authoritative repository design requires one.

The final permanent project identity belongs primarily in `PROJECT.md`.

---

# 15. Consistency Requirements

Ensure that:

- The project name is used consistently.
    
- The repository name follows lowercase kebab case.
    
- The organization is Swif7Edge.
    
- Swif7Edge is not unnecessarily included in the project name.
    
- The owner is not invented.
    
- The project purpose and outcome do not contradict each other.
    
- The project type reflects the actual work.
    
- The lifecycle stage reflects the current repository state.
    
- No architecture or technical stack is invented.
    
- Unknown information remains clearly unknown.
    

When an existing repository file uses an inconsistent name:

1. Identify the inconsistency.
    
2. Determine the intended official value from authoritative inputs.
    
3. Submit correction proposals to the owning modules.
    
4. Do not modify files outside this module’s write authority.
    

---

# 16. Validation

Before completing this module, verify:

- Organization is recorded as Swif7Edge.
    
- An official project name is established or a necessary question is queued.
    
- The repository name is normalized or a material mismatch is documented.
    
- The project owner is recorded or marked `Not yet assigned`.
    
- The project purpose is concise and supported.
    
- The primary desired outcome is clear.
    
- Intended users or stakeholders are identified as far as current evidence allows.
    
- The project type is descriptive and not forced into an unnecessary taxonomy.
    
- Lifecycle stage is valid.
    
- No project identity value was invented.
    
- No architecture was created.
    
- No detailed project scope was created.
    
- No files outside the approved scope were modified.
    

---

# 17. Completion Criteria

This module is complete when:

- A normalized project identity exists.
    
- Project and repository names are consistent or documented for later correction.
    
- The repository naming standard has been applied.
    
- Unknown nonblocking identity information is recorded without stopping initialization.
    
- Necessary material questions are in `DECISIONS.xlsx`.
    
- The normalized identity is available to dependent modules.
    
- Validation passes.
    

---

# 18. Module Completion Report

Report to the Primary Orchestrator:

```text
MODULE_STATUS:
MODULE_ID: project_identity
ORGANIZATION:
PROJECT_NAME:
REPOSITORY_NAME:
PROJECT_OWNER:
PROJECT_PURPOSE:
PRIMARY_OUTCOME:
GENERAL_PROJECT_TYPE:
LIFECYCLE_STAGE:
QUESTIONS_ADDED:
VALIDATION_PERFORMED:
VALIDATION_RESULT:
BLOCKING_ISSUES:
```

Do not ask the user questions in the completion report.