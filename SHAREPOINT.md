# SHAREPOINT.md — SharePoint / Microsoft Graph Connector Interface (Swif7Edge standard)

> **Canonical, durable interface.** Must survive initialization cleanup. Derived from the working
> connector `swif7edge-pipeline/backend/src/services/connectors/sharepoint.ts` and
> `sharepoint-infra/scripts/*`. Replace `<PLACEHOLDER>` values in git-ignored config only.

## 1. Non-negotiables

1. **Graph only. PnP is not usable.** `PnP.PowerShell` is broken / AV-quarantined (its ALC
   assembly is stripped). All SharePoint work goes through **Microsoft Graph** (`v1.0`) via raw
   `fetch`/REST. `@pnp/*` and `@microsoft/microsoft-graph` SDKs are **not** dependencies.
2. **App-only, certificate-based auth.** Client-credentials flow with a certificate (see
   `VAULT.md`) — never delegated, never a client secret.
3. **Root confinement.** Every write descends from a single resolved app-root item. The root
   resolver **throws** rather than falling back to the library root.
4. **Path validation before any write.** Reject `.`/`..`, path separators, illegal chars,
   absolute paths, and traversal _before_ calling Graph.
5. **Least privilege.** Target is a dedicated identity with `Sites.Selected` scoped to exactly
   the one site. `Sites.FullControl.All` is the legacy standing credential and must not be the
   default for a new project.

## 2. Auth + endpoints

```
GRAPH   = https://graph.microsoft.com/v1.0
scope   = https://graph.microsoft.com/.default          (app-only)
token   = ClientCertificateCredential(tenant, client, pem).getToken(scope)   // pem from Key Vault
site    = /sites/{SP_SITE_HOST}:{SP_SITE_PATH}          // resolve to a site id
```

### Required environment variables (non-secret)

| Var                                | Meaning                      | Example                                |
| ---------------------------------- | ---------------------------- | -------------------------------------- |
| `SP_TENANT_ID` / `SP_CLIENT_ID`    | Entra tenant / app client id | `<TENANT_ID>` / `<CLIENT_ID>`          |
| `SP_KEYVAULT_URL` / `SP_CERT_NAME` | cert location (see VAULT.md) | `https://kv-<org>-…/` / `sp-m365-cert` |
| `SP_SITE_HOST`                     | SharePoint host              | `<tenant>.sharepoint.com`              |
| `SP_SITE_PATH`                     | site server-relative path    | `/sites/T1-BusinessDevelopment`        |
| `SP_ROOT_FOLDER`                   | confinement root folder      | `Swif7Edge Pipeline`                   |

## 3. Root confinement + path safety (the chokepoint)

- `resolveAppRoot()` resolves `SP_ROOT_FOLDER` under the site's default document library and
  returns its item id; it **throws** if not found (never falls back to library root). The
  resolved absolute path is cached with a short TTL (~5 min) and invalidated on an observed move.
- `sanitizeFolderName()` strips SharePoint-illegal chars `[\\/:*?"<>|]`.
- `validateSegment()` rejects `.`, `..`, separators, illegal chars, trailing dot/space.
- `assertConfinedRelPath()` refuses absolute paths and traversal; `relUnderRoot()` **fails
  closed** (throws if a target is not under the root).
- **Single chokepoint:** all id-targeted mutations (`DELETE`/`PATCH`) go through
  `confinedItemRequest()`, which re-verifies the item is under the confinement root. A raw
  `fetch(.../items/{id}, {method:'DELETE'})` anywhere else is **banned by a build-time
  conformance test** (see `swif7edge-pipeline/backend/test/canonical-*.test.ts`). New repos
  must ship the same bypass test.
- Folder creation uses `@microsoft.graph.conflictBehavior: 'fail'` (idempotent check-then-create).

## 4. Least-privilege permission model

- Preferred: an **Azure Container Apps managed identity** granted Graph `Sites.Selected` scoped to
  the single ingestion site (see `sharepoint-infra/docs/00-MASTER-PLAN.md`).
- Read-only taxonomy work (Purview sensitivity labels) uses a **separate** identity with
  `SensitivityLabel.Read` only — never the SharePoint write identity (avoid permission widening).
- Site creation (communication sites) is the one thing Graph cannot do; it uses SharePoint REST
  `/_api/SPSiteManager/create` and is out of scope for normal app writes.

## 5. Verify it works

`scripts/verify.ps1` reaches the SharePoint root (`GET {site}/drive/root:/{SP_ROOT_FOLDER}`) with
an app-only token and reports pass/fail. A 401/403 on writes means the app lacks the required
`Sites.*` permission or admin consent.
