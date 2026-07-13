# IT-Betriebsmodus fuer dieses Projekt

Statusdatum: 2026-07-08
Ziel: Das Projekt arbeitet als guter Mitnutzer im Gesamtsystem und beeintraechtigt keine Kernfunktionen oder Produktiv-Apps.

## Leitprinzipien

1. Systemschutz vor Projekttempo
- macOS-Wartung, Updates, Spotlight, Time Machine, Fotos, Backup und aktive Nutzerarbeit haben Vorrang.

2. Nicht-dominierender Betrieb
- Keine langen, aggressiven Scans oder Massenoperationen ohne Nutzenbegruendung.
- Keine dauerhaften Hintergrundprozesse ohne klare Notwendigkeit.

3. App-Funktionalitaet sichern
- Telegram, DEVONthink 3 und andere Produktiv-Apps duerfen nicht funktional beeintraechtigt werden.
- Bevorzugt App-interne Bereinigung statt roher Dateisystem-Eingriffe.

4. Reversibel und messbar arbeiten
- Vorher/Nachher-Messung bei Speicher- und Systemeingriffen.
- Jede Massnahme dokumentieren (Delta, Risiko, Rollback-Option).

5. Konstruktive Selbstkritik — immer
- Jede Session endet mit einer ehrlichen Pruefung: Was lief gut? Was nicht? Warum?
- Schaetzungen, die nicht eintraten, werden erklaert und berichtigt.
- Fehler in Diagnose oder Vorgehen werden benannt und als Lernpunkt dokumentiert.
- Werkzeuge und Prozesse werden nach jeder Erkenntnis verbessert — nicht erst beim naechsten Debakel.
- Diese Pruefung ist keine Option, sondern Bestandteil jedes Arbeitsabschlusses.

## Guardrails fuer Speicherprobleme

1. Erlaubte Sofortmassnahmen
- Entfernen von klaren Cache-/Temp-Artefakten.
- Entfernen von unvollstaendigen Downloads.
- Leeren von Papierkorb nur nach expliziter Freigabe.

2. Eingeschraenkte Massnahmen
- Loeschen von App-Datenbanken, Bibliotheken oder Projektdateien nur nach expliziter Freigabe.
- Keine automatische Auslagerung auf externe Laufwerke.

3. Bevorzugte Vorgehensweise
- Telegram: Cache in der App bereinigen und Cache-Limit setzen.
- DEVONthink 3: Backup-Retention in der App steuern, nicht blind Ordner entfernen.

## Betriebsroutine

1. Triage
- Freien Speicher pruefen.
- Top-Verbraucher identifizieren.
- Laufende Lastverursacher erfassen.

2. Minimal-invasive Entlastung
- Erst low-risk intern.
- Danach messen und bewerten.

3. Stabilisierung
- Zielpuffer intern: mindestens 10 GiB, bevorzugt 20 GiB frei.
- Monitoring-Intervall festlegen.

## Rollenmodell fuer dieses Thema

1. IT-Abteilung
- Priorisiert Systemgesundheit und Betriebssicherheit.
- Gibt Freigaben fuer mittel/hoch invasive Schritte.

2. Projektbetrieb
- Haltet sich an Guardrails.
- Dokumentiert jede relevante Massnahme nachvollziehbar.

## Definition of Safe Done

- Keine App-Funktionalitaet verschlechtert.
- Kein externer Datenpfad als Notloesung genutzt.
- Speicherproblem messbar entschaerft.
- Naechste Schritte sind dokumentiert und priorisiert.
