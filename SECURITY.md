# SECURITY.md — Secrets Hygiene & "What Must Never Be Committed" (Swif7Edge standard)

> **Canonical, durable policy.** Must survive initialization cleanup. Enforced by
> `.gitignore`, `.gitleaks.toml`, the pre-commit hook, and the CI `secret-scan` + Tier-0 jobs.

## 1. What must NEVER be committed

**Secrets (hard block — a commit containing these must fail):**

- Client secrets / application passwords; any `client_secret`, `password=`, bearer/access tokens.
- Certificate **private keys** and key material: `*.pfx`, `*.pem`, `*.key`, `*.cer`, PKCS#12 blobs,
  `-----BEGIN … PRIVATE KEY-----`.
- Connection strings with credentials (`Server=tcp:…;Password=…`, `DefaultEndpointsProtocol=…;AccountKey=…`,
  `postgres://user:password@…`).
- API keys (Anthropic, Azure OpenAI, SAM, etc.), storage account keys, SAS tokens.
- `.env` / `.env.*` real values, `config/settings.json`, `*.local.json`, `.m365rc.json`,
  `app-registration.json`, token caches.

**Identifiers (allowed in a project's own git-ignored config or CI variables, but NEVER hardcoded
into this shared template):**

- Tenant IDs, client/app IDs, subscription IDs, certificate **thumbprints**, object IDs.
- These are _identifiers, not secrets_ (they cannot authenticate on their own), but a **template**
  copied into many repos must not propagate a real environment's identifiers. Use `<TENANT_ID>`,
  `<CLIENT_ID>`, etc. Real project repos may hardcode their own non-secret identifiers in deploy
  scripts (as `swif7edge-pipeline/infra/deploy-azure.sh` does) — the template must not.

**Personal / machine-specific values:** individual UPNs/emails, `C:\Users\<name>\…` paths,
another organization's name or document store.

## 2. What IS shipped to enforce this

| Artifact                           | Role                                                                                                      |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `.gitignore`                       | Baseline that fences secrets, keys, `.env`, controlled/CUI data, build output.                            |
| `.gitattributes` / `.editorconfig` | Normalized line endings + encoding (prevents accidental churn/leaks).                                     |
| `.gitleaks.toml`                   | Secret-scan ruleset; allowlists tenant/client IDs as identifiers, blocks keys/secrets/connection-strings. |
| `.pre-commit-config.yaml`          | Runs gitleaks + detect-private-key on every commit locally.                                               |
| `.github/workflows/ci.yml`         | `secret-scan` (gitleaks over history, redacted) + Tier-0 hard-deny grep gate; PR-blocking.                |
| `scripts/check_references.py`      | Fails the build on any broken init-system reference (integrity).                                          |

## 3. Tier-0 hard-deny (fail the build)

Mirrors `Office-Infrastructure/CLAUDE.yaml` `tier0_hard_deny`:

- No hardcoded secrets/passwords/tokens/keys; no printing/logging of tokens/secrets/private keys.
- No `ConvertTo-SecureString … -AsPlainText` with a literal secret.
- **Secrets sourced from Azure Key Vault; certificate-based app-only auth only** (no client secrets).

## 4. Least privilege & separation of duties

- One identity per purpose, scoped (`Sites.Selected`, `SensitivityLabel.Read`) — never a broad
  standing admin credential as the default.
- Ship `CODEOWNERS` so security-relevant files (`SECURITY.md`, `.gitleaks.toml`, workflows,
  `DATA-CLASSIFICATION.md`) require security review.
- Rotate certificates on a 12-month policy (see `VAULT.md`); purge client secrets in favor of
  cert-only auth.

## 5. If a secret is committed

1. Treat as a live incident. Rotate the credential immediately (do not just delete the commit).
2. Purge from history (`git filter-repo` / BFG) and force-clean.
3. Record in the decision record; open a POA&M entry if it touched a controlled boundary.
