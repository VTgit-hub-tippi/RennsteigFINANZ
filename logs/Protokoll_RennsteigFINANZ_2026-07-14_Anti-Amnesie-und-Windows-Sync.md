# Protokoll RennsteigFINANZ — 2026-07-14 (Anti-Amnesie und Windows-Sync)

## Ziel der Session
- Stopperhaften Wiedereinstieg technisch verhindern.
- Windows-Testumgebung auf MRT mit 1-Klick-Ablauf bereitstellen.
- Plattformuebergreifende Synchronisierung (Mac/Windows) vereinfachen.

## Durchgefuehrte Arbeiten
- Zwei-Spur-Betrieb in den Leitdokumenten verankert (Mac-Speicher + Windows-Livetest).
- `tools/cleanup-safe.sh` robust gegen Locale/Formatfehler stabilisiert.
- Volumenunabhaengige Backup-Aufloesung eingefuehrt (`tools/resolve-backup-target.sh`).
- Testumgebung auf MRT automatisiert aufgebaut (`tools/setup-testumgebung-mrt.sh`).
- In Testumgebung abgelegt:
  - `Programm Finanzplanung 5.0_TEST.xls`
  - `Programm Finanzplanung 5.0_TEST_preFix.xls`
  - `START-TESTUMGEBUNG.command`
  - `Windows-Sync/START-Stand-holen.cmd`
  - `Windows-Sync/START-Stand-zurueckschreiben.cmd`
- Anti-Amnesie-Guard eingefuehrt (`tools/anti-amnesie-guard.sh`) und in Session-Start integriert.
- Spiegelung der Kernstatusdateien und Anti-Amnesie-Status in MRT-Testumgebung aktiviert.

## Verbindliche Betriebsregeln (aktualisiert)
- Untitled bleibt primaere Sicherungsebene.
- Bei kurzfristig fehlendem Untitled darf dokumentierter Fallback genutzt werden.
- Echtdatenmodus: Keine Dummy-Daten; Kunden-/Gesellschaftspfade nur gezielt kopieren.
- Vor Datenzusammenfuehrung immer Rueckfrage zu Fuehrungsquelle und Konfliktregeln.

## Technischer Abschlussstatus
- Anti-Amnesie-Guard: PASS
- Git sync_state: gleich (local `39ad93a`, upstream `39ad93a`)
- Handoff-Selbstcheck: PASS

## Naechster Schritt
- Windows: Testdatei oeffnen, `frmFinanzen`-Rueckkehrhandler fixen, Ende-zu-Ende-Lauf pruefen.
- Danach gezielte Entscheidung zur Uebernahme in Produktivpfad.
