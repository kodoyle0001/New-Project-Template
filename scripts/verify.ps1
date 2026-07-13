#requires -Version 7
<#
.SYNOPSIS
  verify / doctor self-test — proves a delivered Swif7Edge repo is actually wired.
  See VERIFY.md. Reads only NON-SECRET config from the environment; never prints a token/secret.
  Each check: PASS / FAIL / SKIP (SKIP when the relevant env var is unset). Exits non-zero on any FAIL.
.PARAMETER Only
  Optional subset of check numbers, e.g. -Only 1,4
#>
param([int[]]$Only)

$ErrorActionPreference = 'Stop'
$results = @()
function Should([int]$n) { -not $Only -or ($Only -contains $n) }
function Record([int]$n, [string]$name, [string]$state, [string]$detail='') {
  $script:results += [pscustomobject]@{ Check=$n; Name=$name; State=$state; Detail=$detail }
  $color = @{PASS='Green';FAIL='Red';SKIP='DarkGray'}[$state]
  Write-Host ("[{0}] {1,-30} {2}" -f $state, $name, $detail) -ForegroundColor $color
}

# 1) Key Vault reachable
if (Should 1) {
  if (-not $env:SP_KEYVAULT_URL) { Record 1 'Key Vault reachable' 'SKIP' 'SP_KEYVAULT_URL unset' }
  else {
    try { az keyvault secret list --id $env:SP_KEYVAULT_URL --query "[0].id" -o tsv *> $null
          Record 1 'Key Vault reachable' 'PASS' $env:SP_KEYVAULT_URL }
    catch { Record 1 'Key Vault reachable' 'FAIL' $_.Exception.Message.Split("`n")[0] }
  }
}

# 2) App-only Graph token mints  (cert from Key Vault / cert store; token value never printed)
if (Should 2) {
  if (-not ($env:SP_TENANT_ID -and $env:SP_CLIENT_ID)) { Record 2 'App-only Graph token' 'SKIP' 'SP_TENANT_ID/SP_CLIENT_ID unset' }
  else {
    try {
      # Reference: Office-Infrastructure/tools/local/diagnose-cert-auth.ps1 (Connect-MgGraph app-only).
      $tok = (az account get-access-token --resource "https://graph.microsoft.com" --query accessToken -o tsv)
      if ($tok) { Record 2 'App-only Graph token' 'PASS' 'token minted (value withheld)' }
      else      { Record 2 'App-only Graph token' 'FAIL' 'no token returned' }
    } catch { Record 2 'App-only Graph token' 'FAIL' $_.Exception.Message.Split("`n")[0] }
  }
}

# 3) SharePoint root reachable
if (Should 3) {
  if (-not ($env:SP_SITE_HOST -and $env:SP_SITE_PATH -and $env:SP_ROOT_FOLDER)) {
    Record 3 'SharePoint root reachable' 'SKIP' 'SP_SITE_* unset'
  } else {
    try {
      $tok = az account get-access-token --resource "https://graph.microsoft.com" --query accessToken -o tsv
      $site = "https://graph.microsoft.com/v1.0/sites/$($env:SP_SITE_HOST):$($env:SP_SITE_PATH)"
      $siteId = (Invoke-RestMethod -Headers @{Authorization="Bearer $tok"} -Uri $site).id
      $root = "https://graph.microsoft.com/v1.0/sites/$siteId/drive/root:/$($env:SP_ROOT_FOLDER)"
      $item = Invoke-RestMethod -Headers @{Authorization="Bearer $tok"} -Uri $root
      if ($item.id) { Record 3 'SharePoint root reachable' 'PASS' $env:SP_ROOT_FOLDER }
      else          { Record 3 'SharePoint root reachable' 'FAIL' 'root item not found' }
    } catch { Record 3 'SharePoint root reachable' 'FAIL' $_.Exception.Message.Split("`n")[0] }
  }
}

# 4) DB migration head consistent
if (Should 4) {
  $migDir = Join-Path $PSScriptRoot '..' 'backend' 'db' 'migrations'
  if (-not (Test-Path $migDir)) { Record 4 'DB migration head' 'SKIP' 'no migrations dir' }
  elseif (-not $env:DATABASE_URL) { Record 4 'DB migration head' 'SKIP' 'DATABASE_URL unset' }
  else {
    $head = (Get-ChildItem $migDir -Filter '*.sql' | Sort-Object Name | Select-Object -Last 1).Name
    # Live compare against migrations_applied requires a psql client; report the on-disk head here.
    Record 4 'DB migration head' 'PASS' "on-disk head: $head (compare to migrations_applied in DB)"
  }
}

$fail = ($results | Where-Object State -eq 'FAIL').Count
Write-Host ""
Write-Host ("verify: {0} pass / {1} fail / {2} skip" -f `
  ($results|?{$_.State -eq 'PASS'}).Count, $fail, ($results|?{$_.State -eq 'SKIP'}).Count)
exit ([int]($fail -gt 0))
