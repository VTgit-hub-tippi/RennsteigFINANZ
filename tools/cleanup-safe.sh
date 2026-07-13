#!/usr/bin/env bash
# cleanup-safe.sh — Sichere, automatisierte Cache-Bereinigung
# IT-Abteilung RennsteigFINANZ
#
# Nur app-sichere Ziele: keine Mediatheken, keine App-Datenbanken,
# keine Produktivdaten. Jeder Eingriff wird gemessen und geloggt.
#
# Verwendung: bash tools/cleanup-safe.sh
# Optionen:   --dry-run  (nur anzeigen, nichts loeschen)

set -euo pipefail

DRY_RUN=0
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=1

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOG_DIR="$ROOT_DIR/recovery"
mkdir -p "$LOG_DIR"

TS="$(date '+%Y%m%d-%H%M%S')"
LOG_FILE="$LOG_DIR/cleanup-${TS}.log"

log() { echo "$1" | tee -a "$LOG_FILE" >&2; }

free_kb() {
  df -k /System/Volumes/Data | tail -n 1 | awk '{print $4}'
}

kb_to_human() {
  local kb="$1"
  if (( kb >= 1048576 )); then
    printf "%.1f GiB" "$(echo "scale=1; $kb/1048576" | bc)"
  elif (( kb >= 1024 )); then
    printf "%d MiB" "$(( kb / 1024 ))"
  else
    printf "%d KiB" "$kb"
  fi
}

remove_if_exists() {
  local path="$1"
  local label="$2"
  if [[ -e "$path" ]]; then
    local size_kb
    size_kb="$(du -sk "$path" 2>/dev/null | awk '{print $1}' || echo 0)"
    local human
    human="$(kb_to_human "$size_kb")"
    if [[ $DRY_RUN -eq 1 ]]; then
      log "  [DRY-RUN] wuerde loeschen: $label ($human)"
    else
      rm -rf "$path"
      log "  [OK] geloescht: $label ($human)"
    fi
    echo "$size_kb"
  else
    log "  [SKIP] nicht vorhanden: $label"
    echo 0
  fi
}

# ─────────────────────────────────────────────
log "================================================================"
log "IT CLEANUP-SAFE — $TS"
[[ $DRY_RUN -eq 1 ]] && log "MODUS: DRY-RUN (kein echtes Loeschen)"
log "================================================================"
log ""

BEFORE_KB="$(free_kb)"
log "Freier Speicher VORHER: $(kb_to_human "$BEFORE_KB")"
log ""

log "--- Homebrew-Paketcache ---"
brew_kb=0
if command -v brew &>/dev/null; then
  if [[ $DRY_RUN -eq 1 ]]; then
    brew_est="$(brew cleanup --dry-run 2>&1 | grep 'would free' | grep -oE '[0-9]+(\.[0-9]+)? [KMG]B' | head -1 || echo 'unbekannt')"
    log "  [DRY-RUN] brew cleanup wuerde freigeben: $brew_est"
  else
    brew_out="$(brew cleanup --prune=all 2>&1 | grep 'freed approximately' || true)"
    log "  [OK] brew cleanup: $brew_out"
  fi
else
  log "  [SKIP] brew nicht installiert"
fi

log ""
log "--- App-Caches ---"

total_cache_kb=0
while IFS= read -r line; do
  total_cache_kb=$(( total_cache_kb + line ))
done < <(
  remove_if_exists "$HOME/Library/Caches/MediathekView"        "MediathekView-Cache"
  remove_if_exists "$HOME/Library/Caches/com.colliderli.iina"  "IINA-Videoplayer-Cache"
  remove_if_exists "$HOME/Library/Caches/pip"                  "pip-Paketcache"
  remove_if_exists "$HOME/Library/Caches/Cleanup At Startup"   "Cleanup-At-Startup (Waisendateien)"
)

log ""
log "--- System-Logs ---"
logs_kb=0
log "  [SKIP] System-Logs werden nicht pauschal geloescht; nur gezielte App-Logs manuell pruefen"

log ""
log "--- Pruefe: Homebrew tmp .cellar ---"
brew_tmp_kb=0
brew_tmp_kb="$(remove_if_exists "/usr/local/var/homebrew/tmp/.cellar" "Homebrew tmp cellar")"

# Kurz warten damit APFS Stats aktualisiert werden
sleep 3

AFTER_KB="$(free_kb)"
DELTA_KB=$(( AFTER_KB - BEFORE_KB ))

log ""
log "================================================================"
log "ERGEBNIS"
log "  Freier Speicher VORHER: $(kb_to_human "$BEFORE_KB")"
log "  Freier Speicher NACHHER: $(kb_to_human "$AFTER_KB")"
log "  Delta: +$(kb_to_human "$DELTA_KB") freigegeben"
log "  (APFS gibt weitere Bloecke beim naechsten TM-Snapshot-Ablauf frei)"
log "================================================================"
log ""
log "Protokoll gespeichert: $LOG_FILE"

# Hinweise fuer manuelle Schritte
log ""
log "MANUELLE SCHRITTE (nicht automatisierbar):"
log "  - Telegram: App oeffnen → Einstellungen → Lokaler Speicher → Cache leeren + Limit 500 MB setzen"
log "  - DEVONthink: App → Einstellungen → Backup-Retention pruefen"
log "  - adb: 'pgrep -f adb' pruefen; falls aktiv: Login-Items auf Verursacher pruefen"
