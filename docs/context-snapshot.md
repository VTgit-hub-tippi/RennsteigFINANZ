# Kontext-Snapshot (automatisch erzeugt)

Stand: 2026-07-22 00:00:00 UTC

## 1. Projektueberblick
- Ziel: Reproduzierbarer, tooluebergreifender Wiedereinstieg (VS Code, Claude.ai, ChatGPT, GitHub).
- Prinzip: Dateien + Git sind die Wahrheit, nicht Chat-Erinnerungen.

## 2. Aktueller Stand
- Pflichtartefakte fuer den Einstieg sind vorhanden.
- Cross-Entry-Runbook und Startprompts sind versioniert.
- Der aktuelle Reentry-Stand ist in `STATUS.md`, `NEXT-ACTION.md` und `logs/Protokoll_2026-07-22_Mac-Reentry-und-Windows-Sync.md` festgehalten.
- Der Backup-Pfad unter Untitled ist als Ziel dokumentiert; die externen Sicherungsartefakte selbst bleiben ausserhalb des Repos.

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
- Branch: main
- Aktueller Stand: Reentry-Sync vom 2026-07-22 mit offenen Änderungen an Status-, Next-Action-, Lehren- und Protokolldateien
- Uncommittete Aenderungen: siehe `git status` im aktuellen Arbeitsbaum

## 9. Kritische Kurz-Zusammenfassung (5 Punkte)
- Einstieg laeuft ueber feste Dateien.
- Runbook definiert Ausstieg/Einstieg einheitlich.
- Startprompts fuer Claude.ai, ChatGPT und universal sind vorhanden.
- Git-Zustand ist Teil des Pflichtpakets.
- Vor jedem Toolwechsel Snapshot erneuern.
