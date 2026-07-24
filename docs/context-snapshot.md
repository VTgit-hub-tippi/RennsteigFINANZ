# Kontext-Snapshot (automatisch erzeugt)

Stand: 2026-07-24 11:30 CET

## 1. Projektueberblick
- Ziel: Stabiler Dreisystem-Betrieb (Mac + Windows + Untitled) mit GitHub als priorisierte Wahrheitsinstanz.
- Prinzip: Dateibasierter Wiedereinstieg ueber Pflichtquellen, keine Chat-Abhaengigkeit.

## 2. Aktueller Stand
- Finanzplanung 5.0 wurde auf Mac analysiert; VBA-Volltext und Strukturanalyse sind dokumentiert.
- Sync-Automation fuer Finanzplanung ist vorhanden (`tools/sync-finanzplanung.sh`) und in den Session-Start integriert.
- Handoff fuer Windows liegt vor (`docs/HANDOFF-MAC-TO-WINDOWS-2026-07-24.md`).
- P0 fuer den Betrieb ist weiterhin der Windows-Aufbau mit anschliessender VBA-Analyse am Arbeitsplatz.

## 3. Naechste Schritte (priorisiert)
- P0: Windows-Topologie am Arbeitsplatz fertig aufsetzen und `docs/WINDOWS-TOPOLOGIE-SETUP-CHECKLIST.md` abarbeiten.
- P1: UC-001 (Haushaltsuebersicht) in VBA strukturiert analysieren und Ergebnisse dokumentieren.
- P1: Nach jeder Session `STATUS.md` fortschreiben und Untitled-Backup ausfuehren.

## 4. Technischer Kontext
- Pflichtquellen: `CLAUDE.md`, `STATUS.md`, `NEXT-ACTION.md`, `docs/context-snapshot.md`, `git status -sb`.
- Runbook: `docs/CROSS-ENTRY-RUNBOOK.txt`.
- Verifikation: `bash tools/handoff-proof.sh`.

## 5. Zentrale Dateien
- CLAUDE.md
- STATUS.md
- NEXT-ACTION.md
- docs/CROSS-ENTRY-RUNBOOK.txt
- docs/HANDOFF-MAC-TO-WINDOWS-2026-07-24.md
- docs/WINDOWS-TOPOLOGIE-SETUP-CHECKLIST.md

## 6. Offene Probleme / Risiken
- Windows-Arbeitsschritte sind noch nicht ausgefuehrt; reale Produktivdatenpfade muessen vor Ort verifiziert werden.
- Mac-Speicher bleibt eng; grosse Datenbewegungen nur kontrolliert mit Backup und Rollback.

## 7. Wichtige Entscheidungen
- Dreisystem-Modell ist verbindlich (Mac und Windows produktiv, Untitled als portable Rueckversicherung).
- Einstieg und Rekonstruktion immer ueber Pflichtdateien; fehlende Informationen als OFFEN markieren.

## 8. Git-Zustand
- Branch: main
- Arbeitsbaum: vor Uebergabe mit `git status -sb` pruefen.
- Regel: Lokal aendern -> testen -> commit/push -> Gegensystem pull -> Untitled spiegeln.

## 9. Kritische Kurz-Zusammenfassung (5 Punkte)
- Betriebswahrheit liegt in Dateien und Git, nicht im Chat-Verlauf.
- Windows-Reaktivierung ist der aktuelle P0-Schritt.
- Handoff und Checkliste fuer Windows sind vorhanden und einsatzbereit.
- Finanzplanung ist zentrale Arbeitskomponente und nicht verhandelbar.
- Session-Abschluss immer mit Statusupdate, Backup und sauberem Git-Zustand.
