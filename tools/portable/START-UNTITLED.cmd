@echo off
setlocal

set SCRIPT_DIR=%~dp0
for %%I in ("%SCRIPT_DIR%..\..") do set REPO_DIR=%%~fI

echo.
echo === RennsteigFINANZ Portable Starter (Windows) ===
echo Repo: %REPO_DIR%

if not exist "%REPO_DIR%\CLAUDE.md" (
  echo FEHLER: CLAUDE.md nicht gefunden. Start aus Projektstruktur nicht moeglich.
  exit /b 1
)

where git >nul 2>nul
if %errorlevel%==0 (
  for /f "delims=" %%G in ('git --version') do echo Git verfuegbar: %%G
) else (
  echo WARNUNG: Git nicht gefunden. Reentry ueber GitHub spaeter nachholen.
)

echo.
echo Pflichtdateien fuer Reentry:
echo - %REPO_DIR%\CLAUDE.md
echo - %REPO_DIR%\STATUS.md
echo - %REPO_DIR%\NEXT-ACTION.md
echo - %REPO_DIR%\docs\context-snapshot.md
echo.
echo Naechste Schritte:
echo 1^) Pflichtdateien lesen
echo 2^) Genau eine P0-Aktion aus NEXT-ACTION starten
echo 3^) Nach Netzverfuegbarkeit commit/push/pull ueber GitHub-Kette

echo.
echo Hinweis: Backup-Zielpruefung auf Windows manuell gemaess docs\DREISYSTEM-BETRIEBSMODELL.md durchfuehren.

start "" "%REPO_DIR%"
start "" "%REPO_DIR%\CLAUDE.md"
start "" "%REPO_DIR%\STATUS.md"
start "" "%REPO_DIR%\NEXT-ACTION.md"
start "" "%REPO_DIR%\docs\context-snapshot.md"

echo.
echo Portable Starter abgeschlossen.
endlocal
