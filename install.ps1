# Not the supported installer. Use bash ./install.sh on macOS. This file is kept so an old Windows note does not 404.
# Verifies ManagerOS and optionally links skills into the personal Copilot folder.
# Does not copy files. Does not touch any team repository.
# Usage:
#   powershell -ExecutionPolicy Bypass -File .\install.ps1
#   powershell -ExecutionPolicy Bypass -File .\install.ps1 -Link

param(
  [switch]$Link
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$skills = Join-Path $root "skills"
$notes = Join-Path $root "notes"
$expected = @(
  "pa-context",
  "pa-meetings",
  "pa-direct-reports",
  "pa-manager",
  "pa-stakeholders",
  "pa-sources",
  "pa-promotion-case",
  "pa-performance-concern",
  "pa-portfolio",
  "pa-delivery",
  "pa-scrum",
  "pa-users",
  "pa-coaching-span",
  "pa-dates",
  "pa-integrity",
  "pa-jira"
)

Write-Host "ManagerOS root: $root"

foreach ($name in $expected) {
  $skillFile = Join-Path $skills "$name\SKILL.md"
  if (-not (Test-Path $skillFile)) {
    throw "Missing $skillFile"
  }
  $head = Get-Content $skillFile -TotalCount 6
  if (-not ($head -match "^name: $name$")) {
    throw "$name SKILL.md name does not match its folder"
  }
  Write-Host "ok  $name"
}

if (-not (Test-Path (Join-Path $notes "INDEX.md"))) {
  throw "Missing notes\INDEX.md"
}

Write-Host ""
Write-Host "Dedicated window: open this folder by itself. Do not add it to a team-repo workspace."
Write-Host "User setting, only if you want these skills visible outside this folder:"
Write-Host '  "chat.agentSkillsLocations": { "~/ManagerOS/skills": true }'
Write-Host "Use forward slashes. Change the path if this folder is not in your user profile."

if (-not $Link) {
  Write-Host ""
  Write-Host "No links created. Re-run with -Link if Visual Studio or Copilot CLI only scans ~/.copilot/skills."
  exit 0
}

$dest = Join-Path $env:USERPROFILE ".copilot\skills"
New-Item -ItemType Directory -Force -Path $dest | Out-Null

foreach ($name in $expected) {
  $source = Join-Path $skills $name
  $linkPath = Join-Path $dest $name
  if (Test-Path $linkPath) {
    Write-Host "skip  $linkPath already exists"
    continue
  }
  cmd /c mklink /J "$linkPath" "$source" | Out-Null
  if (-not (Test-Path $linkPath)) {
    throw "Could not create junction for $name. Try an elevated prompt, or copy is not recommended — fix the junction instead."
  }
  Write-Host "link  $linkPath -> $source"
}

Write-Host ""
Write-Host "Junctions point at this folder. Edit skills here, not in .copilot\skills."
