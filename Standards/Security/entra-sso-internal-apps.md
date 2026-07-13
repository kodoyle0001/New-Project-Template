

# Entra SSO for Internal Applications

## Swif7Edge OIDC Standard

## 1. Document Authority

|Field|Value|
|---|---|
|Organization|Swif7Edge|
|Standard|Internal application user authentication|
|Pattern|React SPA plus protected API|
|Identity provider|Microsoft Entra ID|
|Protocol|OpenID Connect and OAuth 2.0 authorization-code flow with PKCE|
|Primary environment|Swif7Edge Commercial tenant|
|Data boundary|Corporate and unclassified data only|
|Status|Approved standing pattern|
|Central authority|Swif7Edge standards library|
|Local copy location|`docs/50-security/entra-sso-internal-apps.md`|
|Exception authority|Human Project Authority through `DECISIONS.xlsx`|

This standard is authoritative for internal Swif7Edge applications that use the SPA-plus-API architecture described below.

A versioned local copy must be included in every applicable repository.

The local copy must identify:

- Central source
    
- Standard version
    
- Copy date
    
- Whether local deviations exist
    
- Related ADRs
    

---

# 2. Purpose

This standard prevents every internal application team from independently recreating Entra authentication with different security assumptions.

It establishes one reusable pattern for:

- Staff sign-in
    
- Token acquisition
    
- API token validation
    
- Group-based access
    
- Application roles
    
- Separation of duties
    
- Administrative registration
    
- Authentication logging
    
- Continuous assurance
    
- Commercial-to-GCC-High portability
    

The pattern is designed to produce consistent security, auditability, and maintainability across Swif7Edge internal applications.

---

# 3. Applicability

Use this pattern when:

- The application is an internal Swif7Edge web application.
    
- A person signs in interactively.
    
- The frontend is a single-page application.
    
- The backend is a separately protected API.
    
- The application processes corporate or unclassified information.
    
- The application operates in the Swif7Edge Commercial tenant.
    
- The application uses Bearer tokens between the frontend and API.
    

Typical architecture:

```text
User
→ React SPA
→ Microsoft Entra ID sign-in
→ Access token
→ Protected API
→ Application data and services
```

---

# 4. Non-Applicability

Do not automatically use this pattern for:

- Server-rendered applications using server-managed sessions
    
- Unattended service-to-service automation
    
- Daemons or scheduled jobs
    
- Certificate-based app-only Graph integrations
    
- Applications processing CUI
    
- GCC High applications before the GCC High enclave and endpoints are approved
    
- External customer identity
    
- Business-to-consumer identity
    
- Mobile-native applications
    
- Applications that do not use a separate API
    

A different architecture requires an approved pattern or ADR.

Do not force the SPA-plus-API pattern onto an application whose approved architecture requires another session model.

---

# 5. Core Architecture

The approved pattern is:

```text
React SPA
+ MSAL browser
+ authorization-code flow with PKCE
+ Bearer access token
+ separate TypeScript API
+ independent API token validation
+ Entra group gating
+ application role resolution
```

The reference hosting pattern is:

```text
Frontend: Azure Static Web Apps
Backend: Azure Container Apps
Identity: Microsoft Entra ID
Secrets: Azure Key Vault where secrets are actually required
Monitoring: Approved Azure and Microsoft-native monitoring
```

Equivalent Azure-native hosting may be selected by the architecture when it preserves the security model.

---

# 6. Public Client and PKCE

The SPA is a public client.

Requirements:

- Use authorization-code flow with PKCE.
    
- Do not create a client secret for the SPA.
    
- Do not embed credentials in frontend code.
    
- Do not use implicit grant.
    
- Do not use resource-owner password flow.
    
- Do not use a confidential-client design unless the approved application architecture genuinely requires it.
    
- Do not create secrets preemptively.
    

The absence of an unnecessary secret reduces:

- Leakage risk
    
- Rotation burden
    
- Operational complexity
    
- Incident exposure
    

A future confidential flow must be designed and approved separately.

---

# 7. Commercial Tenant Baseline

Internal corporate applications use the Swif7Edge Commercial tenant.

Approved tenant information:

```text
Tenant domain: Swif7Edge.com
Tenant ID: <TENANT_ID>
Authority: https://login.microsoftonline.com/<TENANT_ID>/v2.0
```

The future GCC High enclave is separate.

Do not:

- Route CUI through the Commercial tenant
    
- Mix Commercial and GCC High identities or data
    
- Hardcode assumptions that prevent a future endpoint change
    
- Treat the Commercial tenant as authorized for controlled data
    

Authority and Graph endpoints must be configuration values.

---

# 8. SPA Session Model

The React frontend must use:

```text
@azure/msal-browser
```

The frontend:

1. Initiates authorization-code flow with PKCE.
    
2. Redirects the user to Entra ID.
    
3. Receives the authorization response.
    
4. Obtains the required access token.
    
5. Stores the token through the approved MSAL cache.
    
6. Adds the Bearer token to every protected API call.
    

Use:

```text
Authorization: Bearer <access-token>
```

Do not create:

- A server-side session store
    
- A server-managed application session cookie
    
- A custom token format
    
- A duplicate identity store for authentication
    

Prefer:

```text
sessionStorage
```

over:

```text
localStorage
```

for the MSAL token cache unless a documented application requirement justifies another choice.

---

# 9. API Token Validation

The backend API must independently validate every access token.

Do not trust claims merely because the frontend or a library parsed them.

Validate:

- Cryptographic signature
    
- Tenant JWKS
    
- Issuer
    
- Audience
    
- Expiration
    
- Not-before time when present
    
- Required scope
    
- Required claims
    
- Tenant
    
- Group or role authorization
    

The expected audience must match the configured API or application identifier.

The expected issuer must match the configured tenant authority.

The reference TypeScript implementation uses:

```text
jose
```

Equivalent maintained libraries may be used when they provide complete deterministic validation.

---

# 10. State and Nonce

The sign-in flow must correctly generate, preserve, and validate:

- `state`
    
- `nonce`
    

Requirements:

- Values must be cryptographically appropriate.
    
- Returned values must match the values created for the login request.
    
- Mismatches must fail authentication.
    
- Failures must be logged without exposing tokens.
    
- Do not bypass validation to resolve a login problem.
    

---

# 11. Durable User Identity

Use:

```text
preferred_username
```

as the primary user identity pin when it contains the approved user principal name.

Do not use:

```text
email
```

as the durable identity key.

Email addresses may be:

- Aliases
    
- Changed
    
- Reassigned
    
- Absent
    
- Different from the sign-in UPN
    

The application must resolve the authenticated UPN to the applicable internal user record.

Example:

```text
preferred_username
→ app_user
→ application role
```

The database should retain relevant Entra object identifiers when available to strengthen identity correlation.

---

# 12. Runtime Authentication Mode

Use a runtime environment variable:

```text
AUTH_MODE
```

Approved values:

```text
entra
dev
```

## `AUTH_MODE=entra`

Uses real Microsoft Entra authentication.

This is the only approved mode for a network-reachable deployed application.

## `AUTH_MODE=dev`

Uses a fixed local stub identity for local build and validation.

This is not a separate deployed development environment.

It is a local-only code path intended to support workstation development and deterministic builds.

The mode must be changeable without rebuilding the application.

Provide:

```text
GET /api/auth/config
```

to expose the current mode to the frontend.

Provide:

```text
GET /api/me
```

to return the resolved authenticated identity and application role.

---

# 13. Dev-Stub Hard Deny

`AUTH_MODE=dev` must never operate on a network-reachable deployment.

The dev stub bypasses real identity verification and therefore becomes a live vulnerability when exposed.

Enforce:

- CI or deployment validation rejects deployed `AUTH_MODE=dev`.
    
- Startup validation fails closed when a deployed workload detects `dev`.
    
- The application must not silently fall back to `dev`.
    
- Production configuration must explicitly use `entra`.
    
- Authentication failures must not trigger a fallback identity.
    
- The dev principal must contain no production privilege.
    
- Dev-stub behavior must be covered by tests.
    

Before making `entra` the enforced deployment default, confirm that an authorized administrator can successfully sign in.

---

# 14. Group-Based Access Gate

Access must be gated by an approved Entra security group.

Use the group object ID.

Do not use:

- Display name
    
- Mail nickname
    
- Human-readable group label
    
- An unverified hardcoded name
    

Example configuration:

```text
GROWTH_GROUP_ID=<entra-group-object-id>
```

The current proposal-pipeline target group is:

```text
grp-Dept-Growth
```

The display name is descriptive only.

The object ID is authoritative for enforcement.

---

# 15. Group Claims

Configure the application registration to include the applicable security-group claim.

The API must validate group membership from the signed token when the claim is present.

When the user is a member of enough groups that Entra emits a group-overage indicator instead of the complete claim:

1. Detect the overage indicator.
    
2. Use an approved Microsoft Graph membership check.
    
3. Use least-privilege Graph permissions.
    
4. Cache only when safe and justified.
    
5. Record authorization failures.
    
6. Fail closed when membership cannot be verified.
    

Do not assume the overage path can never occur.

---

# 16. Enterprise Application Assignment

When the application requires Entra to block nonmembers before token issuance, configure:

```text
Assignment required: Yes
```

Assign the approved gating group to the enterprise application.

Application-level authorization must still validate the required group or role.

Do not rely solely on the presence of an issued token as proof of application authorization.

---

# 17. Roles and Separation of Duties

Entra group membership and application user records support application roles.

Reference roles include:

```text
principal
reviewer
member
```

## `principal`

May perform approved principal-level administration or authorization functions.

## `reviewer`

May perform approved review functions.

## `member`

May sign in and perform basic read functions but may not perform privileged or role-gated actions.

The API must resolve the signed-in identity to the real application user record.

Do not:

- Assign a privileged default role
    
- Trust a role supplied by the frontend
    
- Use a hardcoded privileged identity in Entra mode
    
- Bypass separation-of-duties rules
    

Role-gated functions such as:

```text
requirePrincipal
```

must use the server-resolved application role.

---

# 18. First-Login Provisioning

An authenticated user who:

- Is in the approved gating group
    
- Successfully validates through Entra
    
- Does not yet have an `app_user` record
    

may be provisioned as:

```text
member
```

The initial role must be nonprivileged.

The user may:

- Sign in
    
- Read approved information
    

The user may not:

- Perform principal actions
    
- Perform reviewer actions
    
- Assign their own role
    
- Bypass separation of duties
    

An approved principal assigns the final role through the administrative workflow.

Provisioning must be logged.

---

# 19. Redirect URIs

Register production and local callback URIs on the same application registration.

## Production

Use the actual HTTPS application host:

```text
https://<approved-application-host>/auth/callback
```

Confirm the current host before registration.

Do not assume an Azure Static Web Apps-generated hostname will remain unchanged.

## Local build

Use:

```text
http://localhost:<port>/auth/callback
```

Do not create a separate development app registration solely for the local callback.

Redirect URIs must match exactly.

Changes to redirect URIs require a new administrative request.

---

# 20. Runtime Configuration

At minimum, use runtime configuration for:

```text
AUTH_MODE
ENTRA_TENANT_ID
ENTRA_CLIENT_ID
ENTRA_AUTHORITY
ENTRA_API_SCOPE
ENTRA_REDIRECT_URI
GATING_GROUP_ID
GRAPH_BASE_URL
```

Tenant and client identifiers are identifiers, not secrets.

They may be stored in approved non-secret configuration.

Use `.env` files only according to repository rules.

Never commit:

- Client secrets
    
- Private keys
    
- Certificates containing private keys
    
- Tokens
    
- Refresh tokens
    
- Session material
    

---

# 21. Logout

Application logout must:

1. Clear the MSAL cache.
    
2. Clear application-side identity state.
    
3. Redirect through the Entra end-session endpoint when full Entra-session termination is required.
    
4. Return the user to an approved post-logout location.
    
5. Avoid retaining sensitive application state.
    

Clearing only the local application state does not necessarily terminate the Entra browser session.

The user experience must accurately represent which session was ended.

---

# 22. Authentication and Authorization Logging

Log:

- Successful sign-ins
    
- Sign-in failures
    
- Token-validation failures
    
- Group-gating denials
    
- Role-gating denials
    
- First-login provisioning
    
- Role assignments
    
- Logout events when operationally useful
    
- Group-overage fallback checks
    
- Administrative authentication configuration changes
    

Authorization denials are especially important because a valid Swif7Edge user may authenticate successfully but still lack application access.

Use the application’s approved append-only access or audit log.

Do not log:

- Access tokens
    
- Refresh tokens
    
- Authorization codes
    
- Client secrets
    
- Private keys
    
- Complete sensitive claims
    
- Unnecessary personal data
    

---

# 23. App Registration Administrative Process

Developers and build agents must not silently modify Entra application registrations.

The process is:

1. Copy the approved App Registration Request template.
    
2. Complete all required fields.
    
3. Send it to:
    

```text
<ADMIN_UPN>
```

4. Use the subject:
    

```text
App Registration Request — <app name>
```

5. The authorized tenant administrator creates or updates:
    
    - App registration
        
    - Enterprise application
        
    - SPA platform
        
    - Redirect URIs
        
    - API scope
        
    - Group claims
        
    - Gating-group assignment
        
    - Assignment-required setting when applicable
        
6. The administrator returns:
    
    - Client ID
        
    - Tenant ID
        
    - Approved identifiers and configuration
        
7. The developer places approved identifiers into runtime configuration.
    
8. Every later change requires a new request referencing the existing application.
    

Do not issue a client secret for the SPA pattern.

---

# 24. Administrator Identity

Confirmed administrative behavior:

```text
<USER_UPN>
```

does not have sufficient directory privilege to register applications.

Application registration must use:

```text
<ADMIN_UPN>
```

or another currently approved administrative or emergency-access path.

Do not assume a backup administrator.

When the primary administrator is unavailable:

1. Verify the current backup path.
    
2. Use approved break-glass or designated backup administration.
    
3. Record the administrative action.
    
4. Do not wait silently while claiming the registration is complete.
    

---

# 25. Initial Tester Access

Before testing sign-in, verify that every initial tester:

- Exists in the Commercial tenant
    
- Is enabled
    
- Is assigned to the required gating group
    
- Has the expected application role or allowed initial role
    
- Uses an approved account
    
- Uses the correct tenant
    
- Uses the correct application URL
    

A valid Swif7Edge user outside the gating group must be denied.

That denial is expected security behavior, not automatically an application defect.

---

# 26. Portal Configuration Procedure

The authorized administrator performs:

1. Open Microsoft Entra admin center.
    
2. Open **App registrations**.
    
3. Select **New registration**.
    
4. Enter the approved application name.
    
5. Select **Single tenant**.
    
6. Register the application.
    
7. Record the Application client ID.
    
8. Open **Authentication**.
    
9. Add the **Single-page application** platform.
    
10. Add the approved production HTTPS redirect URI.
    
11. Add the approved local callback URI.
    
12. Open **Expose an API**.
    
13. Use:
    

```text
api://<client-id>
```

14. Add:
    

```text
access_as_user
```

15. Configure who may consent according to approved policy.
    
16. Open **Token configuration**.
    
17. Add the required security-groups claim.
    
18. Do not create a client secret.
    
19. Review required API permissions.
    
20. Grant administrator consent only when approved.
    
21. Open the enterprise application.
    
22. Assign the approved gating group.
    
23. Set **Assignment required** to **Yes** when the architecture requires pre-token assignment enforcement.
    
24. Record the configuration and evidence.
    

---

# 27. Reference Implementations

The canonical reference implementation is the Swif7Edge proposal-pipeline application.

## Frontend reference

```text
Repository: swif7edge-pipeline
Area: frontend authentication module
Technology: React and @azure/msal-browser
Flow: authorization-code plus PKCE
Token use: Bearer token
Configuration: runtime authentication configuration
```

## Backend reference

```text
Repository: swif7edge-pipeline
Area: backend authentication and token validation
Technology: Fastify, TypeScript, jose
Validation: signature, issuer, audience, and expiration
Endpoints: /api/auth/config and /api/me
Authorization: application user and role resolution
```

Before copying a reference implementation:

1. Inspect the current source.
    
2. Confirm it remains the approved canonical version.
    
3. Reconcile it with the target repository architecture.
    
4. Do not copy obsolete code from memory.
    

---

# 28. App-Only Automation Is a Separate Pattern

Use certificate-based app-only authentication when a service authenticates as itself and no user signs in.

Reference pattern:

```text
Managed Identity
→ Azure Key Vault
→ ClientCertificateCredential
→ app-only Microsoft Graph token
```

The private key must not leave Key Vault.

Use:

- This OIDC pattern when a person signs in.
    
- The app-only certificate pattern when a service authenticates as itself.
    

Do not combine the two patterns without an approved architecture.

---

# 29. GCC High Portability

Design applications so Commercial-to-GCC-High endpoint changes are configuration-driven.

Parameterize:

- Entra authority
    
- Microsoft Graph base URL
    
- API Management endpoints
    
- Redirect URIs
    
- Tenant ID
    
- Resource audiences
    
- Service capability differences
    

A future approved setting may use:

```text
gcc-high
```

to select sovereign-cloud endpoints.

Do not hardcode Commercial endpoints throughout source code.

The presence of portability configuration does not authorize deployment to GCC High.

---

# 30. Data Boundary

This pattern is for:

- Corporate data
    
- Unclassified data
    
- Approved internal business information
    

This pattern is not approved for:

- CUI
    
- ITAR-controlled data
    
- Classified data
    
- Data assigned to the future GCC High enclave
    
- Data whose handling requirements exceed the Commercial environment
    

Do not route controlled data through an application using this Commercial-tenant pattern.

When data classification is unclear, stop the affected design and use `DECISIONS.xlsx`.

---

# 31. Compliance Support

This pattern supports applicable identity, access, separation-of-duties, and audit objectives associated with:

- CMMC Level 1
    
- CMMC Level 2
    
- NIST SP 800-171
    
- NIST SP 800-53 Revision 5
    
- SOC 2
    
- Swif7Edge identity and access standards
    

Relevant control areas include:

- Identification and authentication
    
- Access enforcement
    
- Separation of duties
    
- Least privilege
    
- Audit-event generation
    
- Account management
    
- Application access control
    

The repository must not claim compliance or certification solely because this pattern is implemented.

Compliance claims require deterministic verification and applicable assessment evidence.

---

# 32. Hard Rules

The following are prohibited:

- Client secrets in a SPA
    
- Implicit grant
    
- Password grant
    
- Trusting frontend-provided roles
    
- Trusting unvalidated JWT claims
    
- Using email as the durable identity key
    
- Group enforcement by display name
    
- Deployed `AUTH_MODE=dev`
    
- Silent fallback to a dev principal
    
- Hardcoded production tokens
    
- Secrets in Git
    
- Interactive authentication in unattended automation
    
- Device-code authentication in unattended automation
    
- Broad Graph permission without approval
    
- Tenant-wide consent without approval
    
- Silent app-registration changes
    
- CUI in the Commercial pattern
    
- Hardcoded Commercial-only endpoints throughout source
    
- Completion claims without live sign-in and authorization evidence
    

---

# 33. Continuous Assurance

Every applicable work Slice must verify:

- The correct tenant is configured.
    
- The configured authority is correct.
    
- The client ID matches the approved registration.
    
- Redirect URIs match.
    
- PKCE is active.
    
- No SPA client secret exists.
    
- API signature validation is active.
    
- Issuer validation is active.
    
- Audience validation is active.
    
- Expiration validation is active.
    
- Required scope validation is active.
    
- Group gating uses object IDs.
    
- Group-overage fallback works.
    
- Role enforcement is server-side.
    
- Dev mode cannot deploy.
    
- Authorization denials are logged.
    
- Tokens and secrets are not logged.
    
- The data boundary remains Commercial and unclassified.
    
- Documentation matches implementation.
    
- Live behavior matches the recorded configuration.
    

Material drift blocks completion.

---

# 34. Required Tests

Applicable tests include:

- PKCE configuration test
    
- Runtime auth-mode test
    
- Deployed-dev-mode rejection test
    
- Token-signature validation test
    
- Issuer-rejection test
    
- Audience-rejection test
    
- Expired-token rejection test
    
- Required-scope rejection test
    
- Missing-token rejection test
    
- Group-member authorization test
    
- Nongroup-member denial test
    
- Group-overage fallback test
    
- Role-gate test
    
- Roleless-member test
    
- First-login provisioning test
    
- Frontend logout test
    
- API authorization logging test
    
- Secret-scanning test
    
- Commercial endpoint configuration test
    
- Configuration-driven GCC High endpoint test where portability is required
    

Mocks may support development, but completion requires authorized live validation for the applicable tenant integration.

---

# 35. Live Validation

Before authentication is reported as working:

1. Confirm the app registration exists.
    
2. Confirm the enterprise application exists.
    
3. Confirm redirect URIs.
    
4. Confirm the API scope.
    
5. Confirm the groups claim.
    
6. Confirm the gating-group assignment.
    
7. Confirm the initial tester belongs to the group.
    
8. Complete an actual Entra sign-in.
    
9. Call the protected API with the token.
    
10. Confirm the API independently validates the token.
    
11. Confirm `/api/me` returns the correct user.
    
12. Confirm the resolved application role.
    
13. Confirm a nongroup member is denied.
    
14. Confirm denials are logged.
    
15. Confirm no token or secret appears in logs.
    
16. Record evidence.
    

Do not call the integration complete based only on configuration files or mocks.

---

# 36. Drift Detection

Detect drift involving:

- Tenant ID
    
- Client ID
    
- Authority
    
- Redirect URIs
    
- API scopes
    
- Group claims
    
- Gating-group object ID
    
- Enterprise application assignment
    
- Assignment-required setting
    
- Role mappings
    
- Token-validation settings
    
- Runtime authentication mode
    
- Graph permissions
    
- Administrator consent
    
- Data boundary
    
- Logging behavior
    

Unexplained material drift must block deployment or completion until reconciled.

---

# 37. Exception Process

A deviation requires:

1. A documented reason.
    
2. Architecture analysis.
    
3. Security analysis.
    
4. Compliance analysis.
    
5. Alternatives.
    
6. Risks.
    
7. Compensating controls.
    
8. Validation.
    
9. An ADR.
    
10. Explicit Human Project Authority approval through `DECISIONS.xlsx`.
    

The AI may recommend an exception.

The AI may not approve its own exception.

---

# 38. Repository Activation

When this standard applies, initialization or architecture work must:

1. Copy the approved central version to:
    

```text
docs/50-security/entra-sso-internal-apps.md
```

2. Record the central version and source.
    
3. Link it from:
    
    - `AUTHORITATIVE_ARCHITECTURE.md`
        
    - `PROJECT.md` when authentication is a requirement
        
    - The security `_index.md`
        
    - Relevant scoped AI rules
        
4. Create an applicable scoped rule under `.claude/rules/`.
    
5. Add required tests and validation expectations to architecture.
    
6. Add material registration questions to `DECISIONS.xlsx`.
    
7. Do not create the app registration automatically without administrative authorization.
    

Do not activate this standard in repositories where it does not apply.

---

# 39. Document Maintenance

Material changes to this standard require:

- Security review
    
- Architecture review
    
- Compliance-impact review
    
- Reference-implementation review
    
- Durable decision record
    
- Version update
    
- Propagation plan for applicable repositories
    

Local repositories must not silently alter the central standard.

A project-specific exception must be recorded locally through an ADR and must not be represented as a change to the Swif7Edge-wide standard.


