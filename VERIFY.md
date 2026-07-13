# VERIFY.md — The `verify` / `doctor` Self-Test (Swif7Edge standard)

> Canonical, durable. "Plugs into our environment" must be **checkable, not assumed.** A freshly
> created repo runs one self-test that proves it is actually wired. Implemented by
> `scripts/verify.ps1`.

## What it checks

| #   | Check                            | How                                                                                                    | Pass condition           |
| --- | -------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------ |
| 1   | **Key Vault reachable**          | `az keyvault secret list --id $SP_KEYVAULT_URL` (or SDK)                                               | 200 / list returns       |
| 2   | **App-only Graph token mints**   | ClientCertificateCredential (cert from vault/store) → token for `https://graph.microsoft.com/.default` | non-empty token          |
| 3   | **SharePoint root reachable**    | `GET {site}/drive/root:/{SP_ROOT_FOLDER}` with the token                                               | 200 and item id returned |
| 4   | **DB migration head consistent** | compare max applied migration in `migrations_applied` to the highest `backend/db/migrations/NNN_*.sql` | equal (no drift)         |

## Behavior

- Each check reports **PASS / FAIL / SKIP** (SKIP when the relevant env var is unset — e.g. a
  documentation-only repo). Any FAIL exits non-zero so CI can gate on it.
- Reads only **non-secret** config (`SP_KEYVAULT_URL`, `SP_CERT_NAME`, `SP_TENANT_ID`,
  `SP_CLIENT_ID`, `SP_SITE_HOST`, `SP_SITE_PATH`, `SP_ROOT_FOLDER`, `DATABASE_URL` host) from the
  environment / git-ignored config. Never prints a token or secret.
- Reference implementations: `swif7edge-pipeline` `GET /api/health` (`select 1`) for DB liveness,
  and `Office-Infrastructure/tools/local/diagnose-cert-auth.ps1` for the cert→Graph path.

## Usage

```powershell
pwsh scripts/verify.ps1            # runs all applicable checks
pwsh scripts/verify.ps1 -Only 1,4 # subset
```
