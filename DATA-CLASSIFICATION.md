# DATA-CLASSIFICATION.md — Required Per-Repo Declaration (Swif7Edge standard)

> **This file is MANDATORY and must be completed before project work starts.** It must survive
> initialization cleanup. Final validation FAILS if this declaration is missing or contradictory.
> The standing rule is enforced here, at the boundary, so it cannot be violated by accident.

## 0. The standing rule (non-negotiable)

**No CUI on the commercial tenant.** The commercial Microsoft 365 tenant is
corporate/unclassified only. CUI / Export-Controlled data must not land on it. DLP's role is
**keep-out**: detect and block/quarantine controlled content to keep it _off_ the tenant.
(Ground truth: `sharepoint-infra/docs/00-MASTER-PLAN.md` Decision #6.)

## 1. Declaration (fill this in — no blanks)

```yaml
data_classification:
  target_tenant: # Commercial | GCC High        (REQUIRED)
  cui_eligible: # yes | no                      (REQUIRED)
  data_categories: # [corporate, public, business-confidential, ...]  (REQUIRED)
  controlled_categories_present: # [] | [CUI-Basic, CUI-Specified, Export-Controlled, FOUO]
  sensitivity_labels: # Purview labels applied (e.g. Public, HighlyConfidential-Executive)
  residency_notes: # any data-residency / sovereignty constraints
  declared_by: # role
  declared_date: # YYYY-MM-DD
```

## 2. Fail-closed consistency rules (checked by final validation & CI)

- **`cui_eligible: yes` REQUIRES `target_tenant: GCC High`.** `cui_eligible: yes` with
  `target_tenant: Commercial` is a hard failure.
- Any value in `controlled_categories_present` REQUIRES `target_tenant: GCC High` and a documented
  DLP keep-out on the commercial tenant.
- If the repo integrates SharePoint/Graph/Azure/identity/data-processing, this declaration is
  required (documentation-only repos with no Microsoft integration may mark `not_applicable`).

## 3. How the boundary is enforced (control inheritance, not reinvention)

- **DLP keep-out** on the commercial tenant detects CUI/Export-Controlled and blocks/quarantines
  (Purview info-types + policies live centrally; a project inherits, it does not reinvent).
- **Sensitivity labels** are read app-only, read-only via a managed identity with
  `SensitivityLabel.Read` and mapped to project categories (`swif7edge-pipeline/backend/src/services/purview.ts`).
- Controlled data is fenced from git: `.gitignore` blocks `/cui/`, `/controlled/`, `*.cui`.
- Commercial vs GCC High changes **endpoints, licensing, service availability, and compliance** —
  parameterize endpoints; never hardcode commercial endpoints in a GCC-High-eligible repo.

## 4. Control mapping

Ties to NIST 800-171 **3.1.3 (Control CUI flow)** and CMMC L2. Record the implementation in the
control-mapping template under `Templates/Compliance/` and any gap in the POA&M.
