@echo off
setlocal

set SCRIPT_DIR=%~dp0
set PS1=%SCRIPT_DIR%test-rueckkehrpfad.ps1

if not exist "%PS1%" (
  echo FEHLER: Skript nicht gefunden: %PS1%
  pause
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"
set RC=%ERRORLEVEL%

echo.
if %RC%==0 (
  echo Testlauf erfolgreich abgeschlossen.
) else (
  echo Testlauf mit Fehler beendet. ExitCode=%RC%
)

pause
exit /b %RC%
