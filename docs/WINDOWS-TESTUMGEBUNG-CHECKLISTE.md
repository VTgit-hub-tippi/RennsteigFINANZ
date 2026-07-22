# WINDOWS-TESTUMGEBUNG-CHECKLISTE v0.1

Statusdatum: 2026-07-14
Zweck: Sichere Vorbereitung und Durchfuehrung des VBA-Fixes in einer isolierten Windows-Testkopie.

## Wichtiger Betriebsgrundsatz (Echtdaten)

- In dieser Umgebung liegen echte Firmendaten vor; es gibt keine Kunst-/Dummy-Testdaten.
- Wenn fuer den Ablauf Daten benoetigt werden, werden diese gezielt aus produktiven Pfaden in die Testumgebung kopiert.
- Bevorzugte Quellpfade:
  - Kundenpfad (Bestandsverwaltung/Kunden)
  - Gesellschafts-/Vertragsbezogene Pfade aus der Fachablage
- Niemals direkt im Originalpfad entwickeln; immer nur in der isolierten Testkopie arbeiten.

## Verbindliche Rueckfrage vor Datenzusammenfuehrung

- Bevor Datensaetze zusammengefuehrt, vereinheitlicht oder ersetzt werden, erfolgt immer eine explizite Rueckfrage an den Betriebsleiter.
- Ohne diese Freigabe werden keine Kundenpfade "zusammengeworfen".
- Pflichtfragen vor jeder Zusammenfuehrung:
  1. Welche konkreten Datensaetze/Pfade sollen zusammengefuehrt werden?
  2. Welcher Datensatz ist fachlich fuehrend bei Konflikten?
  3. Welche Felder/Dateien haben Vorrang (z. B. Stammdaten, Vertraege, Notizen, Protokolle)?
  4. Soll nur abgeglichen werden oder auch physisch ersetzt/ueberschrieben werden?
  5. Welche Nachweise gelten als "verifiziert" und "plausibilisiert"?

## 1. Ziel und Abgrenzung

- Ziel: Debugger-Stopp im Rueckkehr-Ablauf aus Finanzdaten reproduzierbar beheben.
- Scope: Nur Testumgebung.
- Ausschluss: Keine direkte Aenderung an der Produktivdatei auf dem Firmenpfad.

## 2. Eingangsbedingungen

- Aktueller Projektstand ist gesichert (Git-Stand plus Tagesbackup vorhanden).
- Vollbackup vorhanden: auf einem verfuegbaren Backup-Ziel (kein fester Volume-Name erforderlich).
- Backup-Ziel kann bei Bedarf mit `bash tools/resolve-backup-target.sh` ermittelt werden.
- Letzter Befund ist dokumentiert: `logs/Protokoll_RennsteigFINANZ_2026-07-14_Windows-Demo-und-Backup.md`

## 3. Testordner vorbereiten (Windows)

1. Lokalen Testordner anlegen (Beispiel): `C:\RennsteigFINANZ-Test\FinanzplanungTool\`
2. Programmebene aus der Fachablage in den Testordner kopieren (Arbeitskopie).
3. Falls fuer den Ablauf erforderlich: Kundenpfad oder Gesellschaftspfad gezielt in die Testumgebung kopieren.
4. Nur den benoetigten Ausschnitt kopieren, damit Risiko und Streuung minimiert bleiben.
5. Dateiname fuer Test explizit kennzeichnen (Beispiel): `Finanzen_TEST.xls`.
6. Schreibschutz ausschalten, damit VBA-Aenderungen speicherbar sind.
7. Bei Datenabgleich Kunde X: zuerst Rueckfrageblock (oben) klaeren, dann erst Abgleich starten.

## 4. Sicherheitsgelander vor Codeaenderung

- Vor dem ersten Edit eine 1:1 Kopie im selben Testordner ablegen:
  - Beispiel: `Finanzen_TEST_preFix.xls`
- Aenderungen nur in `Finanzen_TEST.xls`.
- Jede geaenderte Prozedur kurz protokollieren (Modul, Prozedurname, Grund).
- Der Standard `docs/TEST-SICHERHEIT-ROLLBACK-STANDARD.md` ist verbindlich anzuwenden.

## 4a. Verbindliche 1:1-Rollback-Pflicht

Vor jedem Testlauf muss klar sein:
1. Welche Datei ist die aktive Testdatei?
2. Wo liegt die PreFix-Kopie?
3. Wer gibt den Rollback frei?

Sofort-Rollback bei:
- ungeplantem Seiteneffekt,
- unklarer Datenlage,
- Verdacht auf Produktivbeeinflussung.

Rollback-Minimum:
1. Test abbrechen.
2. `Finanzen_TEST.xls` verwerfen.
3. `Finanzen_TEST_preFix.xls` wieder als `Finanzen_TEST.xls` bereitstellen.
4. Teststand neu dokumentieren.

## 5. Fix-Arbeit in VBA

1. VBA-Editor oeffnen und `frmFinanzen` aufrufen.
2. Rueckkehr-Handler identifizieren, in dem aktuell der harte Aufruf steht:
   - `Workbooks("Finanzen.xls").Close SaveChanges:=True`
3. Auf robuste Objektlogik umbauen:
   - Workbook-Objekt in Variable referenzieren.
   - Nur schliessen, wenn Objekt gueltig ist.
   - Fehlerfall sauber behandeln, statt direkt abzubrechen.
4. Speichern, Datei schliessen, neu oeffnen.

## 6. Ende-zu-Ende-Testablauf

- Ablauf 1 (Pflicht):
  1. Start ueber Verknuepfung
  2. Laufwerk/Pfad pruefen
  3. Haushalte suchen/auswaehlen
  4. Stammdaten bearbeiten
  5. Finanzdaten bearbeiten
  6. Rueckkehr aus Finanzdaten
  7. Vertragsdaten bearbeiten
- Erfolgskriterium: Kein Debugger-Stopp und kein harter Abbruch.

## 7. Dokumentation nach Test

- In Session-Log erfassen:
  - reproduzierbar behoben: Ja/Nein
  - geaenderte Module/Prozeduren
  - Rest-Risiken/OFFEN
  - Entscheidung zur Uebernahme in Produktivbestand
- Standardisierte Betriebsmittel fuer jeden Testlauf:
  - `docs/ABLAUF-UND-FEHLERPRUEFUNG-SNAPSHOT-VORLAGE.txt`
  - `docs/UI-VBA-FEHLER-URSACHEN-MATRIX-VORLAGE.csv`
  - `docs/ROLLBACK-NACHWEIS-VORLAGE.txt`
  - `docs/ROLLBACK-NACHWEIS-VORLAGE.csv`
  - `tools/windows-sync/START-Test-Rueckkehrpfad.cmd` (fester Rueckkehrpfad als Kurzroutine)
- Danach STATUS und NEXT-ACTION aktualisieren.

## 8. Uebernahme-Regel

- Produktivuebernahme nur wenn:
  - Testablauf mindestens einmal vollstaendig ohne Debugger-Stopp lief
  - Aenderung nachvollziehbar dokumentiert ist
  - Rueckfallkopie vorhanden ist
  - Rollback-Faehigkeit 1:1 im Test nachweisbar war
