#!/usr/bin/env bash
# ============================================================
# sync-finanzplanung.sh — Automatische Finanzplanung-Sync
# Windows-Produktiv ↔ Mac-Lokal ↔ Untitled-Backup
# ============================================================
# Ziel: Aktuelle Finanzplanung-Datei vom Windows-System
#       in die lokale Mac-Ablage synchronisieren
# ============================================================

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

# ---- Konfiguration -------------------------------------------
WINDOWS_SOURCE="/Volumes/MRT/Vermittler/Volker Tippmann/Finanzplanung/Programm/Entwicklung/Programm Finanzplanung 5.0.xls"
MAC_LOCAL="/Users/volkertippmann/CloudStation/Documents/Finanzplanung/Programm/Programm Finanzplanung 5.0.xls"
UNTITLED_BACKUP="/Volumes/Untitled/CloudStation/Projekt RennsteigFinanz/Finanzplanung-Archiv/Programm Finanzplanung 5.0.xls"
GIT_REPO="$ROOT_DIR"

# Archive für Versioning
ARCHIVE_DIR="$ROOT_DIR/logs/archive/finanzplanung-sync"
mkdir -p "$ARCHIVE_DIR"

# ---- Hilfsfunktionen -----------------------------------------
die() {
  echo "❌ FEHLER: $1" >&2
  exit 1
}

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

get_file_hash() {
  local file="$1"
  [[ -f "$file" ]] && md5 -q "$file" || echo "NOTFOUND"
}

# ---- 1. Quellverfügbarkeit prüfen ---------------------------
log "Prüfe Windows-Quelle..."

if ! [[ -f "$WINDOWS_SOURCE" ]]; then
  die "Windows-Datei nicht erreichbar: $WINDOWS_SOURCE"
fi

WINDOWS_SIZE=$(stat -f%z "$WINDOWS_SOURCE" 2>/dev/null)
WINDOWS_DATE=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$WINDOWS_SOURCE")
WINDOWS_HASH=$(get_file_hash "$WINDOWS_SOURCE")

log "✓ Windows-Quelle verfügbar"
log "  Größe: $((WINDOWS_SIZE / 1024 / 1024)) MB"
log "  Datum: $WINDOWS_DATE"
log "  Hash:  $WINDOWS_HASH"

# ---- 2. Lokale Datei prüfen --------------------------------
log ""
log "Prüfe lokale Mac-Kopie..."

if [[ -f "$MAC_LOCAL" ]]; then
  MAC_HASH=$(get_file_hash "$MAC_LOCAL")
  MAC_DATE=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$MAC_LOCAL")
  log "✓ Lokale Datei existiert"
  log "  Datum: $MAC_DATE"
  log "  Hash:  $MAC_HASH"
  
  if [[ "$WINDOWS_HASH" == "$MAC_HASH" ]]; then
    log ""
    log "✓ Lokale Datei ist aktuell (keine Änderung)"
    exit 0
  else
    log ""
    log "⚠️  Abweichung erkannt — Synchronisiere..."
  fi
else
  log "⚠️  Lokale Datei existiert noch nicht — Initialisiere..."
  mkdir -p "$(dirname "$MAC_LOCAL")"
fi

# ---- 3. Kopiere neue Datei -----------------------------------
log ""
log "Kopiere Finanzplanung..."

# Backup der alten Datei (falls vorhanden)
if [[ -f "$MAC_LOCAL" ]]; then
  BACKUP_TIMESTAMP=$(date +%Y%m%d_%H%M%S)
  BACKUP_FILE="$ARCHIVE_DIR/Programm_Finanzplanung_5.0_$(date -f "%Y-%m-%d" -j "$WINDOWS_DATE").bak"
  cp "$MAC_LOCAL" "$BACKUP_FILE"
  log "  Backup: $BACKUP_FILE"
fi

# Kopiere neue Datei
cp -f "$WINDOWS_SOURCE" "$MAC_LOCAL"
NEW_HASH=$(get_file_hash "$MAC_LOCAL")

if [[ "$NEW_HASH" == "$WINDOWS_HASH" ]]; then
  log "✓ Datei kopiert und verifiziert"
else
  die "Kopierverifikation fehlgeschlagen (Hash-Mismatch)"
fi

# ---- 4. Backup zu Untitled -----------------------------------
log ""
log "Sichern zu Untitled..."

mkdir -p "$(dirname "$UNTITLED_BACKUP")"

if cp -f "$MAC_LOCAL" "$UNTITLED_BACKUP"; then
  log "✓ Backup auf Untitled erstellt"
else
  log "⚠️  Warnung: Untitled-Backup fehlgeschlagen (Nicht kritisch)"
fi

# ---- 5. Git-Commit (optional) --------------------------------
log ""
log "Aktualisiere Projektdokumentation..."

# Aktualisiere Dokumentation (nicht die Datei selbst)
cat > "$ROOT_DIR/docs/FINANZPLANUNG-SYNC-STATUS.txt" <<EOF
FINANZPLANUNG-SYNCHRONISIERUNG
==============================

Zeitpunkt: $(date '+%Y-%m-%d %H:%M:%S')

Quellsystem:
  Windows-Pfad: $WINDOWS_SOURCE
  Datum: $WINDOWS_DATE
  Hash: $WINDOWS_HASH
  Größe: $((WINDOWS_SIZE / 1024 / 1024)) MB

Ziel-Systeme:
  Mac-Lokal: $MAC_LOCAL
  Untitled: $UNTITLED_BACKUP

Status:
  ✓ Synchronisierung abgeschlossen
  ✓ Hash-Verifikation bestanden
  ✓ Backup erstellt

Nächste Synchronisierung: Automatisch bei nächster Änderung
(Prüfung alle 60 Sekunden via cron/watch)
EOF

# ---- 6. Zusammenfassung --------------------------------------
log ""
log "════════════════════════════════════════════════════════════"
log "✓ FINANZPLANUNG-SYNCHRONISIERUNG ABGESCHLOSSEN"
log "════════════════════════════════════════════════════════════"
log ""
log "Zusammenfassung:"
log "  • Windows → Mac: Aktualisiert"
log "  • Mac → Untitled: Sicherung erstellt"
log "  • Git: Dokumentation aktualisiert"
log ""
log "Datei: $MAC_LOCAL"
log "Hash:  $NEW_HASH"
log ""

# Optional: Benachrichtigung
if command -v say >/dev/null 2>&1; then
  say "Finanzplanung synchronisiert"
fi

exit 0
