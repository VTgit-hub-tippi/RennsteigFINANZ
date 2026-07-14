#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

QUIET=0
[[ "${1:-}" == "--quiet" ]] && QUIET=1

say() {
  if [[ "$QUIET" -eq 0 ]]; then
    echo "$1"
  fi
}

TS="$(date '+%Y%m%d-%H%M%S')"
REPORT_DIR="$ROOT_DIR/recovery"
mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/anti-amnesie-${TS}.txt"
LATEST_FILE="$REPORT_DIR/anti-amnesie-latest.txt"

BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'unbekannt')"
LOCAL_HASH="$(git rev-parse --short HEAD 2>/dev/null || echo 'unbekannt')"

UPSTREAM_REF=""
UPSTREAM_HASH=""
if git rev-parse --abbrev-ref --symbolic-full-name '@{u}' >/dev/null 2>&1; then
  UPSTREAM_REF="$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}')"
  git fetch --all --prune >/dev/null 2>&1 || true
  UPSTREAM_HASH="$(git rev-parse --short '@{u}' 2>/dev/null || echo 'unbekannt')"
else
  git fetch --all --prune >/dev/null 2>&1 || true
fi

PORCELAIN="$(git status --porcelain 2>/dev/null || true)"
if [[ -n "$PORCELAIN" ]]; then
  DIRTY_COUNT="$(printf "%s\n" "$PORCELAIN" | wc -l | tr -d ' ')"
else
  DIRTY_COUNT="0"
fi

if bash tools/handoff-proof.sh >/dev/null 2>&1; then
  HANDOFF_STATE="PASS"
else
  HANDOFF_STATE="FAIL"
fi

SYNC_STATE="gleich"
if [[ -n "$UPSTREAM_HASH" && "$UPSTREAM_HASH" != "unbekannt" ]]; then
  if [[ "$LOCAL_HASH" != "$UPSTREAM_HASH" ]]; then
    SYNC_STATE="abweichend"
  fi
fi

cat > "$REPORT_FILE" <<EOF
ANTI-AMNESIE STATUS
timestamp: $(date '+%Y-%m-%d %H:%M:%S')
branch: $BRANCH
local_hash: $LOCAL_HASH
upstream_ref: ${UPSTREAM_REF:-nicht gesetzt}
upstream_hash: ${UPSTREAM_HASH:-unbekannt}
sync_state: $SYNC_STATE
handoff_state: $HANDOFF_STATE
dirty_files: $DIRTY_COUNT

EMPFEHLUNG
1) Bei sync_state=abweichend: zuerst Stand holen.
2) Bei handoff_state=FAIL: tools/handoff-proof.sh manuell ausfuehren und Fehler beheben.
3) Vor Plattformwechsel immer STATUS.md und NEXT-ACTION.md aktualisieren.
EOF

cp -f "$REPORT_FILE" "$LATEST_FILE"

# Optional: Arbeitsstand fuer Windows-Testumgebung spiegeln, falls Ziel vorhanden
MRT_TEST_DIR="/Volumes/MRT/Vermittler/Volker Tippmann/Finanzplanung/Programm/Testumgebung VScode Programm"
if [[ -d "$MRT_TEST_DIR" && -w "$MRT_TEST_DIR" ]]; then
  cp -f "$ROOT_DIR/STATUS.md" "$MRT_TEST_DIR/STATUS.md"
  cp -f "$ROOT_DIR/NEXT-ACTION.md" "$MRT_TEST_DIR/NEXT-ACTION.md"
  cp -f "$ROOT_DIR/start-checklist.md" "$MRT_TEST_DIR/start-checklist.md"
  cp -f "$ROOT_DIR/docs/context-restore.md" "$MRT_TEST_DIR/context-restore.md"
  cp -f "$LATEST_FILE" "$MRT_TEST_DIR/ANTI-AMNESIE-STATUS.txt"
fi

say "Anti-Amnesie-Report: $LATEST_FILE"
say "local_hash=$LOCAL_HASH upstream_hash=${UPSTREAM_HASH:-unbekannt} dirty_files=$DIRTY_COUNT handoff=$HANDOFF_STATE"
