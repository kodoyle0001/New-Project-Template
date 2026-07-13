# VAULT.md — Credential Vault Interface (Swif7Edge standard)

> **Canonical, durable interface.** This file must survive initialization cleanup. It is how any
> Swif7Edge repo authenticates to Azure Key Vault and reads secrets **without ever embedding a
> secret in the repo**. It is derived from how the real repos actually work
> (`swif7edge-pipeline`, `Office-Infrastructure`). Replace every `<PLACEHOLDER>` with your
> project's real values in your **git-ignored** local config — never here.

## 1. The rule that never bends

- **The private key never leaves the vault.** Repos authenticate _to_ the vault with a
  managed identity (in Azure) or a certificate whose private key lives only in the OS
  certificate store / the vault (locally). Secrets are read at runtime; they are never
  committed, baked into an image, or written to logs.
- Tenant IDs, client IDs, subscription IDs and certificate **thumbprints** are _identifiers,
  not secrets_ — they may live in a project's own git-ignored config or CI variables, but they
  are **never hardcoded into this shared template** (see `SECURITY.md`).

## 2. The authentication path (runtime, in Azure)

The canonical path, as implemented in `swif7edge-pipeline/backend/src/services/connectors/sharepoint.ts`:

```
System-assigned Managed Identity        (no secret, no key in code/env/image)
      -> ManagedIdentityCredential
      -> SecretClient(SP_KEYVAULT_URL, mi)         @azure/keyvault-secrets
      -> getSecret(SP_CERT_NAME)                   KV certificate's PKCS#12, base64, empty pwd
      -> convert PKCS#12 -> PEM in-memory          openssl on a 0600 temp file, unlink in finally
      -> ClientCertificateCredential(tenant, client, pem)
      -> getToken("https://graph.microsoft.com/.default")   app-only Graph token
```

Notes that matter:

- The PEM is **TTL-cached (15 min)** so a Key Vault cert rotation is picked up without a process
  restart; the credential is rebuilt only when the PEM changes.
- A **separate identity** is used for read-only Purview/label work (`ManagedIdentityCredential`
  directly, no KV) — two distinct identities on purpose, to avoid permission widening
  (least privilege). Do not consolidate them.

### Required environment variables (non-secret)

| Var               | Meaning                    | Example                                             |
| ----------------- | -------------------------- | --------------------------------------------------- |
| `SP_KEYVAULT_URL` | Key Vault URL              | `https://kv-<org>-<purpose>-<env>.vault.azure.net/` |
| `SP_CERT_NAME`    | KV certificate/secret name | `sp-m365-cert` (a.k.a. `sp-m365-automation`)        |
| `SP_TENANT_ID`    | Entra tenant id            | `<TENANT_ID>`                                       |
| `SP_CLIENT_ID`    | App registration client id | `<CLIENT_ID>`                                       |

## 3. How the vault + grant are provisioned (Office-Infrastructure / Terraform)

The Key Vault and the access grant are infrastructure-as-code
(`Office-Infrastructure/modules/keyvault`):

- One Terraform-managed Key Vault stores the automation service principal's **certificate**.
  Hardening is baked in: `purge_protection_enabled = true`, 90-day soft-delete retention,
  SKU standard.
- Access is granted via **access policies** by default (`enable_rbac_authorization = false`).
  A consumer identity is granted **read-only** (`Get`, `List`) on certificates/secrets/keys by
  passing its **service-principal object-id** into the module. Admins get a separate
  full-lifecycle policy.
- **Two-phase grant** (documented in `docs/permissions/automation.md`):
  1. `terraform apply` with `automation_sp_object_id = ""` → stands up the vault (grant block
     produces 0 resources).
  2. Create the SP + import/upload its certificate to the vault, then set
     `automation_sp_object_id = <SP_OBJECT_ID>` and re-`apply` → creates the access policy that
     grants the SP read access.
- **Certificate rotation policy: 12 months.** Rotating in the vault is picked up automatically
  by the 15-minute PEM cache above.

### Naming conventions

- Vault: `kv-<org>-<purpose>` (globally unique, 3–24 chars), e.g. `kv-<org>-m365-auto`.
- Certificate: `sp-m365-cert`. App registration: `sp-<scope>-Automation`.

## 4. Local development (no managed identity)

- The cert's private key is resolved from `Cert:\CurrentUser\My` / `Cert:\LocalMachine\My` by
  **thumbprint** and must have `HasPrivateKey = true` (see `sharepoint-infra/scripts/S7E-Common.ps1`).
- Local real config lives in **git-ignored** `config/settings.json` (copied from
  `config/settings.example.json`, which holds only `00000000-…` placeholders).
- In CI, store the certificate as a secret (e.g. a GitHub Actions secret) and pass
  `clientId`/`tenantId`/`thumbprint` via CI variables. Never a client secret in a repo file —
  the org is converging on **certificate-only** app-only auth.

## 5. Verify it works

`scripts/verify.ps1` (see `VERIFY.md`) mints an app-only token against the vault-held certificate
and reports pass/fail. `Office-Infrastructure/tools/local/diagnose-cert-auth.ps1` is the reference:
it checks subject/thumbprint/`HasPrivateKey`, does a live `Connect-MgGraph`, and re-exports **only
the public `.cer`** — the private key stays put.

## 6. What must never happen

- No client secret created for the SPA pattern or committed anywhere.
- No `.pfx`/`.pem`/`.key`/`.cer` committed (see `.gitignore`).
- No secret written to logs, returned to a browser, or embedded in an image.
