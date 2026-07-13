# Storage Remediation 2026-07-08

## Ziel
Wiederkehrendes Volllaufen von Macintosh HD (Data) stabilisieren, ohne externe Auslagerung.

## Ausgangslage (Baseline)
Quelle: recovery/disk-baseline-20260708-220143.txt
- Data-Volume praktisch voll: nur ca. 29-40 MiB frei.
- Kandidatenprozesse: backupd, mds/mdworker, cloudd/bird, photoanalysisd, frueher rsync.

## Durchgefuehrte Massnahmen (nur intern)
1. Externe Auslagerung verworfen und rueckgaengig gemacht.
2. Telegram Teil-Downloads geloescht (`*_partial`).
3. User-Caches und Papierkorb intern bereinigt.

## Ergebnis
- Freier Platz auf Data aktuell bei ca. 2.0 GiB.
- Damit akute Blockade deutlich reduziert, aber noch kein komfortabler Puffer.

## Verbleibende Haupttreiber
1. DEVONthink Datenbestand: ca. 77 GiB.
   - Darin zwei Backup-Ordner je ca. 5.0 GiB (zusammen ca. 10 GiB).
2. Telegram Group Container: ca. 3.4 GiB.
   - Hauptdatei `db_sqlite`: ca. 1.8 GiB.

## Risiko-Einschaetzung
- System bleibt bei nur 2 GiB frei stoeranfaellig (Updates, Caches, Indizierung).
- Zielwert fuer robusten Betrieb: mindestens 10-20 GiB frei.

## Naechste Schritte (intern, kontrolliert)
P0:
- Mit App-Logik bereinigen statt Dateisystem-Harddelete:
  - Telegram: Cache in der App loeschen/limitieren.
  - DEVONthink: Backup-Retention pruefen und alte Backups in der App entfernen.
P1:
- Nach jeder Massnahme `df -h /System/Volumes/Data` Delta messen und dokumentieren.
P2:
- Optional: wiederkehrenden Check als Skript/Task anlegen (nur read-only Monitoring).

## Guardrails
- Keine automatische externe Auslagerung.
- Keine Loeschung produktiver Nutzdaten ohne explizite Entscheidung.
- Vor risikoreichen Schritten immer zuerst Messung + erwarteter Gewinn.
