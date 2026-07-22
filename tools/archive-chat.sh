#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

TRANSCRIPT_PATH="${1:-}"
TOPIC_RAW="${2:-Copilot-Session}"

sanitize_topic() {
  local s="$1"
  s="${s// /-}"
  s="${s//\//-}"
  s="${s//:/-}"
  s="${s//_/\-}"
  printf '%s' "$s" | tr -cd '[:alnum:]-'
}

find_latest_transcript() {
  local base="$HOME/Library/Application Support/Code/User/workspaceStorage"
  find "$base" -type f -path "*/GitHub.copilot-chat/transcripts/*.jsonl" -print0 2>/dev/null | \
    xargs -0 ls -1t 2>/dev/null | head -n 1
}

if ! command -v jq >/dev/null 2>&1; then
  echo "FEHLER: jq ist nicht installiert. Chat-Export nicht moeglich." >&2
  exit 1
fi

if [[ -z "$TRANSCRIPT_PATH" ]]; then
  TRANSCRIPT_PATH="$(find_latest_transcript || true)"
fi

if [[ -z "$TRANSCRIPT_PATH" || ! -f "$TRANSCRIPT_PATH" ]]; then
  echo "FEHLER: Keine gueltige Transcript-Datei gefunden." >&2
  exit 1
fi

DATE_TAG="$(date '+%Y-%m-%d')"
TOPIC="$(sanitize_topic "$TOPIC_RAW")"
OUT_DIR="$ROOT_DIR/logs/chats"
OUT_FILE="$OUT_DIR/Chat_${DATE_TAG}_${TOPIC}.txt"

mkdir -p "$OUT_DIR"

{
  echo "Chat-Archiv"
  echo "Datum: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "Quelle: $TRANSCRIPT_PATH"
  echo ""
  jq -r '
    if .type=="user.message" then
      "[USER][\(.timestamp)]\n" + (.data.content // "") + "\n"
    elif .type=="assistant.message" and ((.data.content // "")|length)>0 then
      "[ASSISTANT][\(.timestamp)]\n" + (.data.content // "") + "\n"
    else
      empty
    end
  ' "$TRANSCRIPT_PATH"
} > "$OUT_FILE"

echo "OK: Chat archiviert -> $OUT_FILE"
