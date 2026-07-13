# IT-Wartungsplan v0.1 — RennsteigFINANZ

Statusdatum: 2026-07-08
Rhythmus: taeglich (kurz), woechentlich (vertieft), monatlich (grundlegend)

## Taeglich (5-10 Minuten)
1. Freien Speicher pruefen (Soll: >= 10 GiB).
2. Auffaellige Last/Prozesse kurz sichten.
3. Offene P0/P1-Themen im STATUS aktualisieren.

## Woechentlich (30-60 Minuten)
1. Speicher-Top-Verbraucher bewerten.
2. App-Caches/Retention app-sicher nachziehen.
3. Backup- und Sync-Zustand pruefen.
4. Projektrelevante Tools auf Auffaelligkeiten pruefen.

## Monatlich (60-120 Minuten)
1. Update-/Upgrade-Lage und Kompatibilitaeten pruefen.
2. Dateiverwaltung und Ablagestruktur aufraeumen.
3. Office-Integrationspfade (Word/Excel/Pages/Numbers) validieren.
4. Risiken und technische Schulden neu priorisieren.

## Trigger-basierte Sofortaktion
- Freier Speicher < 5 GiB.
- Wiederkehrendes Volllaufen in < 48h.
- App-Funktionsstoerung mit Einfluss auf Projektbetrieb.

## Verbindliche Checkpunkte je Eingriff
1. Vorher-Messung.
2. Kleinster wirksamer Schritt.
3. Nachher-Messung.
4. Dokumentation inkl. Rest-Risiko.

## Verbote im Regelbetrieb
- Keine unkontrollierte externe Auslagerung.
- Keine Loeschung produktiver Daten ohne Freigabe.
- Keine langlaufenden aggressiven Scans ohne konkreten Zweck.

---

## IT-Migrationsprojekte (geplant, noch nicht begonnen)

> Status: PLANUNG. Kein Eingriff vor vollstaendiger Vorbereitung.
> Hintergrund: Systemstress durch zu volle interne Festplatte (aktuell 4 GiB frei, Ziel >= 10 GiB).
> Loesung: Datenmassen strukturiert auf DiskStation-NAS auslagern.

### MIT-01 — iTunes-Bibliothek auf NAS (75 GiB)

Ziel: ~/Music/iTunes/ (75 GiB) auf /Volumes/music (DiskStation) verlagern.
Vorbedingungen:
- Klaeren ob Titel bereits in Apple Music Cloud (iCloud-Musikmediathek aktiv?).
- Netzwerkverbindung zum NAS pruefen (aktuell: 188ms Ping = WiFi; Ziel: Ethernet oder < 5ms).
- Backup der iTunes-Bibliothek auf NAS sicherstellen vor Verschiebung.
Risiken:
- Music.app oeffnet bei nicht gemountem NAS eine leere Standardbibliothek.
- Apple Music Matching-Status muss vor Loeschung lokaler Kopien verifiziert werden.
Recherche-Aufgaben fuer IT:
- [ ] Dokumentation: "iTunes-Mediathek auf Netzlaufwerk verschieben" (Apple Support HT201596).
- [ ] Pruefen: Music.app Verhalten bei NAS-Ausfall / Auto-Reconnect.
- [ ] Option: Symlink ~/Music/iTunes -> /Volumes/music/iTunes als Uebergangsloesung.

### MIT-02 — DEVONthink-Archivdatenbanken auf NAS (Anteil von 76 GiB)

Ziel: Inaktive/Archiv-Datenbanken auf /Volumes/Datensicherung/DEVONthink/ auslagern.
Aktive Arbeitsdatenbank bleibt lokal.
Vorbedingungen:
- Inventar: Welche DEVONthink-Datenbanken existieren, welche sind aktiv/archiviert?
- DEVONthink-Backup-Retention-Einstellungen in der App pruefen.
Risiken:
- DEVONthink empfiehlt lokalen Speicher fuer aktive Datenbanken (Performance, Konsistenz).
- Nie direkt Datenbankordner verschieben waehrend DEVONthink offen ist.
Recherche-Aufgaben fuer IT:
- [ ] DEVONthink-Handbuch: Kapitel "Datenbank auf Netzlaufwerk".
- [ ] Pruefen: DEVONthink Sync-Optionen fuer NAS (CloudKit vs. Bonjour vs. lokal).
- [ ] Option: DEVONthink-Backup direkt auf NAS konfigurieren statt Verschiebung.

### MIT-03 — Fotos-Backup auf Synology Photos

Ziel: Zweite Kopie der Fotos-Mediathek auf NAS als Ausfallsicherung neben iCloud.
Aktueller Stand: Fotos-Mediathek lokal fast leer (Optimieren-Modus aktiv) -- gut.
Vorbedingungen:
- Synology Photos auf DiskStation aktiviert?
- /Volumes/photo Share bereits gemountet -- vorhanden.
Risiken: Gering (keine Verschiebung, nur Backup-Spiegelung).
Recherche-Aufgaben fuer IT:
- [ ] Synology Photos Einrichtung und automatische Synchronisation mit macOS-Fotos.
- [ ] Alternativer Weg: Fotos-Mediathek-Export als Backup-Job via Automator/Skript.
