#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

OUT_FILE="docs/context-snapshot.md"
NOW_UTC="$(date -u +"%Y-%m-%d %H:%M:%S UTC")"

branch="$(git branch --show-current 2>/dev/null || true)"
status_short="$(git status --short 2>/dev/null || true)"
last_commit="$(git log -1 --oneline 2>/dev/null || true)"

mkdir -p docs

cat > "$OUT_FILE" <<EOF
# Kontext-Snapshot (automatisch erzeugt)

Stand: $NOW_UTC

## 1. Projektueberblick
- Ziel: Reproduzierbarer, tooluebergreifender Wiedereinstieg (VS Code, Claude.ai, ChatGPT, GitHub).
- Prinzip: Dateien + Git sind die Wahrheit, nicht Chat-Erinnerungen.

## 2. Aktueller Stand
- Pflichtartefakte fuer den Einstieg sind vorhanden.
- Cross-Entry-Runbook und Startprompts sind versioniert.

## 3. Naechste Schritte (priorisiert)
- P0: Aktuelle AKTUELLE-AKTION aus NEXT-ACTION.md ausfuehren.
- P1: STATUS.md nach jeder Session fortschreiben.
- P1: Vor Toolwechsel Snapshot neu erzeugen.

## 4. Technischer Kontext
- Kernquellen: CLAUDE.md, STATUS.md, NEXT-ACTION.md, docs/CROSS-ENTRY-RUNBOOK.txt.
- Verifikation: tools/handoff-proof.sh.

## 5. Zentrale Dateien
- CLAUDE.md
- STATUS.md
- NEXT-ACTION.md
- docs/CROSS-ENTRY-RUNBOOK.txt
- docs/STARTPROMPT-CLAUDE-AI.txt
- docs/STARTPROMPT-CHATGPT.txt
- docs/STARTPROMPT-UNIVERSAL-3ZEILEN.txt

## 6. Offene Probleme / Risiken
- Externe Modelle koennen nie mathematisch garantiert identisch reagieren.
- Risiko wird durch harte Dateiquellen + automatisierte Checks minimiert.

## 7. Wichtige Entscheidungen
- Immer dateibasierter Einstieg.
- Bei Luecken: OFFEN markieren, nicht raten.

## 8. Git-Zustand
- Branch: ${branch:-unbekannt}
- Letzter Commit: ${last_commit:-unbekannt}
- Uncommittete Aenderungen:
EOF

if [[ -n "$status_short" ]]; then
  printf '%s\n' "$status_short" >> "$OUT_FILE"
else
  echo "(keine)" >> "$OUT_FILE"
fi

cat >> "$OUT_FILE" <<'EOF'

## 9. Kritische Kurz-Zusammenfassung (5 Punkte)
- Einstieg laeuft ueber feste Dateien.
- Runbook definiert Ausstieg/Einstieg einheitlich.
- Startprompts fuer Claude.ai, ChatGPT und universal sind vorhanden.
- Git-Zustand ist Teil des Pflichtpakets.
- Vor jedem Toolwechsel Snapshot erneuern.
EOF

echo "OK: Snapshot aktualisiert -> $OUT_FILE"