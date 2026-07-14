#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

MRT_PROGRAMM_DIR="/Volumes/MRT/Vermittler/Volker Tippmann/Finanzplanung/Programm"
TEST_DIR="$MRT_PROGRAMM_DIR/Testumgebung VScode Programm"

SOURCE_XLS="$MRT_PROGRAMM_DIR/Programm Finanzplanung 5.0.xls"
TEST_XLS="$TEST_DIR/Programm Finanzplanung 5.0_TEST.xls"
PREFIX_XLS="$TEST_DIR/Programm Finanzplanung 5.0_TEST_preFix.xls"

CHECKLIST_SRC="$ROOT_DIR/docs/WINDOWS-TESTUMGEBUNG-CHECKLISTE.md"
NEXT_ACTION_SRC="$ROOT_DIR/NEXT-ACTION.md"
WINDOWS_SYNC_SRC_DIR="$ROOT_DIR/tools/windows-sync"

CHECKLIST_DST="$TEST_DIR/WINDOWS-TESTUMGEBUNG-CHECKLISTE.md"
NEXT_ACTION_DST="$TEST_DIR/NEXT-ACTION.md"
PROMPT_DST="$TEST_DIR/COPILOT-STARTPROMPT.txt"
STATUS_DST="$TEST_DIR/TESTUMGEBUNG-STATUS.txt"
LAUNCHER_DST="$TEST_DIR/START-TESTUMGEBUNG.command"
WINDOWS_SYNC_DST_DIR="$TEST_DIR/Windows-Sync"

CUSTOMER_SOURCE_BASE="/Volumes/MRT/RF intern/Firma/Organisation/Leitung/Bestandsverwaltung/Kunden"
CUSTOMER_TARGET_BASE="$TEST_DIR/Kundendaten_AUSWAHL"

CUSTOMER_NAME="${1:-}"

die() {
  echo "FEHLER: $1" >&2
  exit 1
}

need_readable_file() {
  local file="$1"
  [[ -f "$file" && -r "$file" ]] || die "Datei nicht lesbar: $file"
}

need_writable_dir() {
  local dir="$1"
  [[ -d "$dir" && -w "$dir" ]] || die "Ordner nicht beschreibbar: $dir"
}

echo "[1/6] Pruefe Quellpfade ..."
need_readable_file "$SOURCE_XLS"
need_readable_file "$CHECKLIST_SRC"
need_readable_file "$NEXT_ACTION_SRC"
[[ -d "$WINDOWS_SYNC_SRC_DIR" ]] || die "Windows-Sync-Ordner fehlt: $WINDOWS_SYNC_SRC_DIR"

echo "[2/6] Bereite Testordner vor ..."
mkdir -p "$TEST_DIR" "$CUSTOMER_TARGET_BASE"
mkdir -p "$WINDOWS_SYNC_DST_DIR"
need_writable_dir "$TEST_DIR"

echo "[3/6] Kopiere Programmdatei und PreFix-Sicherung ..."
cp -f "$SOURCE_XLS" "$TEST_XLS"
cp -f "$TEST_XLS" "$PREFIX_XLS"

echo "[4/6] Kopiere Arbeitsunterlagen ..."
cp -f "$CHECKLIST_SRC" "$CHECKLIST_DST"
cp -f "$NEXT_ACTION_SRC" "$NEXT_ACTION_DST"
cp -f "$WINDOWS_SYNC_SRC_DIR"/* "$WINDOWS_SYNC_DST_DIR/"

WINDOWS_REPO_HINT="$TEST_DIR/RennsteigFINANZ-Windows-Repo"

cat > "$PROMPT_DST" <<'PROMPT'
Lies WINDOWS-TESTUMGEBUNG-CHECKLISTE.md und NEXT-ACTION.md.
Arbeite nur P0-B ab, ohne Themenwechsel.
Vor jedem Zusammenfuehren von Kundendaten immer Rueckfrage an den Betriebsleiter.
Ziel: frmFinanzen-Rueckkehr ohne Debugger-Stopp.
PROMPT

if [[ -n "$CUSTOMER_NAME" ]]; then
  echo "[5/6] Kopiere ausgewaehlten Kundenordner ..."
  SRC_CUSTOMER="$CUSTOMER_SOURCE_BASE/$CUSTOMER_NAME"
  [[ -d "$SRC_CUSTOMER" ]] || die "Kundenordner nicht gefunden: $SRC_CUSTOMER"
  DEST_CUSTOMER="$CUSTOMER_TARGET_BASE/$CUSTOMER_NAME"
  rm -rf "$DEST_CUSTOMER"
  cp -a "$SRC_CUSTOMER" "$DEST_CUSTOMER"
  CUSTOMER_INFO="Kunde kopiert: $CUSTOMER_NAME"
else
  CUSTOMER_INFO="Kein Kundenordner kopiert (optional: Skript mit Kundenname als 1. Parameter starten)."
fi

TEST_SIZE="$(stat -f%z "$TEST_XLS" 2>/dev/null || echo "unbekannt")"
PREFIX_SIZE="$(stat -f%z "$PREFIX_XLS" 2>/dev/null || echo "unbekannt")"

cat > "$STATUS_DST" <<EOF
TESTUMGEBUNG STATUS
Datum: $(date '+%Y-%m-%d %H:%M:%S')

Programmquelle: $SOURCE_XLS
Testdatei: $TEST_XLS
PreFix-Datei: $PREFIX_XLS
Groesse Testdatei (Bytes): $TEST_SIZE
Groesse PreFix-Datei (Bytes): $PREFIX_SIZE

$CUSTOMER_INFO

Naechster Schritt:
1) Testdatei in Excel oeffnen
2) Alt+F11 -> frmFinanzen -> Rueckkehr-Handler fixen
3) Ende-zu-Ende-Liveablauf testen

Windows Sync (1-Klick):
- START-Stand-holen.cmd
- START-Stand-zurueckschreiben.cmd

Hinweis fuer Windows:
- Die CMD-Dateien erwarten das Git-Repository unter:
  $WINDOWS_REPO_HINT
- Falls Ihr Windows-Repo anders liegt, in PowerShell aufrufen mit:
  sync-stand-holen.ps1 -RepoPath "<Pfad>"
  sync-stand-zurueckschreiben.ps1 -RepoPath "<Pfad>"
EOF

cat > "$LAUNCHER_DST" <<EOF
#!/usr/bin/env bash
set -euo pipefail

TEST_DIR="$TEST_DIR"

open "$TEST_DIR"
open "$PROMPT_DST"
open "$CHECKLIST_DST"
open "$NEXT_ACTION_DST"
open "$STATUS_DST"
open "$TEST_XLS"
EOF
chmod +x "$LAUNCHER_DST"

echo "[6/6] Fertig."
echo "Testumgebung bereit unter: $TEST_DIR"
echo "Start per Doppelklick: $LAUNCHER_DST"
