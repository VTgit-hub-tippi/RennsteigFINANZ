# LEHREN-VERANKERUNG

Zweck: Lehren aus Sessions in konkrete, wiederholbare Betriebsmechanik ueberfuehren.

## Standard je Session

1. Drei Lehren minimum erfassen.
2. Jede Lehre hat genau eine Verankerung im Betrieb.
3. Verankerung ist nur gueltig, wenn sie technisch oder prozessual sichtbar umgesetzt ist.

## Verankerungsarten

- Checkliste erweitern
- Vorlage einfuehren
- Skript/Automatisierung ergaenzen
- Schutzregel in NEXT-ACTION oder STATUS aufnehmen

## Template

Lehre:

- Beobachtung:
- Ursache:
- Risiko bei Wiederholung:

Verankerung:

- Art (Checkliste/Vorlage/Skript/Regel):
- Konkrete Umsetzung (Datei und Abschnitt):
- Nachweis (Test/Anwendung):

## Lehren aus Session 2026-07-15

1. Lehre

- Beobachtung: Unscharfe Fachbegriffe fuehren zu Missverstaendnissen im Arbeitsablauf.
- Ursache: Uneinheitliche Benennung zwischen UI-Tests und Codeanalyse.
- Risiko bei Wiederholung: Fehler werden falsch klassifiziert oder nicht reproduzierbar verfolgt.

Verankerung

- Art: Vorlage + Regel
- Konkrete Umsetzung: `docs/ABLAUF-UND-FEHLERPRUEFUNG-SNAPSHOT-VORLAGE.txt`, `docs/UI-VBA-FEHLER-URSACHEN-MATRIX-VORLAGE.csv`
- Nachweis: Beide Vorlagen sind produktiv angelegt und im Testablauf verlinkt.

1. Lehre

- Beobachtung: Verbesserungen versanden, wenn sie nicht in den Setup-Pfad eingebaut sind.
- Ursache: Artefakte lagen vor, wurden aber nicht automatisch in die Testumgebung uebernommen.
- Risiko bei Wiederholung: Unterschiedliche Teststaende und fehlende Nachvollziehbarkeit.

Verankerung

- Art: Skript
- Konkrete Umsetzung: `tools/setup-testumgebung-mrt.sh` kopiert Snapshot- und Matrix-Vorlage in die Testumgebung.
- Nachweis: Setup-Skript enthaelt die neuen Source-/Destination-Pfade und Copy-Schritte.

1. Lehre

- Beobachtung: Retests sind inkonsistent ohne festen Ablauf.
- Ursache: Manuelle Testfolge variiert zwischen Sessions.
- Risiko bei Wiederholung: Scheinbar behobene Fehler treten spaeter erneut auf.

Verankerung

- Art: Skript + Starter
- Konkrete Umsetzung: `tools/windows-sync/test-rueckkehrpfad.ps1` und `tools/windows-sync/START-Test-Rueckkehrpfad.cmd`
- Nachweis: Standardisierter Schrittpfad mit Protokollausgabe (Snapshot + Matrix) ist implementiert.
