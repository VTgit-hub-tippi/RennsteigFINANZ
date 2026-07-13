#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUT_DIR="$ROOT_DIR/recovery"
mkdir -p "$OUT_DIR"

TS="$(date '+%Y-%m-%d %H:%M:%S')"
HOST="$(hostname)"
DATA_PATH="/System/Volumes/Data"

# Use kB blocks for stable parsing on macOS.
read -r _fs _kb_total _kb_used _kb_avail _cap _mount < <(df -k "$DATA_PATH" | tail -n 1)
free_gib=$(( _kb_avail / 1024 / 1024 ))
used_gib=$(( _kb_used / 1024 / 1024 ))

if (( free_gib < 5 )); then
  level="CRITICAL"
elif (( free_gib < 10 )); then
  level="WARNING"
else
  level="OK"
fi

proc_patterns='backupd|bird|cloudd|cloudphotod|photolibraryd|photoanalysisd|itunescloudd|Music|mds|mdworker|rsync|telegram|DEVONthink'
processes="$(pgrep -lf "$proc_patterns" || true)"

music_main_count="$(pgrep -f '/System/Applications/Music.app/Contents/MacOS/Music' | wc -l | tr -d ' ' || true)"
music_helper_count="$(pgrep -f 'itunescloudd|MusicCacheExtension|mediaanalysisd' | wc -l | tr -d ' ' || true)"
music_db_open_count="$( (lsof 2>/dev/null || true) | awk '/Music Library\.musiclibrary\/(Library\.musicdb|Application\.musicdb|Extras\.itdb)/ {print $NF}' | sort -u | wc -l | tr -d ' ' || true)"

devonthink_main_count="$(pgrep -f 'DEVONthink 3|DEVONthink' | wc -l | tr -d ' ' || true)"
devonthink_db_open_count="$( (lsof 2>/dev/null || true) | awk '/DEVONthink 3\/.*\.(dtMeta|dtMetaStore)|Inbox\.dtBase2/ {print $NF}' | sort -u | wc -l | tr -d ' ' || true)"

photos_cloud_count="$(pgrep -f 'cloudphotod|photolibraryd|photoanalysisd|cloudd|bird' | wc -l | tr -d ' ' || true)"

app_note_music='Music unauffaellig.'
if (( music_main_count > 1 )); then
  app_note_music="Music Hauptprozess mehrfach aktiv (${music_main_count}) -> auf Doppelstart pruefen."
elif (( music_main_count == 1 )); then
  app_note_music="Music aktiv; Bibliotheksdateien geoeffnet: ${music_db_open_count}; Helper-Prozesse: ${music_helper_count}."
fi

app_note_devonthink='DEVONthink nicht aktiv.'
if (( devonthink_main_count > 1 )); then
  app_note_devonthink="DEVONthink mehrfach aktiv (${devonthink_main_count}) -> auf Doppelstart pruefen."
elif (( devonthink_main_count == 1 )); then
  app_note_devonthink="DEVONthink aktiv; geoeffnete DB-Dateien: ${devonthink_db_open_count}."
fi

app_note_cloud='Fotos/iCloud Hintergrundlast unauffaellig.'
if (( photos_cloud_count > 0 )); then
  app_note_cloud="Fotos/iCloud-nahe Prozesse aktiv (${photos_cloud_count}) -> nur bei echtem Druck manuell priorisieren/pausieren."
fi

size_line() {
  local path="$1"
  if [[ -e "$path" ]]; then
    local kib
    kib="$(du -sk "$path" 2>/dev/null | awk '{print $1}' || true)"
    if [[ -n "$kib" ]]; then
      local gib=$(( kib / 1024 / 1024 ))
      printf "%s\t%s GiB\n" "$path" "$gib"
      return
    fi
  fi
  printf "%s\tn/a\n" "$path"
}

# Cache-Groesse in MB (lesbar, kein GiB-Runden)
cache_mb() {
  local path="$1"
  if [[ -e "$path" ]]; then
    local kib
    kib="$(du -sk "$path" 2>/dev/null | awk '{print $1}' || true)"
    [[ -n "$kib" ]] && echo "$(( kib / 1024 )) MB" || echo "n/a"
  else
    echo "nicht vorhanden"
  fi
}

# Delta freier Speicher zur letzten Messung
prev_free_gib=""
if [[ -f "$OUT_DIR/it-watch-latest.txt" ]]; then
  prev_free_gib="$(grep '^free_gib:' "$OUT_DIR/it-watch-latest.txt" | awk '{print $2}' || true)"
fi
if [[ -n "$prev_free_gib" && "$prev_free_gib" =~ ^[0-9]+$ ]]; then
  delta_gib=$(( free_gib - prev_free_gib ))
  if (( delta_gib > 0 )); then
    delta_str="+${delta_gib} GiB seit letztem Report"
  elif (( delta_gib < 0 )); then
    delta_str="${delta_gib} GiB seit letztem Report"
  else
    delta_str="unveraendert seit letztem Report"
  fi
else
  delta_str="kein Vorwert vorhanden"
fi

# adb-Erkennung
adb_info="nicht aktiv"
adb_pid="$(pgrep -f 'adb.*fork-server' || true)"
if [[ -n "$adb_pid" ]]; then
  adb_start="$(ps -p "$adb_pid" -o lstart= 2>/dev/null | tr -d ' ' || true)"
  adb_info="AKTIV PID ${adb_pid} (gestartet: ${adb_start}) — Herkunft pruefen"
fi

# NAS-Erreichbarkeit
nas_status="nicht geprueft"
if ping -c 1 -W 1 diskstation.fritz.box &>/dev/null 2>&1; then
  nas_ms="$(ping -c 1 diskstation.fritz.box 2>/dev/null | grep 'round-trip' | awk -F'/' '{print $5}' || true)"
  nas_status="ONLINE (${nas_ms}ms)"
  if (( ${nas_ms%.*} > 50 )) 2>/dev/null; then
    nas_status="ONLINE aber LANGSAM (${nas_ms}ms — WiFi? Ethernet pruefen)"
  fi
elif ping -c 1 -W 1 192.168.188.10 &>/dev/null 2>&1; then
  nas_status="ONLINE via IP"
else
  nas_status="OFFLINE — Shares nicht erreichbar"
fi

report_file="$OUT_DIR/it-watch-latest.txt"

{
  echo "IT-WATCH REPORT"
  echo "timestamp: $TS"
  echo "host: $HOST"
  echo "data_path: $DATA_PATH"
  echo "status: $level"
  echo "free_gib: $free_gib"
  echo "used_gib: $used_gib"
  echo "delta: $delta_str"
  echo

  echo "KEY_SIZES"
  size_line "$HOME/Music"
  size_line "$HOME/Pictures"
  size_line "$HOME/Library/Application Support/DEVONthink 3"
  size_line "$HOME/Library/Group Containers/6N38VWS5BX.ru.keepcoder.Telegram"
  echo

  echo "CACHE_SIZES"
  printf "  Homebrew:       %s\n" "$(cache_mb "$HOME/Library/Caches/Homebrew")"
  printf "  MediathekView:  %s\n" "$(cache_mb "$HOME/Library/Caches/MediathekView")"
  printf "  pip:            %s\n" "$(cache_mb "$HOME/Library/Caches/pip")"
  printf "  IINA:           %s\n" "$(cache_mb "$HOME/Library/Caches/com.colliderli.iina")"
  printf "  Music-Cache:    %s\n" "$(cache_mb "$HOME/Library/Caches/com.apple.Music")"
  printf "  Cleanup@Start:  %s\n" "$(cache_mb "$HOME/Library/Caches/Cleanup At Startup")"
  echo

  echo "INFRASTRUCTURE"
  echo "  NAS DiskStation: $nas_status"
  echo "  adb-Daemon:      $adb_info"
  echo
  echo "RUNNING_CANDIDATES"
  if [[ -n "$processes" ]]; then
    echo "$processes"
  else
    echo "none"
  fi
  echo
  echo "APP_HEALTH"
  echo "$app_note_music"
  echo "$app_note_devonthink"
  echo "$app_note_cloud"
  echo
  echo "PLAN"
  case "$level" in
    CRITICAL)
      echo "1) Projektlast reduzieren und keine grossen Dateioperationen starten."
      echo "2) Nur app-sichere Bereinigung durchfuehren (Caches/partielle Downloads)."
      echo "3) Vor jedem Eingriff Vorher/Nachher-Messung dokumentieren."
      echo "4) Bei Mehrfachstart extra App-Instanzen schliessen, nicht Bibliotheksdateien direkt anfassen."
      echo "5) Nicht prioritaere Medien-/Cloud-Apps nur manuell und reversibel beruhigen."
      echo "6) Freigabe fuer mittel-invasive App-Retention einholen (z. B. DEVONthink Backups)."
      ;;
    WARNING)
      echo "1) Kurzfristig app-sichere Bereinigung planen."
      echo "2) Sync- und Medien-Apps auf aktive Downloads pruefen."
      echo "3) Doppelstarts oder unnoetige offene Bibliotheken vermeiden."
      echo "4) Zielpuffer auf >= 10 GiB erhoehen."
      ;;
    OK)
      echo "1) Woechentlichen Wartungsplan fortsetzen."
      echo "2) Trend ueber mehrere Messpunkte beobachten."
      ;;
  esac
} > "$report_file"

cp "$report_file" "$OUT_DIR/it-watch-$(date '+%Y%m%d-%H%M%S').txt"

echo "report: $report_file"
cat "$report_file"
