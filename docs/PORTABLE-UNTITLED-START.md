# PORTABLE-UNTITLED-START

Statusdatum: 2026-07-22
Gueltigkeit: verbindlich fuer portable Notfall- und Fremdsystem-Starts

## 1. Ziel

Untitled stellt eine portable Instanz von RennsteigFINANZ bereit, wenn Mac oder Windows ausfallen oder ein Fremdsystem genutzt werden muss.

## 2. Wichtige Regel

1. Untitled ist Wiederanlauf- und Sicherungsebene, kein dauerhaftes Parallelsystem.
2. Nach jedem portablen Start folgt schnellstmoeglich der Reentry-Abgleich zur GitHub-Historie.

## 3. Starter-Dateien

1. macOS Starter:
- `tools/portable/start-untitled.command`

2. Windows Starter:
- `tools/portable/START-UNTITLED.cmd`

## 4. Ablauf auf Fremdsystem

1. Datentraeger einstecken und Projektordner oeffnen.
2. Passenden Starter ausfuehren (Mac oder Windows).
3. Starter prueft:
- Git-Verfuegbarkeit
- Projektwurzel
- Backup-Ziel (bei Mac via `tools/resolve-backup-target.sh`)
4. Pflichtdateien werden sichtbar genannt:
- `CLAUDE.md`
- `STATUS.md`
- `NEXT-ACTION.md`
- `docs/context-snapshot.md`
5. Danach gilt:
- sofortige Rekonstruktion,
- genau eine P0-Aktion,
- spaeter Rueckfuehrung in GitHub-Kette.

## 5. Reentry-Pflicht nach portablem Betrieb

1. Aenderungen lokal committen.
2. Nach GitHub pushen.
3. Hauptsystem (Mac oder Windows) per Pull nachziehen.
4. Session in `STATUS.md` und Logdatei dokumentieren.

## 6. Grenzen

1. USB-Autostart ist systemseitig oft blockiert; Starter wird manuell ausgefuehrt.
2. Ohne Netz kann kein Push erfolgen; dann lokale Commits mit Zeitstempel und spaeterer Push-Pflicht.

## 7. Windows-Live-Test (Checkroutine)

Ziel: Sicherstellen, dass `tools/portable/START-UNTITLED.cmd` auf einem Windows-System reproduzierbar startet.

1. Vorbedingungen
- Projekt liegt lokal vor (z. B. unter `C:\RennsteigFINANZ` oder auf Untitled).
- `CLAUDE.md` ist in der Projektwurzel vorhanden.
- Optional: Git installiert (wenn nicht, darf nur eine Warnung erscheinen).

2. Testschritte
- `tools/portable/START-UNTITLED.cmd` per Doppelklick starten.
- Erwartung 1: Ausgabe zeigt Repo-Pfad an.
- Erwartung 2: Datei `CLAUDE.md` wird erkannt, kein Abbruch.
- Erwartung 3: Git-Version oder klare Git-Warnung wird ausgegeben.
- Erwartung 4: Reentry-Pflichtdateien werden gelistet.
- Erwartung 5: Explorer und zentrale Dateien oeffnen sich.

3. Ergebnis bewerten
- PASS: Alle Erwartungen 1 bis 5 treten ein.
- FAIL: Abbruch, fehlende Datei oder keine Reentry-Ausgabe.

4. Dokumentation
- Ergebnis in Session-Log notieren.
- In `STATUS.md` vermerken: Testdatum, System, PASS/FAIL, Rest-Risiko.