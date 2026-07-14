# SPEICHER-RESERVE-RUNBOOK

Zweck: Sicherer Ablauf fuer Speicher-Reserve auf APFS inkl. Rueckfallplan, falls etwas schiefgeht.

## 1) Ausgangslage (Ist-Stand)

- Systemvolume war bei 100 Prozent mit nur ca. 20 MB frei.
- Lokale Time-Machine-Snapshots waren nicht der Hauptverursacher.
- Groesste Verbraucher: `Library`, `Music`, `CloudStation`.

## 2) Zielbild

- Ein separates APFS-Arbeitsvolume fuer den Betrieb.
- Harte Mindestreserve (`reserve`) fuer den Arbeitsbereich.
- Obergrenze (`quota`) gegen unkontrolliertes Wachstum.

## 3) Vorbedingungen vor APFS-Aenderungen

1. Externes Backup muss aktuell und verifiziert sein.
2. Mindestens 5 bis 10 GB lokal frei machen.
3. APFS-Container pruefen:

```bash
diskutil apfs list
```

### Backup-Ziel robust aufloesen (ohne feste Untitled-Abhaengigkeit)

Hinweis zur Betriebsregel:
- Untitled ist die primaere Sicherungsebene und das bevorzugte Backup-Medium.
- Wenn Untitled kurzfristig nicht verfuegbar ist, wird ein dokumentierter Fallback genutzt, damit der Betrieb nicht stoppt.

Vor groesseren Eingriffen das verfuegbare Ziel ermitteln:

```bash
bash tools/resolve-backup-target.sh
```

Optional mit fester Vorgabe fuer die aktuelle Session:

```bash
export RF_BACKUP_BASE="/Volumes/MRT/backup"
bash tools/resolve-backup-target.sh
```

## 4) Standard-Umsetzung

Beispiel auf Container `disk1`:

```bash
sudo diskutil apfs addVolume disk1 APFS RF-Arbeitsbereich -reserve 30g -quota 120g
```

Nachkontrolle:

```bash
diskutil apfs list
df -h /
```

## 5) Notfall / Rueckfallplan

Wenn das neue Volume stoert oder falsch konfiguriert wurde:

1. Offene Prozesse auf dem Volume stoppen.
2. Daten vom Arbeitsvolume zurueckkopieren.
3. APFS-Volume entfernen.

```bash
# Beispiel: Daten rueckkopieren
rsync -a "/Volumes/RF-Arbeitsbereich/" "$HOME/dev/projects/"

# Beispiel: APFS-Volume loeschen (Name oder Disk-ID vorher sicher pruefen)
diskutil apfs deleteVolume "/Volumes/RF-Arbeitsbereich"
```

Wichtig: Vor `deleteVolume` immer mit `diskutil apfs list` gegenpruefen, dass das richtige Ziel ausgewaehlt ist.

### Zusatz: Verhalten bei `rsync` Code 24 (`file has vanished`)

- Ursache: Quelle aendert sich waehrend der Kopie (typisch bei laufenden App-Diensten).
- Bewertung: Nicht automatisch kritisch.
- Vorgehen:

```bash
rsync -a --partial "<QUELLE>/" "<ZIEL>/"
du -sh "<QUELLE>" "<ZIEL>"
```

- Wenn ein erneuter Resume-Lauf ohne Fehler durchlaeuft und Ziel konsistent ist, kann die lokale Quelle geloescht werden.

## 6) Betriebsregeln gegen erneuten Vollstand

1. Bei freiem Platz < 15 GB: Warnstufe GELB.
2. Bei freiem Platz < 8 GB: Warnstufe ROT, keine grossen Sync-Aufgaben.
3. Upload-/Sync-Tools drosseln, wenn Warnstufe ROT aktiv ist.
4. Woechentliche Pruefung von `Library`, `Music`, `CloudStation`.

## 7) Schnellcheck (Copy/Paste)

```bash
df -h /
du -xhd 1 "$HOME" 2>/dev/null | sort -h | tail -n 20
tmutil listlocalsnapshots /
```

## 8) Verantwortlichkeit

- Betriebsleiter: Freigabe fuer APFS-Aenderungen und Quota-Werte.
- IT-Bereich: Umsetzung, Nachkontrolle, Dokumentationspflege.
