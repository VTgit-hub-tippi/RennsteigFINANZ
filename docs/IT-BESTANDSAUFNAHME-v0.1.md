# IT-Bestandsaufnahme v0.1 — RennsteigFINANZ

Statusdatum: 2026-07-08
Standort: lokaler macOS-Arbeitsrechner als gemeinsame Basis fuer Projekt und weitere Produktivnutzung.

## 1) Inventar (System, Apps, Tools, Office)

### 1.1 Systembasis
- Betriebssystem: macOS (laufendes Produktivsystem).
- Engpassbild: Wiederkehrendes Volllaufen des Data-Volumes.
- Aktueller Puffer: nach interner Bereinigung ca. 3.7 GiB frei (schwankend).

### 1.2 Projekttools
- VS Code + Copilot Arbeitsmodus.
- Git/GitHub als Versions- und Wahrheitsquelle.
- Projektdokumentation: STATUS, NEXT-ACTION, Recovery-Dokumente.

### 1.3 Produktiv-Apps (beobachtet)
- DEVONthink 3: grosser Datenbestand, Backup-Verzeichnisse und Files.noindex als Hauptverbraucher.
- Telegram: Datenbank + Mediencache relevant fuer Speicher.
- Fotos/Backup/Systemdienste: laufende Hintergrundlast moeglich.

### 1.4 Office-Stack (fachlich notwendig)
- Microsoft Office: Word, Excel.
- Apple iWork: Pages, Numbers.
- PDF-Workflows fuer Austausch und Archiv.

## 2) Abhaengigkeiten zum Projektbetrieb

1. Speicherpuffer beeinflusst direkt:
- Stabilitaet von Editor, Build/Analyse, Updates, Indexierung.

2. Hintergrundprozesse beeinflussen indirekt:
- backupd, mds/mdworker, cloud/sync-nahe Dienste, Fotoanalyse.

3. Dateiverwaltung beeinflusst direkt:
- Auffindbarkeit, Datenkonsistenz, Team-Austausch, Dokumentenqualitaet.

4. Office-Integration beeinflusst direkt:
- Externe Kommunikation, Reports, Tabellenlogik, Vertragsnahe Dokumente.

## 3) Risiken (P0/P1/P2)

### P0
1. Data-Volume laeuft erneut voll (< 5 GiB).
2. Projektbetrieb wird durch Systemdruck instabil.
3. Fehlentscheidungen bei Bereinigung beeintraechtigen App-Funktion.

### P1
1. Unklare Dateiablage und Medienbrueche zwischen Tools.
2. Nicht-standardisierte Office-Austauschpfade.
3. Wiederkehrende manuelle Notfallmassnahmen statt Routine.

### P2
1. Fehlende Automatisierung fuer Monitoring/Reporting.
2. Uneinheitliche Wartungsrhythmen.

## 4) Zugriffspfade und Infrastrukturwege

1. Lokal
- Primarweg fuer Entwicklung und Wartung.

2. Browser
- Alternative Weiterarbeit und Zugriff auf Cloud-/Webdienste.

3. GitHub
- Code, Historie, Nachvollziehbarkeit, Remote-Fortsetzung.

4. Dateiaustausch (Office)
- DOCX/XLSX/PDF sowie Pages/Numbers als Arbeits- und Uebergabeformate.

## 5) Integrationsanforderungen Office

1. Formatstrategie
- Intern: bearbeitbare Arbeitsformate (DOCX/XLSX/Pages/Numbers).
- Extern/Archiv: PDF als stabile Austausch- und Nachweisform.

2. Ablagekonzept
- Einheitliche Ordner fuer Vorlagen, Entwuerfe, Freigaben, Finalstaende.

3. Kompatibilitaet
- Vor Versand/export immer Schnellcheck auf Layout/Formeln/Zeichensaetze.

## 6) Laufender Storage-Track (P0)

1. Guardrails aktiv
- Keine externe Auslagerung als Standard.
- Keine destruktiven Schritte ohne Freigabe.
- App-Funktionalitaet hat Vorrang.

2. Erreicht
- Akute Lage von nahezu 0 auf mehrere GiB freien Speicher entschaerft.

3. Offen
- Stabiler Zielpuffer (>= 10 GiB, bevorzugt >= 20 GiB) noch nicht erreicht.

## 7) Konkrete naechste Schritte

1. Telegram in-App Cache-Limit setzen und Wirkung messen.
2. DEVONthink Backup-Retention app-seitig anpassen (statt roher Dateieingriffe).
3. Woechentliche IT-Routine nach docs/IT-WARTUNGSPLAN.md starten.
4. Dateiverwaltungsstandard fuer Maklerbetrieb als naechstes Dokument definieren.
