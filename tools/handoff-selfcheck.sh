#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail() {
  echo "FAIL: $1" >&2
  exit 1
}

check_file() {
  local f="$1"
  [[ -f "$f" ]] || fail "Datei fehlt: $f"
  echo "OK: Datei vorhanden: $f"
}

check_text() {
  local file="$1"
  local pattern="$2"
  grep -qE "$pattern" "$file" || fail "Muster fehlt in $file: $pattern"
  echo "OK: Referenz in $file: $pattern"
}

required_files=(
  "CLAUDE.md"
  "STATUS.md"
  "NEXT-ACTION.md"
  "docs/context-snapshot.md"
  "docs/context-restore.md"
  "docs/CROSS-ENTRY-RUNBOOK.txt"
  "docs/KONTEXT-UEBERGABE.txt"
  "docs/STARTPROMPT-CLAUDE-AI.txt"
  "docs/STARTPROMPT-CHATGPT.txt"
  "docs/STARTPROMPT-UNIVERSAL-3ZEILEN.txt"
  "start-checklist.md"
)

for f in "${required_files[@]}"; do
  check_file "$f"
done

check_text "start-checklist.md" "docs/CROSS-ENTRY-RUNBOOK.txt"
check_text "start-checklist.md" "docs/STARTPROMPT-CLAUDE-AI.txt"
check_text "start-checklist.md" "docs/STARTPROMPT-CHATGPT.txt"
check_text "start-checklist.md" "docs/STARTPROMPT-UNIVERSAL-3ZEILEN.txt"

check_text "docs/CROSS-ENTRY-RUNBOOK.txt" "CLAUDE.md"
check_text "docs/CROSS-ENTRY-RUNBOOK.txt" "STATUS.md"
check_text "docs/CROSS-ENTRY-RUNBOOK.txt" "NEXT-ACTION.md"
check_text "docs/CROSS-ENTRY-RUNBOOK.txt" "docs/context-snapshot.md"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "OK: Git-Repository erkannt"
  git status -sb
else
  fail "Kein Git-Repository erkannt"
fi

if git remote get-url origin >/dev/null 2>&1; then
  echo "OK: Remote origin vorhanden"
else
  fail "Remote origin fehlt"
fi

echo "PASS: Cross-Entry-Selbstcheck erfolgreich"