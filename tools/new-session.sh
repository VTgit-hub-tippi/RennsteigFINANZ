#!/usr/bin/env zsh
# ============================================================
# new-session.sh — RennsteigFINANZ Session-Starter
# Benutzung: ./tools/new-session.sh
# ============================================================
# Wählt die Ziel-Plattform, baut den Kontext-Prompt automatisch
# aus den aktuellen Projektdateien, kopiert ihn in die
# Zwischenablage und öffnet die Plattform im Browser.
# ============================================================

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

# ---- Farben ------------------------------------------------
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "${BLUE}═══════════════════════════════════════════${NC}"
echo "${BLUE}  RennsteigFINANZ — Session-Starter${NC}"
echo "${BLUE}═══════════════════════════════════════════${NC}"
echo ""

# ---- Git pull (neuesten Stand holen) -----------------------
echo "${YELLOW}► Hole neuesten Stand von GitHub...${NC}"
git pull origin main --quiet 2>&1 && echo "${GREEN}✓ Repository aktuell${NC}" || echo "  (Kein Internet oder kein Remote — lokaler Stand wird verwendet)"
echo ""

# ---- Finanzplanung-Sync -----------------------------------
echo "${YELLOW}► Synchronisiere Finanzplanung (Windows → Mac)...${NC}"
if bash "$REPO_DIR/tools/sync-finanzplanung.sh" --quiet 2>&1 | grep -q "aktuell\|abgeschlossen"; then
  echo "${GREEN}✓ Finanzplanung synchronisiert${NC}"
else
  echo "  (Warnung: Finanzplanung-Sync meldet Probleme — Prüfe Netzwerk)"
fi
echo ""

# ---- Anti-Amnesie-Guard ------------------------------------
echo "${YELLOW}► Anti-Amnesie-Guard pruefen...${NC}"
if bash "$REPO_DIR/tools/anti-amnesie-guard.sh" --quiet; then
  echo "${GREEN}✓ Kontext-, Handoff- und Sync-Status aktualisiert${NC}"
else
  echo "  (Warnung: Anti-Amnesie-Guard meldet Probleme. Siehe recovery/anti-amnesie-latest.txt)"
fi
echo ""

# ---- Plattform wählen --------------------------------------
echo "Welche Plattform möchten Sie starten?"
echo "  1) Claude.ai"
echo "  2) ChatGPT"
echo "  3) DeepSeek"
echo "  4) Nur Kontext in Zwischenablage kopieren (kein Browser)"
echo ""
printf "Auswahl [1-4]: "
read AUSWAHL

case "$AUSWAHL" in
  1) URL="https://claude.ai/new" ; PLATTFORM="Claude.ai" ;;
  2) URL="https://chatgpt.com/" ; PLATTFORM="ChatGPT" ;;
  3) URL="https://chat.deepseek.com/" ; PLATTFORM="DeepSeek" ;;
  4) URL="" ; PLATTFORM="Zwischenablage" ;;
  *) echo "Ungültige Auswahl. Abbruch." ; exit 1 ;;
esac

# ---- Selbst-enthaltenden Prompt bauen ----------------------
echo ""
echo "${YELLOW}► Baue Kontext-Prompt aus aktuellen Projektdateien...${NC}"

CLAUDE_MD="$REPO_DIR/CLAUDE.md"
STATUS_MD="$REPO_DIR/STATUS.md"
NEXT_ACTION_MD="$REPO_DIR/NEXT-ACTION.md"
PROMPT_DATEI="$REPO_DIR/docs/STARTPROMPT-AKTUELL.txt"

cat > "$PROMPT_DATEI" << 'PROMPT_HEADER'
=== RENNSTEIGFINANZ SESSION-START ===
Lies diesen gesamten Text zuerst vollständig, bevor du antwortest.
Du steigst in das Projekt RennsteigFINANZ ein — alles Nötige steht hier.
Keine Rückfragen zum Projektstand. Sofort loslegen.

Spielregeln:
- GitHub-Repository: https://github.com/VTgit-hub-tippi/RennsteigFINANZ
- Sprache: klares Deutsch, Sie-Form
- Session endet IMMER automatisch mit: Protokoll-MD + STATUS-Update + Chat-TXT + Commit-Message

PROMPT_HEADER

echo "" >> "$PROMPT_DATEI"
echo "=== CLAUDE.md (Spielregeln + Domain-Wissen) ===" >> "$PROMPT_DATEI"
echo "" >> "$PROMPT_DATEI"
cat "$CLAUDE_MD" >> "$PROMPT_DATEI"

echo "" >> "$PROMPT_DATEI"
echo "=== STATUS.md (Aktueller Projektstand) ===" >> "$PROMPT_DATEI"
echo "" >> "$PROMPT_DATEI"
cat "$STATUS_MD" >> "$PROMPT_DATEI"

echo "" >> "$PROMPT_DATEI"
echo "=== NEXT-ACTION.md (Verbindliche P0-Aktion) ===" >> "$PROMPT_DATEI"
echo "" >> "$PROMPT_DATEI"
cat "$NEXT_ACTION_MD" >> "$PROMPT_DATEI"

echo "" >> "$PROMPT_DATEI"
cat << 'PROMPT_FOOTER' >> "$PROMPT_DATEI"

=== DEINE AUFGABE ZUM EINSTIEG ===
1. Lies STATUS.md, NEXT-ACTION.md und CLAUDE.md vollständig.
2. Bestimme aus NEXT-ACTION.md exakt die AKTUELLE-AKTION (P0).
3. Starte sofort mit der Umsetzung dieser P0-Aktion.
4. Stelle nur dann genau eine Rueckfrage, wenn die P0-Aktion technisch blockiert oder mehrdeutig ist.
5. Wechsle das Thema nicht, solange der Nutzer nicht explizit umpriorisiert.

Session-Abschluss (IMMER automatisch, ohne Aufforderung):
- Protokoll: Protokoll_YYYY-MM-DD_[Thema].md bereitstellen
- STATUS.md-Update bereitstellen
- Chat-Verlauf als TXT: Chat_YYYY-MM-DD_[Thema].txt bereitstellen
- Commit-Message vorschlagen für: git add -A && git commit && git push
PROMPT_FOOTER

# ---- In Zwischenablage kopieren ----------------------------
pbcopy < "$PROMPT_DATEI"
ZEILEN=$(wc -l < "$PROMPT_DATEI")
echo "${GREEN}✓ Kontext-Prompt erstellt (${ZEILEN} Zeilen) und in Zwischenablage kopiert${NC}"

# ---- Browser öffnen ----------------------------------------
if [[ -n "$URL" ]]; then
  echo ""
  echo "${YELLOW}► Öffne $PLATTFORM...${NC}"
  open "$URL"
  echo ""
  echo "${GREEN}═══════════════════════════════════════════════════════════${NC}"
  echo "${GREEN}  ✓ $PLATTFORM ist geöffnet.${NC}"
  echo "${GREEN}  ✓ Kontext ist in der Zwischenablage.${NC}"
  echo "${GREEN}  → Einfach CMD+V im Chat-Fenster drücken und Enter.${NC}"
  echo "${GREEN}═══════════════════════════════════════════════════════════${NC}"
else
  echo ""
  echo "${GREEN}  ✓ Kontext ist in der Zwischenablage — CMD+V zum Einfügen.${NC}"
fi
echo ""
