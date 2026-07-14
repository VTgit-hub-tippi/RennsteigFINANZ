Param(
    [string]$RepoPath = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($RepoPath)) {
    $RepoPath = Split-Path -Parent $PSScriptRoot
    $RepoPath = Split-Path -Parent $RepoPath
}

Write-Host "== Stand holen =="
Write-Host "Repo: $RepoPath"

if (-not (Test-Path $RepoPath)) {
    throw "Repository-Pfad nicht gefunden: $RepoPath"
}

Set-Location $RepoPath

git rev-parse --is-inside-work-tree *> $null
if ($LASTEXITCODE -ne 0) {
    throw "Kein Git-Repository: $RepoPath"
}

git fetch --all --prune
git pull --ff-only
git status --short --branch

Write-Host "Fertig: Stand ist aktualisiert."
