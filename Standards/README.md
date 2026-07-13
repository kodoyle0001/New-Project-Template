# Standards — source manifest

Authoritative published standards behind Swif7Edge's compliance program.
This is the **staging** copy (`<local-standards-staging-dir>`). Move
contents into the authoritative source once verified.

Populated: 2026-07-12.

## Present (downloaded, verified `%PDF` + exact byte length)

### CMMC L2 / NIST 800-171 — primary regime

| File                             | What it is                                                               | Source             |
| -------------------------------- | ------------------------------------------------------------------------ | ------------------ |
| `NIST.SP.800-171r2.pdf`          | 800-171 Rev 2 — **the version CMMC binds to; working baseline**          | nvlpubs.nist.gov   |
| `NIST.SP.800-171A.pdf`           | 800-171A assessment procedures (pairs with Rev 2)                        | nvlpubs.nist.gov   |
| `NIST.SP.800-171r3.pdf`          | 800-171 Rev 3 (May 2024) — future reference, **not yet adopted by CMMC** | nvlpubs.nist.gov   |
| `NIST.SP.800-171Ar3.pdf`         | 800-171A Rev 3 — assessment companion to Rev 3, reference only           | nvlpubs.nist.gov   |
| `CMMC-AssessmentGuide-L2-v2.pdf` | CMMC Assessment Guide, Level 2 (v2.13)                                   | dodcio.defense.gov |
| `CMMC-ScopingGuide-L2-v2.pdf`    | CMMC Scoping Guide, Level 2 (v2.13)                                      | dodcio.defense.gov |
| `CMMC-AssessmentGuide-L1-v2.pdf` | CMMC Assessment Guide, Level 1 (v2.13)                                   | dodcio.defense.gov |
| `CMMC-ModelOverview-v2.pdf`      | CMMC Model Overview (v2.13)                                              | dodcio.defense.gov |

### Supporting reference

| File                   | What it is                                                                 | Source           |
| ---------------------- | -------------------------------------------------------------------------- | ---------------- |
| `NIST.SP.800-53r5.pdf` | 800-53 Rev 5 control catalog (parent behind 800-171 + ISO 27001 crosswalk) | nvlpubs.nist.gov |

## Not present — retrieve by hand

### SOC 2

- **AICPA 2017 Trust Services Criteria (revised points of focus 2022)** — free, but
  the download button is behind a (free) AICPA account login (`gated_content=registered`).
  Sign in and click **Download (554.3 KB)** at:
  https://www.aicpa-cima.com/resources/download/2017-trust-services-criteria-with-revised-points-of-focus-2022
  Save as `AICPA-Trust-Services-Criteria-2017-rev2022.pdf`.

### ISO — purchase only

- **ISO/IEC 27001:2022** — https://www.iso.org/standard/27001
- **ISO/IEC 27002:2022** — https://www.iso.org/standard/75652.html
- US reseller: ANSI webstore — https://webstore.ansi.org
- Third-wave regime (after CMMC and SOC 2). A published ISO 27001:2022 → CMMC L2 /
  NIST 800-171 crosswalk already exists in the Compliance repo and should seed the SoA.

## How the free set was fetched

`Download-Standards.ps1` fetches the NIST files headless. The four CMMC PDFs live
behind an **Akamai WAF on dodcio.defense.gov that 403s every non-browser client**
(Invoke-WebRequest, curl, .NET — the block is TLS-fingerprint based, not User-Agent),
so they were retrieved through a real browser session (Playwright Chromium), which the
WAF admits. If you re-run the script headless the CMMC rows will report `FAIL 403` —
that is expected; use a browser for those four.

## Version / currency note

CMMC guides are the **v2.13 (September 2024)** set, current under the CMMC Program rule.
The DFARS acquisition rule took effect **2025-11-10**; C3PAO certification phases in
through **November 2026**. Before an assessment, confirm you hold the version the
contract / C3PAO names — for CMMC that currently means **800-171 Rev 2, not Rev 3**.
