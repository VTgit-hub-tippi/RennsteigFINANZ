#!/usr/bin/env bash
set -euo pipefail

# resolve-backup-target.sh
# Zweck: Robustes Ziel fuer Backups aufloesen, ohne feste Abhaengigkeit von /Volumes/Untitled
# Ausgabe: Absoluter Zielpfad (eine Zeile)

prefer_if_writable() {
  local p="$1"
  [[ -n "$p" && -d "$p" && -w "$p" ]]
}

candidates=()

# 1) Explizite Vorgabe hat Vorrang
if [[ -n "${RF_BACKUP_BASE:-}" ]]; then
  candidates+=("$RF_BACKUP_BASE")
fi

# 2) Typische externe Ziele (in sinnvoller Reihenfolge)
candidates+=(
  "/Volumes/Untitled/CloudStation/Documents"
  "/Volumes/MRT/backup"
  "/Volumes/MRT/Dokumente"
  "/Volumes/trekstor"
)

# 3) Lokaler Fallback (immer erreichbar, wenn extern nicht verfuegbar)
candidates+=(
  "$HOME/CloudStation/Documents"
  "$HOME/dev/projects/RennsteigFINANZ/backup"
)

for c in "${candidates[@]}"; do
  if prefer_if_writable "$c"; then
    echo "$c"
    exit 0
  fi
done

echo "Kein beschreibbares Backup-Ziel gefunden." >&2
echo "Setzen Sie RF_BACKUP_BASE auf ein gueltiges Zielverzeichnis." >&2
exit 1
