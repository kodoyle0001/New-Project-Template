---
title: <Incident type> — Runbook
type: runbook
owner: <oncall role>
severity_range: "SEV1-SEV3"
last_drilled: 2026-MM-DD
next_drill: 2026-MM-DD
compliance:
  iso27001: ["A.5.24", "A.5.25", "A.5.26"]  # incident management
  iso20000: ["9.1"]                          # incident management
  cmmc_nist_800_171: ["3.6.1", "3.6.2"]
---

# <Title>

> **In an actual incident, skip to "Immediate actions" below. Read the rest after the dust settles.**

## When this runbook applies

The conditions that mean "use me now." Be specific.

## Immediate actions (first 15 minutes)

1. **Verify it's real.** How to confirm this isn't a false alarm.
2. **Page who.** Names + alternates.
3. **Communicate.** Which channel, what to say.
4. **Contain.** First containment step.

## Triage

- Decision tree for severity. Severity drives escalation.

## Containment

Step-by-step.

## Eradication & recovery

Step-by-step.

## Post-incident

1. Open the postmortem template: _Templates/Runbook/Postmortem Template #needs-content-fill.
2. File the incident report under `10_Policies/Audit/` #needs-content-fill within 24 hours.
3. If a control failed, open a ClickUp finding tagged with the failing compliance citation.

## Related

- 10_Policies/Incident Response Policy #needs-content-fill
- [[40_Runbooks/<adjacent runbook>]]
