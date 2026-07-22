# DREISYSTEM-BETRIEBSMODELL

Statusdatum: 2026-07-22
Gueltigkeit: verbindlich ab sofort

## 1. Zweck

Dieses Modell sichert den durchgaengigen Betrieb von RennsteigFINANZ ueber drei Ebenen:

1. Mac-Arbeitssystem (voll produktiv)
2. Windows-Arbeitssystem (voll produktiv)
3. Untitled (portable Sicherungs- und Wiederanlaufkopie)

Grundsatz: GitHub ist die zentrale Wahrheitsinstanz fuer Inhalte, Historie und Abgleich.

## 2. Rollen der drei Ebenen

1. Mac
- Fuehrende Arbeitskopie, wenn aktiv am Mac gearbeitet wird.
- Vollstaendige lokale Ausfuehrbarkeit der Projektablaeufe.

2. Windows
- Fuehrende Arbeitskopie, wenn aktiv auf der Firmenumgebung gearbeitet wird.
- Vollstaendige lokale Ausfuehrbarkeit der Projektablaeufe.

3. Untitled
- Portable Lebensversicherung fuer Notfall, Transport und Wiederaufbau.
- Kein gleichberechtigtes Drittsystem fuer dauerhafte Parallelentwicklung.
- Darf als Startpunkt auf Fremdsystemen genutzt werden, aber mit Rueckfuehrung in die GitHub-Kette.

## 3. Betriebsziele (messbar)

1. Datenverlustfenster (RPO)
- Ziel online: 0 bis 60 Sekunden.
- Ziel offline: bis letzter lokaler Snapshot.

2. Wiederanlaufzeit (RTO)
- Ziel bei Einzelsystemausfall: unter 30 Minuten.
- Ziel bei Totalausfall eines Hauptsystems: unter 2 Stunden bis arbeitsfaehiger Ersatzbetrieb.

3. Integritaet
- Jede produktive Aenderung ist in Git nachvollziehbar.
- Jede Session endet mit aktualisiertem STATUS, Log und naechster Aktion.

4. Reversibilitaet
- Jeder Testlauf ist 1:1 ruecksetzbar.
- Grundlage ist der verbindliche Standard: `docs/TEST-SICHERHEIT-ROLLBACK-STANDARD.md`.

## 4. Verbindliche Sync-Kette

1. Aenderung lokal umsetzen (Mac oder Windows).
2. Kurz pruefen und dokumentieren.
3. In Git committen und nach GitHub pushen.
4. Gegensystem per Pull aktualisieren.
5. Untitled-Spiegel aktualisieren (portable Kopie).
6. Reentry-Nachweis in STATUS und Session-Log erfassen.

Regel: Kein direkter Gegensystem-Abgleich ohne GitHub-Zwischenschritt, ausser im dokumentierten Notfallmodus.

## 5. Konfliktregel bei Divergenz

1. GitHub ist priorisierte Wahrheit.
2. Wenn Mac und Windows abweichen:
- zuerst beide Staende sichern,
- dann Unterschiede via Git aufloesen,
- dann erst auf Untitled spiegeln.
3. Unklare Konflikte werden als OFFEN markiert und nicht still entschieden.

## 6. Notfallmatrix

1. Ausfall Mac
- Weiterarbeit auf Windows.
- Letzten GitHub-Stand pullen.
- Untitled nur nutzen, wenn GitHub oder lokaler Stand fehlt.

2. Ausfall Windows
- Weiterarbeit auf Mac.
- Letzten GitHub-Stand pullen.
- Untitled nur nutzen, wenn GitHub oder lokaler Stand fehlt.

3. Ausfall Mac und Windows
- Untitled an Ersatzsystem anschliessen.
- Projekt als portable Instanz starten.
- Falls noetig auf Ersatzsystem in Arbeitsverzeichnis entpacken.
- Nach Netzverfuegbarkeit Rueckfuehrung in GitHub-Kette durchfuehren.

## 7. Portable Startlogik auf Fremdsystemen

Wichtig: Automatischer USB-Autostart ist aus Sicherheitsgruenden nicht auf allen Systemen erlaubt.

Deshalb gilt:
1. Starter-Assistent manuell starten.
2. Systemtyp erkennen (Mac oder Windows).
3. Projektstart oder Projektinstallation anbieten.
4. Backup-Ziel automatisch pruefen.
5. Nach Abschluss sofort Reentry-Abgleich gegen GitHub erzwingen.

Starter und Ablaufbeschreibung:
- `docs/PORTABLE-UNTITLED-START.md`
- `tools/portable/start-untitled.command` (macOS)
- `tools/portable/START-UNTITLED.cmd` (Windows)

## 8. Mindestartefakte pro Session-Ende

1. STATUS.md aktualisiert
2. NEXT-ACTION.md aktualisiert
3. Session-Protokoll unter logs/
4. Chat-Protokoll unter logs/chats/
5. Git-Commit und Push
6. Kontext-Snapshot aktualisiert

## 9. Verifikation

1. Betriebszustand pruefen mit:
- bash tools/handoff-proof.sh
- bash tools/anti-amnesie-guard.sh

2. Backup-Ziel robust aufloesen mit:
- bash tools/resolve-backup-target.sh

3. Ergebnis in STATUS.md und Session-Log dokumentieren.
