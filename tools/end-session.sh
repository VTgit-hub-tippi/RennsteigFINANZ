#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

TOPIC=""
TRANSCRIPT_PATH=""
NO_PUSH=0
DRY_RUN=0

usage() {
  cat <<'EOF'
Nutzung:
  bash tools/end-session.sh --topic "Thema"
  bash tools/end-session.sh --topic "Thema" --transcript "/pfad/zur/transcript.jsonl"
  bash tools/end-session.sh --topic "Thema" --no-push
  bash tools/end-session.sh --topic "Thema" --dry-run

Optionen:
  --topic        Pflicht. Thema fuer Protokoll, Chat-Datei und Commit.
  --transcript   Optional. Pfad zur VS Code Copilot Transcript-JSONL.
  --no-push      Optional. Commit wird erstellt, aber kein Push ausgefuehrt.
  --dry-run      Optional. Zeigt geplante Schritte ohne Schreib- oder Git-Aktionen.
EOF
}

sanitize_topic() {
  local s="$1"
  s="${s// /-}"
  s="${s//\//-}"
  s="${s//:/-}"
  s="${s//_/-}"
  printf '%s' "$s" | tr -cd '[:alnum:]-'
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --topic)
      TOPIC="${2:-}"
      shift 2
      ;;
    --transcript)
      TRANSCRIPT_PATH="${2:-}"
      shift 2
      ;;
    --no-push)
      NO_PUSH=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "FEHLER: Unbekannte Option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$TOPIC" ]]; then
  echo "FEHLER: --topic ist erforderlich." >&2
  usage
  exit 1
fi

if [[ ! -x "tools/archive-chat.sh" ]]; then
  echo "FEHLER: tools/archive-chat.sh fehlt oder ist nicht ausfuehrbar." >&2
  exit 1
fi

DATE_TAG="$(date '+%Y-%m-%d')"
TOPIC_SAFE="$(sanitize_topic "$TOPIC")"
PROTOKOLL_FILE="logs/Protokoll_${DATE_TAG}_${TOPIC_SAFE}.md"
CHAT_FILE="logs/chats/Chat_${DATE_TAG}_${TOPIC_SAFE}.txt"
COMMIT_MSG="Session ${DATE_TAG}: ${TOPIC}"

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "DRY-RUN: End-Session Routine"
  echo "- Protokoll: $PROTOKOLL_FILE"
  echo "- Chat-Export: $CHAT_FILE"
  if [[ -n "$TRANSCRIPT_PATH" ]]; then
    echo "- Transcript-Quelle: $TRANSCRIPT_PATH"
  else
    echo "- Transcript-Quelle: automatisch (neueste Datei)"
  fi
  echo "- Commit-Message: $COMMIT_MSG"
  if [[ "$NO_PUSH" -eq 1 ]]; then
    echo "- Push: deaktiviert (--no-push)"
  else
    echo "- Push: aktiviert"
  fi
  exit 0
fi

mkdir -p logs logs/chats

if [[ ! -f "$PROTOKOLL_FILE" ]]; then
  cat > "$PROTOKOLL_FILE" <<EOF
# Protokoll ${DATE_TAG} - ${TOPIC}

## Ziel
Session sauber abschliessen: Protokoll, Chat-Archiv und Git-Abschluss.

## Umgesetzt
- End-Session-Routine ausgefuehrt: \
  - Protokoll gesichert
  - Chat als TXT archiviert
  - Git-Abschluss erstellt

## OFFEN
- Falls vorhanden: offene Punkte aus der Session hier ergaenzen.

## Naechster Schritt
- Folgemaßnahme in STATUS.md und NEXT-ACTION.md fortschreiben.
EOF
  echo "OK: Protokoll erstellt -> $PROTOKOLL_FILE"
else
  echo "INFO: Protokoll existiert bereits -> $PROTOKOLL_FILE"
fi

if [[ -n "$TRANSCRIPT_PATH" ]]; then
  bash tools/archive-chat.sh "$TRANSCRIPT_PATH" "$TOPIC_SAFE"
else
  bash tools/archive-chat.sh "" "$TOPIC_SAFE"
fi

if [[ ! -f "$CHAT_FILE" ]]; then
  echo "FEHLER: Chat-Datei wurde nicht erzeugt: $CHAT_FILE" >&2
  exit 1
fi

git add -A

if git diff --cached --quiet; then
  echo "INFO: Keine aenderungen zum Commit vorhanden."
  exit 0
fi

git commit -m "$COMMIT_MSG"

if [[ "$NO_PUSH" -eq 1 ]]; then
  echo "OK: Commit erstellt, Push uebersprungen (--no-push)."
else
  git push
  echo "OK: Commit und Push erfolgreich."
fi
