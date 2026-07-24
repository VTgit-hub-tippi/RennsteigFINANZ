# Finanzplanung 5.0 — VBA-Analyse
        
## Quelldatei
- **Pfad (Windows):** `smb://win22-fileprint/MRT/Vermittler/Volker Tippmann/Finanzplanung/Programm/Entwicklung/Programm Finanzplanung 5.0.xls`
- **Pfad (Mac):** `/Users/volkertippmann/CloudStation/Documents/Finanzplanung/Programm/Programm Finanzplanung 5.0.xls`
- **Format:** Microsoft Excel 97-2003 (.xls, OLE2-binär)
- **Größe:** ~5,2 MB
- **Letzte Änderung (Windows):** 22.07.2026

## Umgebungsinteraktionen

### Kundenpfade (Produktiv)
- **Pfad:** `smb://win22-fileprint/MRT/RF intern/Firma/Organisation/Leitung/Bestandsverwaltung/Kunden`
- **Funktion:** Kundendatenverwaltung, Bestandsabgleich, Finanzplanungs-Kundendaten

### Testumgebung (Mac/Untitled)
- **Pfad:** `/Volumes/MRT/Vermittler/Volker Tippmann/Finanzplanung/Programm/Testumgebung VScode Programm`
- **Status:** Lokal über tools/setup-testumgebung-mrt.sh eingerichtet

## VBA-Struktur (Zu analysieren)

### Module (erfasst werden durch VBA-Extraktion)
- [ ] Formular-Module
- [ ] Standard-Module
- [ ] Klassen-Module
- [ ] Blatt-Module

### Kritische Prozeduren
- [ ] Initialisierungsprozeduren
- [ ] Pfad-Konstruktoren
- [ ] Datei-I/O-Operationen
- [ ] Umgebungs-Abfragen

## Abhängigkeiten (zu erfassen)

### Externe Verknüpfungen
- [ ] ActiveX-Steuerelemente
- [ ] Externe Dateien (CSV, TXT, XLS)
- [ ] DLL/OCX-Komponenten
- [ ] VEMA-Schnittstellen (BiPro?)

### Windows-spezifische APIs
- [ ] Datei-APIs
- [ ] Registry-Zugriff
- [ ] Shell-Integration
- [ ] Druckspooler

## Synchronisierungsstrategie

### Automatische Sync Mac ↔ Windows
**Tool:** `tools/sync-finanzplanung.sh` (zu erstellen)
- Prüfe Windows-Datei auf Änderung
- Bei Delta: Kopiere nach Mac lokal
- Benachrichtige Nutzer
- Dokumentiere Versionshistorie in Git

### Versionskontrolle
- XLS bleibt in Git (binär, aber wichtig für Audit)
- VBA-Code wird extrahiert und als TXT versioniert
- Änderungslogik: Windows-Änderung → Git-Commit → Mac-Pull

---
Bericht generiert: $(date)
