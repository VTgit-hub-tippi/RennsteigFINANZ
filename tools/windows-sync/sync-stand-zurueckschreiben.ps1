Param(
    [string]$RepoPath = "",
    [string]$CommitMessage = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($RepoPath)) {
    $RepoPath = Split-Path -Parent $PSScriptRoot
    $RepoPath = Split-Path -Parent $RepoPath
}

Write-Host "== Stand zurueckschreiben =="
Write-Host "Repo: $RepoPath"

if (-not (Test-Path $RepoPath)) {
    throw "Repository-Pfad nicht gefunden: $RepoPath"
}

Set-Location $RepoPath

git rev-parse --is-inside-work-tree *> $null
if ($LASTEXITCODE -ne 0) {
    throw "Kein Git-Repository: $RepoPath"
}

$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "Keine Aenderungen vorhanden. Nichts zu committen."
    exit 0
}

if ([string]::IsNullOrWhiteSpace($CommitMessage)) {
    $defaultMsg = "Windows-Session " + (Get-Date -Format "yyyy-MM-dd HH:mm")
    $inputMsg = Read-Host "Commit-Message eingeben (Enter fuer '$defaultMsg')"
    if ([string]::IsNullOrWhiteSpace($inputMsg)) {
        $CommitMessage = $defaultMsg
    } else {
        $CommitMessage = $inputMsg
    }
}

git add -A
git commit -m "$CommitMessage"
git push
git status --short --branch

Write-Host "Fertig: Aenderungen sind gepusht."
