#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

printf "\n=== RennsteigFINANZ Portable Starter (macOS) ===\n"
printf "Repo: %s\n" "$REPO_DIR"

if [[ ! -f "$REPO_DIR/CLAUDE.md" ]]; then
  echo "FEHLER: CLAUDE.md nicht gefunden. Start aus Projektstruktur nicht moeglich." >&2
  exit 1
fi

if command -v git >/dev/null 2>&1; then
  echo "Git verfuegbar: $(git --version)"
else
  echo "WARNUNG: Git nicht gefunden. Reentry ueber GitHub spaeter nachholen."
fi

BACKUP_TARGET=""
if [[ -f "$REPO_DIR/tools/resolve-backup-target.sh" ]]; then
  if BACKUP_TARGET="$(bash "$REPO_DIR/tools/resolve-backup-target.sh" 2>/dev/null)"; then
    echo "Backup-Ziel erkannt: $BACKUP_TARGET"
  else
    echo "WARNUNG: Kein beschreibbares Backup-Ziel erkannt."
  fi
else
  echo "WARNUNG: tools/resolve-backup-target.sh nicht gefunden."
fi

echo ""
echo "Pflichtdateien fuer Reentry:"
echo "- $REPO_DIR/CLAUDE.md"
echo "- $REPO_DIR/STATUS.md"
echo "- $REPO_DIR/NEXT-ACTION.md"
echo "- $REPO_DIR/docs/context-snapshot.md"
echo ""
echo "Naechste Schritte:"
echo "1) Pflichtdateien lesen"
echo "2) Genau eine P0-Aktion aus NEXT-ACTION starten"
echo "3) Nach Netzverfuegbarkeit commit/push/pull ueber GitHub-Kette"

open "$REPO_DIR" || true
open "$REPO_DIR/CLAUDE.md" || true
open "$REPO_DIR/STATUS.md" || true
open "$REPO_DIR/NEXT-ACTION.md" || true
open "$REPO_DIR/docs/context-snapshot.md" || true

printf "\nPortable Starter abgeschlossen.\n"
