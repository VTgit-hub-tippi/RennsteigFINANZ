# IT-Monitoring-Protokoll — RennsteigFINANZ

Statusdatum: 2026-07-08

## Ziel
Die IT-Abteilung behaelt systemrelevante Programme und Prozesse laufend im Blick und signalisiert bei kritischem Zustand sofort den geplanten Maßnahmenpfad.

Leitidee:
- Das System wird entruempelt, optimiert und gesund gehalten, damit stabile Rahmenbedingungen fuer Projekt und Produktivbetrieb entstehen.

## Ueberwachte Bereiche
1. Freier Speicher auf /System/Volumes/Data.
2. Prozessgruppen mit Speicher-/Sync-Relevanz:
- Backup: backupd
- iCloud/Sync: cloudd, bird, syncdefaultsd
- Fotos: cloudphotod, photolibraryd, photoanalysisd
- Musik: Music, itunescloudd
- Indexierung: mds, mdworker
- Projektnah: Telegram, DEVONthink
3. App-Gesundheit fuer kritische Produktiv-Apps:
- Music: Hauptprozess, Helper-Prozesse, geoeffnete Bibliotheksdateien
- DEVONthink 3: Hauptprozess, geoeffnete Datenbankdateien
- Fotos/iCloud: laufende Hintergrundlast als Nachbarschaftsfaktor
4. Schluesselverzeichnisse:
- ~/Music
- ~/Pictures
- ~/Library/Application Support/DEVONthink 3
- ~/Library/Group Containers/6N38VWS5BX.ru.keepcoder.Telegram

## Alarmstufen
1. CRITICAL: < 5 GiB frei
- Signal: Sofortwarnung + konkreter 4-Punkte-Plan.

2. WARNING: 5 bis < 10 GiB frei
- Signal: Fruehwarnung + kurzfristiger Stabilisierungspfad.

3. OK: >= 10 GiB frei
- Signal: Normalbetrieb + Trendbeobachtung.

## Signalformat
Der Wachdienst schreibt einen Report nach:
- recovery/it-watch-latest.txt
- recovery/it-watch-YYYYMMDD-HHMMSS.txt

Jeder Report enthaelt:
- Statusstufe
- Freier Speicher
- Wichtige Verzeichnisgroessen
- Laufende Kandidatenprozesse
- App-Gesundheitshinweise fuer Music/DEVONthink/Fotos-iCloud
- Geplante naechste Schritte (PLAN)

## Betrieb
1. Manuell starten:
- bash tools/it-watch.sh

2. Verbindlicher Einsatz:
- Bei jedem Session-Start
- Nach jeder groesseren Bereinigung
- Bei jeder auffaelligen Speicherwarnung

## Guardrails
1. Monitoring ist read-mostly (schreibt nur Reportdateien).
2. Keine destruktiven Eingriffe im Watch-Skript.
3. Eingriffe erfolgen nur im separaten, freigegebenen Umsetzungsschritt.
4. Bei Verdacht auf Doppelstart werden zuerst App-Instanzen bewertet, nicht Bibliotheksdateien manipuliert.
