# Kontext-Snapshot (automatisch erzeugt)

Stand: 2026-07-14 15:15:18 UTC

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
- Branch: main
- Letzter Commit: 39ad93a Session 2026-07-14: Speicherentlastung, Runbook und Abschlusssicherung
- Uncommittete Aenderungen:
 M NEXT-ACTION.md
 M STATUS.md
 M docs/SPEICHER-RESERVE-RUNBOOK.md
 M docs/context-restore.md
 M docs/context-snapshot.md
 M recovery/it-watch-latest.txt
 M start-checklist.md
 M tools/cleanup-safe.sh
 M tools/new-session.sh
?? docs/USE-CASES-v0.1.md
?? docs/WINDOWS-TESTUMGEBUNG-CHECKLISTE.md
?? recovery/anti-amnesie-20260714-171325.txt
?? recovery/anti-amnesie-latest.txt
?? recovery/cleanup-20260714-140432.log
?? recovery/cleanup-20260714-140525.log
?? recovery/it-watch-20260714-134900.txt
?? tools/anti-amnesie-guard.sh
?? tools/resolve-backup-target.sh
?? tools/setup-testumgebung-mrt.sh
?? tools/windows-sync/

## 9. Kritische Kurz-Zusammenfassung (5 Punkte)
- Einstieg laeuft ueber feste Dateien.
- Runbook definiert Ausstieg/Einstieg einheitlich.
- Startprompts fuer Claude.ai, ChatGPT und universal sind vorhanden.
- Git-Zustand ist Teil des Pflichtpakets.
- Vor jedem Toolwechsel Snapshot erneuern.
