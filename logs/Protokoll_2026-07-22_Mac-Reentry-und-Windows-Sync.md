# Protokoll 2026-07-22 - Mac-Reentry und Windows-Sync-Übernahme

## Ziel
Den aktuellen Windows-Arbeitsstand wieder mit der Mac-Kopie und der Betriebsdokumentation abgleichen.

## Umgesetzt
- `STATUS.md` auf den aktuellen Stand gebracht.
- `NEXT-ACTION.md` auf das aktuelle Statusdatum und die Kernmethode ausgerichtet.
- `docs/LEHREN-VERANKERUNG.md` um die aktuelle Verankerungslogik ergaenzt.
- Das lokale Reentry-Protokoll fuer die Synchronisierung zwischen Mac-Stand und Windows-Arbeitsstand vorbereitet.

## Geaenderte/Neue Dateien
- STATUS.md
- NEXT-ACTION.md
- docs/LEHREN-VERANKERUNG.md
- logs/Protokoll_2026-07-22_Mac-Reentry-und-Windows-Sync.md

## Ergebnis
- Der lokale Mac-Stand ist wieder auf die aktuelle Windows-getriebene Betriebslogik ausgerichtet.
- Die neue Kernmethode ist zentral dokumentiert und in die Steuerdateien uebernommen.
- Der naechste Reentry-Fokus bleibt im gleichen Betriebsrahmen, ohne Themenwechsel.

## OFFEN
- Der eigentliche Windows-Livefix in `frmFinanzen` ist weiterhin separat in der Windows-Testumgebung auszufuehren.
- Ein echter Backup-Abgleich mit externem Ziel muss bei naechster Gelegenheit erneut verifiziert werden.

## Lehren
1. Reentry nie auf Basis eines veralteten Snapshots bewerten.
2. Neue Pruefmechanik sofort in zentrale Steuerdateien uebernehmen.
3. Sicherung, Live-Stand und Protokoll gemeinsam pflegen.