Param(
    [string]$WorkbookPath = "",
    [string]$Kunde = "",
    [string]$FixStand = "",
    [string]$LogDir = ".\Testprotokolle"
)

$ErrorActionPreference = "Stop"

function Ask-YesNo {
    Param([string]$Prompt)
    while ($true) {
        $answer = Read-Host "$Prompt (j/n)"
        if ($answer -match '^(?i)j$') { return $true }
        if ($answer -match '^(?i)n$') { return $false }
        Write-Host "Bitte nur j oder n eingeben."
    }
}

function Ensure-Directory {
    Param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

Ensure-Directory -Path $LogDir

$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
$snapshotPath = Join-Path $LogDir "Snapshot_Rueckkehrpfad_$timestamp.txt"
$matrixPath = Join-Path $LogDir "UI_VBA_Fehler_Ursachen_Matrix.csv"

if ([string]::IsNullOrWhiteSpace($WorkbookPath)) {
    $WorkbookPath = Read-Host "Pfad zur Testdatei (z. B. Finanzen_TEST.xls)"
}
if ([string]::IsNullOrWhiteSpace($Kunde)) {
    $Kunde = Read-Host "Kunde/Haushalt"
}
if ([string]::IsNullOrWhiteSpace($FixStand)) {
    $FixStand = Read-Host "Fix-Stand (z. B. preFix, postFix1)"
}

$steps = @(
    "Start ueber Verknuepfung",
    "Laufwerk/Pfad geprueft",
    "Haushalt gesucht/ausgewaehlt",
    "Stammdaten bearbeitet",
    "Finanzdaten bearbeitet",
    "Rueckkehr aus Finanzdaten ausgeloest",
    "Vertragsdaten geoeffnet"
)

$stepResults = @()
Write-Host ""
Write-Host "== Standardisierter Rueckkehrpfad-Test =="
Write-Host "Bitte jeden Schritt direkt im Programm ausfuehren und danach hier bestaetigen."

foreach ($step in $steps) {
    $ok = Ask-YesNo -Prompt "Schritt erfolgreich: $step"
    $note = Read-Host "Kurznotiz zu '$step' (optional)"
    $stepResults += [PSCustomObject]@{
        Step = $step
        Passed = $ok
        Note = $note
    }
}

$overallPassed = ($stepResults | Where-Object { -not $_.Passed }).Count -eq 0
$symptom = Read-Host "Symptom/Fehlerbild (kurz)"
$expected = Read-Host "Erwartetes Verhalten (kurz)"
$actual = Read-Host "Tatsaechliches Verhalten (kurz)"
$severity = Read-Host "Schweregrad (Blocker/Kritisch/Laestig/Kosmetik)"
$formModule = Read-Host "Form/Modul (z. B. frmFinanzen)"
$procedure = Read-Host "Prozedur/Event"
$rootCause = Read-Host "Bestaetigte Ursache (kurz)"
$fixShort = Read-Host "Fix-Kurzbeschreibung"
$residualRisk = Read-Host "Rest-Risiko/OFFEN"

$snapshotLines = @()
$snapshotLines += "ABLAUF- UND FEHLERPRUEFUNG - SNAPSHOT"
$snapshotLines += "Datum/Uhrzeit: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$snapshotLines += "Kunde: $Kunde"
$snapshotLines += "Programmdatei: $WorkbookPath"
$snapshotLines += "Fix-Stand: $FixStand"
$snapshotLines += ""
$snapshotLines += "FESTER BEDIENABLAUF"
foreach ($entry in $stepResults) {
    $flag = if ($entry.Passed) { "OK" } else { "FEHLER" }
    $snapshotLines += "- [$flag] $($entry.Step)"
    if (-not [string]::IsNullOrWhiteSpace($entry.Note)) {
        $snapshotLines += "  Notiz: $($entry.Note)"
    }
}
$snapshotLines += ""
$snapshotLines += "Erwartet: $expected"
$snapshotLines += "Tatsaechlich: $actual"
$snapshotLines += "Symptom: $symptom"
$snapshotLines += "Schweregrad: $severity"
$snapshotLines += "Form/Modul: $formModule"
$snapshotLines += "Prozedur/Event: $procedure"
$snapshotLines += "Bestaetigte Ursache: $rootCause"
$snapshotLines += "Fix: $fixShort"
$snapshotLines += "Retest bestanden: " + ($(if ($overallPassed) { "Ja" } else { "Nein" }))
$snapshotLines += "Rest-Risiko/OFFEN: $residualRisk"

Set-Content -Path $snapshotPath -Value $snapshotLines -Encoding UTF8

if (-not (Test-Path -LiteralPath $matrixPath)) {
    "MatrixID,DatumZeit,Kunde,Programmdatei,FixStand,UIPfadSchritt,Symptom,Erwartet,Tatsaechlich,Schweregrad,Reproduzierbar,FormModul,ProzedurEvent,VermuteteUrsache,BestaetigteUrsache,FixKurz,RetestBestanden,RestRisiko,Status" |
        Set-Content -Path $matrixPath -Encoding UTF8
}

$matrixId = "M-" + (Get-Date -Format "yyyyMMddHHmmss")
$stepFailed = ($stepResults | Where-Object { -not $_.Passed } | Select-Object -First 1)
$uiStep = if ($null -eq $stepFailed) { "Rueckkehrpfad vollstaendig bestanden" } else { $stepFailed.Step }
$repro = if ($overallPassed) { "Nein" } else { "Ja" }
$retest = if ($overallPassed) { "Ja" } else { "Nein" }
$status = if ($overallPassed) { "Fuer weitere Tests freigegeben" } else { "Nicht freigegeben" }

$row = @(
    $matrixId,
    (Get-Date -Format "yyyy-MM-dd HH:mm:ss"),
    $Kunde,
    $WorkbookPath,
    $FixStand,
    $uiStep,
    $symptom,
    $expected,
    $actual,
    $severity,
    $repro,
    $formModule,
    $procedure,
    "",
    $rootCause,
    $fixShort,
    $retest,
    $residualRisk,
    $status
) | ForEach-Object { '"' + ($_ -replace '"', '""') + '"' }

Add-Content -Path $matrixPath -Value ($row -join ",") -Encoding UTF8

Write-Host ""
Write-Host "Fertig."
Write-Host "Snapshot: $snapshotPath"
Write-Host "Matrix:   $matrixPath"
Write-Host "Retest bestanden: " + ($(if ($overallPassed) { "Ja" } else { "Nein" }))
