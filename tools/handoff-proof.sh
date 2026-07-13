#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

bash tools/context-snapshot-refresh.sh
bash tools/handoff-selfcheck.sh

echo "PASS: Einstiegspunkte sind konsistent und einsatzbereit"