

#   

## 1. Purpose

  

This module creates the repository’s permanent context-specific AI rules under:

  

```text

.claude/rules/

```

  

The rules translate approved requirements, architecture, technical guardrails, security standards, data standards, testing expectations, documentation requirements, and Continuous Assurance controls into concise instructions that load only when relevant.

  

The module must:

  

- Keep universal instructions small and stable.

- Prevent irrelevant rules from consuming agent context.

- Apply specialized rules only to the files, technologies, services, or work types they govern.

- Prevent duplicated or contradictory instructions.

- Preserve the repository authority hierarchy.

- Enforce drift, hallucination, evidence, and decision controls.

- Make AI behavior predictable across sessions and agents.

  

This module creates instructions. It must not implement project functionality, populate the backlog, deploy resources, make purchases, or modify the live environment.

  

---

  

## 2. Required Outputs

  

Create or safely update:

  

```text

.claude/rules/

.claude/rules/_index.md

```

  

Create only the rule files applicable to the approved project and architecture.

  

Potential rule files include:

  

```text

.claude/rules/security.md

.claude/rules/data.md

.claude/rules/m365.md

.claude/rules/azure.md

.claude/rules/infrastructure.md

.claude/rules/api.md

.claude/rules/ui.md

.claude/rules/testing.md

.claude/rules/documentation.md

.claude/rules/evidence.md

.claude/rules/agents.md

.claude/rules/powershell.md

.claude/rules/typescript.md

.claude/rules/python.md

```

  

Do not create every possible rule file.

  

---

  

## 3. Authoritative Inputs

  

Read and reconcile:

  

1. `PROJECT.md`

2. `AUTHORITATIVE_ARCHITECTURE.md`

3. `BUILD_PATTERN.md`

4. `DECISIONS.md`

5. Approved ADRs

6. `docs/50-security/technical-guardrails.md`

7. Applicable local Swif7Edge standards

8. Repository structure

9. Selected languages and frameworks

10. Selected Azure and Microsoft 365 capabilities

11. Applicable testing and evidence requirements

12. Existing `.claude/` content

  

Rules must come from durable repository authority, not chat history.

  

---

  

## 4. Instruction Layers

  

Use three layers.

  

### Layer 1 — Root operating contract

  

`CLAUDE.md` contains universal repository-wide behavior, authority order, work process, decision rules, and links to scoped rules.

  

Do not duplicate the entire root operating contract inside every rule.

  

### Layer 2 — Scoped rules

  

`.claude/rules/*.md` contains instructions that apply only to defined paths, technologies, services, or task categories.

  

### Layer 3 — Task-package instructions

  

The Primary Orchestrator may provide bounded task-specific instructions. Task instructions may narrow scope but may not weaken permanent controls.

  

---

  

## 5. Rule Precedence

  

Use this precedence:

  

1. Applicable law, contract, security boundary, and approved hard controls

2. Component- or service-specific authoritative files

3. `AUTHORITATIVE_ARCHITECTURE.md`

4. `PROJECT.md`

5. Approved ADRs and `DECISIONS.md`

6. `BUILD_PATTERN.md`

7. `CLAUDE.md`

8. Applicable scoped rule

9. Task-package instructions

10. Supporting references

  

A narrower rule may add detail but may not weaken a higher-authority requirement.

  

When rules conflict:

  

1. Stop only affected work.

2. Identify the conflicting sources.

3. Apply the higher authority when clear.

4. Correct routine documentation drift autonomously.

5. Route a material unresolved choice through `DECISIONS.xlsx`.

6. Do not invent a compromise.

  

---

  

## 6. Universal Versus Scoped Rules

  

Keep a rule in `CLAUDE.md` when it applies to nearly all work, including:

  

- Authority lookup

- Goal and requirement alignment

- Use of `BUILD_PATTERN.md`

- Decision handling

- Evidence over assertion

- Drift and hallucination control

- Safe autonomy

- No paid commitments without approval

- No self-approved exceptions

- Preservation of unrelated work

- Documentation synchronization

- Audit requirements

  

Create a scoped rule when it applies only to a language, framework, directory, service, data domain, Microsoft 365, Azure infrastructure, security-sensitive code, tests, evidence, documentation, UI, API, or agent implementation.

  

Reference universal controls instead of copying them into every file.

  

---

  

## 7. Rule Activation

  

Use the path-scoping or rule-activation mechanism supported by the installed Claude Code version.

  

Before writing metadata:

  

1. Inspect the supported local rule syntax.

2. Use only supported path, pattern, or scope fields.

3. Do not invent unsupported frontmatter.

4. Validate that intended files activate the rule.

5. Document task-type activation in `_index.md` when path scoping alone is insufficient.

  

Scope rules as narrowly as practical without creating gaps.

  

---

  

## 8. Required Rule Structure

  

Each rule must contain:

  

```markdown

# Rule Name

  

## Purpose

## Applies To

## Authority

## Required Behavior

## Prohibited Behavior

## Decision Gates

## Validation

## Evidence

## Related Files

```

  

Keep rules concise. Do not include long tutorials, historical narratives, duplicated architecture, or full framework text.

  

---

  

## 9. Rule Index

  

Create `.claude/rules/_index.md` with:

  

- Rule file

- Purpose

- Activation scope

- Source authority

- Owner

- Hard gates

- Validation method

- Related standards

  

Example:

  

| Rule | Applies to | Authority | Purpose |

|---|---|---|---|

| `security.md` | Auth, secrets, privileged code | Technical guardrails | Enforce identity, access, secret, and public-exposure controls |

| `data.md` | Schemas, migrations, calculations | Architecture and data standard | Protect semantic integrity and canonical schema alignment |

| `m365.md` | Graph and tenant operations | M365 standard | Enforce Graph-only, plan/apply, break-glass, and live-state safeguards |

  

The index must not duplicate the full rules.

  

---

  

## 10. Security Rule

  

Create `security.md` when the project handles authentication, authorization, secrets, privileged operations, sensitive data, public endpoints, or security controls.

  

It must enforce, as applicable:

  

- Entra ID as the default identity provider

- Least privilege

- Managed identity or certificate-based workload authentication

- No secrets in Git

- No unvalidated tokens or claims

- No frontend-trusted roles

- No public exposure without authorization

- Broad Graph permissions and tenant consent as decision gates

- Break-glass verification before Conditional Access or privileged identity changes

- Security degradation as a hard gate

- Evidence-based security claims

- Independent review of material security changes

  

When the Entra SPA-plus-API standard applies, link to:

  

```text

docs/50-security/entra-sso-internal-apps.md

```

  

Do not duplicate the full standard.

  

---

  

## 11. Data Rule

  

Create `data.md` when the project stores, transforms, migrates, calculates, imports, exports, scores, or classifies data.

  

It must enforce:

  

- Swif7Edge canonical schema use when applicable

- Central authority plus versioned local schema copy

- Data classification and provenance

- Encryption and retention

- Schema validation

- Migration review

- Unit, percentage, currency, date, timezone, precision, and identifier safeguards

- No silent schema fork

- No silent reinterpretation of existing records

- Data-integrity hard gate

- Representative tests and rollback or recovery

  

Pricing, rate, compliance-score, and percentage calculations require explicit semantic validation.

  

---

  

## 12. Microsoft 365 Rule

  

Create `m365.md` when the project uses Microsoft Graph, Entra, Intune, Purview, SharePoint, Teams, Exchange, or tenant configuration.

  

It must enforce:

  

- Microsoft Graph instead of deprecated AzureAD, MSOnline, or Msol tooling

- Correct Commercial or GCC High endpoints

- Least-privilege permissions

- Explicit decisions for broad permissions or administrator consent

- Read-only plan before apply

- Drift detection

- Unexplained drift blocks mutation

- Bounded retry and throttling handling

- Pagination and schema validation

- Current-state and applied-state recording

- Break-glass safeguards

- Screenshot evidence when required

- No CUI in an unauthorized Commercial application

- Live verification before completion claims

  

---

  

## 13. Azure and Infrastructure Rules

  

Create `azure.md` and, when needed, `infrastructure.md`.

  

They must enforce:

  

- Azure as the approved public cloud

- Azure-native services where appropriate

- Bicep and Azure Verified Modules as preferred infrastructure patterns

- Managed identity

- Key Vault for secrets, keys, and certificates

- API Management for reusable API policy and exposure when applicable

- Azure Monitor, Application Insights, and Log Analytics when applicable

- Infrastructure as code

- Plan/apply separation

- Reproducibility and idempotence

- Drift inspection

- Destructive-change gates

- Rollback or recovery

- No new paid commitment without approval

- One-live-environment safety

- Cost and blast-radius analysis

- Deployment evidence

  

---

  

## 14. API and UI Rules

  

Create `api.md` when APIs are exposed or consumed. It must enforce approved-API reuse, versioned contracts, schema validation, identity, input validation, throttling, idempotency where needed, safe errors, correlation IDs, backward compatibility, and live verification.

  

Scraping requires user authorization.

  

Create `ui.md` when user-facing interfaces exist. It must enforce design-first, requirement alignment, the approved authentication pattern, appropriate accessibility, clear error states, no exposure of secrets, proportional testing, and updates to architecture and reporting when user flows change.

  

---

  

## 15. Testing Rule

  

Create `testing.md` for executable code, automation, infrastructure, integrations, or transformations.

  

It must enforce applicable:

  

- Unit tests

- Schema tests

- Static analysis

- Integration tests

- Failure-path tests

- Idempotence tests

- Migration tests

- Authentication and authorization tests

- Drift tests

- Recovery tests

- Live authorized-resource verification

  

Mocks may assist development but do not prove a live integration.

  

---

  

## 16. Documentation and Evidence Rules

  

Create `documentation.md` for root authority files and `docs/`. It must enforce documentation cascade, authority order, no duplicate truths, stable identifiers, current-versus-target separation, proposed-versus-approved separation, valid links, and regeneration of `report.html` and architecture HTML.

  

Create `evidence.md` for `evidence/` and evidence-producing workflows. It must enforce claim linkage, creation date, producer, no secrets, actual image files for required screenshots, live-versus-mock distinction, controlled references for large or sensitive evidence, and rejection of unsupported claims.

  

---

  

## 17. Agent Rule

  

Create `agents.md` when the project defines or uses agents, tools, or AI workflows.

  

It must enforce:

  

- Primary Orchestrator accountability

- Bounded task packages

- Explicit read and write scope

- No unmanaged agent trees

- No overlapping writes without coordination

- Bounded retries, timeouts, and backoff

- Malformed-output rejection

- Independent review

- Audit Agent separation

- No self-approved exceptions

- No unsupported completion claims

- Machine-checkable return contracts

- Failure containment, kill switch, and orphan cleanup

  

---

  

## 18. Language Rules

  

Create language-specific rules only for languages present in the approved architecture or repository.

  

They should contain formatter, linter, error-handling, testing, logging, dependency, security, and project conventions.

  

PowerShell rules must include Graph-only M365 automation, `SupportsShouldProcess`, `-WhatIf`, structured output, and prohibited unsafe patterns.

  

Do not create language textbooks.

  

---

  

## 19. Rule Generation and Conflict Audit

  

For each applicable rule:

  

1. Identify source requirements.

2. Identify scope.

3. Identify minimum instructions.

4. Identify hard gates.

5. Identify validation.

6. Create the rule.

7. Test activation where possible.

8. Check duplication.

9. Check conflicts.

10. Add it to `_index.md`.

  

Compare all rules against `CLAUDE.md`, `PROJECT.md`, `AUTHORITATIVE_ARCHITECTURE.md`, `BUILD_PATTERN.md`, technical guardrails, and each other.

  

Material unresolved conflicts block completion.

  

---

  

## 20. Rule Change Control

  

After initialization:

  

- Routine clarifications may be made autonomously.

- New applicable technology may receive a new scoped rule.

- Obsolete rules should be removed or archived.

- Material authority changes require a durable decision.

- No rule may weaken security, compliance, data integrity, evidence, audit, or exception controls without explicit approval.

- Rule changes must update `_index.md`.

- Material changes must update `report.html`.

  

---

  

## 21. Validation

  

Verify:

  

- `.claude/rules/` and `_index.md` exist.

- Only applicable rule files exist.

- Every rule identifies scope and authority.

- Universal instructions are not unnecessarily duplicated.

- Activation syntax is supported.

- Intended paths activate relevant rules where testable.

- Required security, data, M365, Azure, testing, documentation, evidence, and agent rules exist when applicable.

- No rule weakens a hard control.

- No rule depends on chat history.

- No backlog item was created.

- No live resource was changed.

  

---

  

## 22. Completion Criteria

  

This module is complete when applicable scoped rules exist, remain concise, have valid activation, contain no unresolved conflict, preserve non-bypassable controls, and allow future agents to load the correct context without unnecessary instructions.

  

---

  

## 23. Module Completion Report

  

```text

MODULE_STATUS:

MODULE_ID: scoped_rules

RULE_INDEX:

RULES_CREATED:

RULES_MODIFIED:

RULES_SKIPPED:

ACTIVATION_VALIDATED:

CONFLICTS_FOUND:

CONFLICTS_RESOLVED:

QUESTIONS_ADDED:

VALIDATION_PERFORMED:

VALIDATION_RESULT:

BLOCKING_ISSUES:

```