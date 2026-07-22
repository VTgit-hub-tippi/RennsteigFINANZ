# LEHREN-VERANKERUNG

Zweck: Lehren aus Sessions in konkrete, wiederholbare Betriebsmechanik ueberfuehren.

## Wichtigste Methode (ab 2026-07-15)

Schnappschuss plus VB-Coding waehrend der laufenden Arbeit.

Verbindlicher Zyklus:

1. Schnappschuss erfassen (Ist-Zustand, erwartetes Verhalten, beobachtete Abweichung).
2. VB-Code gezielt an der vermuteten Ursache bearbeiten.
3. Prozess mit festem Ablauf erneut pruefen.
4. Tool anhand des Ergebnisses verbessern (Regel, Vorlage, Skript oder Code).

Ziel: Fehler schneller reproduzieren, Ursachen klar nachweisen und Verbesserungen dauerhaft in den Betrieb rueckfuehren.

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

## Lehren aus Session 2026-07-22

1. Lehre

- Beobachtung: Ein veralteter Kontext-Snapshot verschleiert den tatsaechlichen Arbeitsstand auf dem Mac.
- Ursache: Das lokale Projekt war weiterentwickelt, waehrend der Snapshot noch den Stand vom 2026-07-14 zeigte.
- Risiko bei Wiederholung: Rueckkehr, Backup und Priorisierung laufen auf Basis falscher Annahmen.

Verankerung

- Art: Regel + Snapshot
- Konkrete Umsetzung: `docs/context-snapshot.md` und `STATUS.md` bei jeder Reentry-Phase aktualisieren.
- Nachweis: Der aktuelle Mac-Stand wurde mit dem sichtbaren Git- und Dokumentationsstand abgeglichen.

1. Lehre

- Beobachtung: Windows-getriebene Betriebsregeln bleiben unsichtbar, wenn sie nur in Einzelartefakten auftauchen.
- Ursache: Neue Pruefmechanik, Checklisten und Kernmethode muessen in die zentralen Steuerdateien uebernommen werden.
- Risiko bei Wiederholung: P0 und Testablauf laufen auseinander, obwohl die Basis schon vorhanden ist.

Verankerung

- Art: Regel + Dokument
- Konkrete Umsetzung: `NEXT-ACTION.md` und `docs/WINDOWS-TESTUMGEBUNG-CHECKLISTE.md` bilden dieselbe Betriebslogik ab.
- Nachweis: Die Kernmethode Schnappschuss -> VB-Coding -> Prozesspruefung -> Toolverbesserung ist nun zentral benannt.

1. Lehre

- Beobachtung: Eine separate Datensicherung bleibt nur belastbar, wenn der Arbeitsstand und der Sicherungsstand gemeinsam dokumentiert werden.
- Ursache: Mac-Kopie, Backup-Ziel und Windows-Arbeitsstand koennen zeitlich auseinanderlaufen.
- Risiko bei Wiederholung: Reentry wirkt erfolgreich, obwohl die gesicherte Basis nicht mehr zum Live-Stand passt.

Verankerung

- Art: Checkliste + Protokoll
- Konkrete Umsetzung: `STATUS.md`, `logs/Protokoll_2026-07-22_Mac-Reentry-und-Windows-Sync.md` und `docs/context-snapshot.md` gemeinsam pflegen.
- Nachweis: Der aktuelle Reentry-Stand ist in Status und Protokoll sichtbar festgehalten.
