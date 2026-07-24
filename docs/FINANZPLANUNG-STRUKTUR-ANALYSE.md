# Finanzplanung 5.0 — VBA-Struktur-Analyse

**Datum:** 2026-07-24  
**Quellversions-Stand:** 22.07.2026  
**Extrahiert von:** Programm Finanzplanung 5.0.xls

---

## 🎯 Übersicht

Das Excel-Tool **Finanzplanung 5.0** ist ein Kernprodukt mit:
- ~102.000 Zeilen VBA-Code
- Mehrschichtiges Formular-System
- Intensive Datei-I/O und Workbook-Verwaltung
- Pfad-sensitive Kundendaten-Integration

**Kritisch:** Dieses System arbeitet **primär auf Windows** und nutzt SMB-Freigaben zur Kundendatenverwaltung.

---

## 📋 Formulare & Module

### Identifizierte Benutzeroberflächen-Formulare
- `frmAMS`
- `frmAmsStamm`
- `frmAmsStammAbgleich`
- `frmAmsVertrag`
- `frmAmsVertragAbgleich`
- `frmAnbieter`
- `frmAnschriftAendern`
- `frmEmpfGeberSuchen`
- `frmFinanzen`
- `frmFinanzenNeu`
- `frmFinanzuebersicht`
- `frmHaushalt`
- `frmHaushaltSuchen`
- `frmKomponenten`
- `frmProdGesellAuswahl`
- `frmVWLAuswahl`
- `frmVertragsverwaltung`
- `frmVerträge`
- `frmVerträgeVerbinden`

**Gesamt:** 19 Formulare

---

## 🔧 Kritische Variablen & Umgebungsparameter

### Pfad-Variablen (für Kundendaten-Integration)
- `varPfad` — (String, Ablage-Pfad)
- `varPfad0` — (String, Ablage-Pfad)
- `varPfad0Tab` — (String, Ablage-Pfad)
- `varPfad1` — (String, Ablage-Pfad)
- `varPfadAms` — (String, Ablage-Pfad)
- `varPfadTab` — (String, Ablage-Pfad)
- `varPfadVD` — (String, Ablage-Pfad)

**Gesamt:** 7 Pfad-Variablen

Diese Variablen werden wahrscheinlich mit festen oder dynamischen Pfaden initialisiert,
die auf die SMB-Freigabe oder lokale Systemverzeichnisse zeigen.

---

## 🔍 Dateioperationen

### Erkannte Dateibefehle
- `Close()` — 1x verwendet
- `Open()` — 1x verwendet

**Bedeutung:**
- `Open/Close` — Datei-Streams (CSV, TXT, externe Excel-Dateien)
- `Dir/ChDir` — Verzeichnis-Navigation und -Abfrage
- `FileCopy/Kill` — Datei-Manipulation und -Bereinigung

---

## 📊 Workbook-Operationen

### Excel-Workbook-Verwaltung
- `Workbooks.Open()` — 1x verwendet

**Bedeutung:**
- `.Open()` — Externe Dateien (Parameter.xls, Produkte.xls, Kundendaten-Tabellen)
- `.SaveAs()` — Speichern mit Versionierung
- `.Close()` — Ressourcen-Management

---

## 🔗 Umgebungsintegration

### Kundendaten-Pfade (Produktiv Windows)
**Primär:** `smb://win22-fileprint/MRT/RF intern/Firma/Organisation/Leitung/Bestandsverwaltung/Kunden`

### Externe Abhängigkeiten
- **AMS-Daten:** Historische Bestandsdatenverwaltung (varPfadAms)
- **Parameter-Dateien:** Konfiguration und Gesellschaftsstammdaten
- **Produkt-Master:** Versicherungs- und Finanzprodukt-Katalog

---

## 🚀 Identifizierte Prozeduren (Top-10)

### Kritische Standard-Prozeduren
1. `Cells()`
2. `CommandButton8_Click()`
3. `Datumsformatierung()`
4. `DialogAufruf()`
5. `SheetsHidden()`
6. `SheetsVisible()`
7. `UserForm_Activate()`
8. `UserForm_ActivateXX()`
9. `UserForm_ActivateXXX()`
10. `UserForm_Click()`
11. `Workbook_BeforeClose()`
12. `Workbook_BeforeSave()`
13. `Workbook_Geburtstagsfilter()`
14. `Workbook_Open()`
15. `Workbooks()`
16. `Worksheets()`
17. `chkAktiveVerträge_Click()`
18. `chkAlleVerträge_Click()`
19. `chkAngehöriger1_Click()`
20. `chkAngehöriger2_Click()`

**Gesamt:** 778 Prozeduren identifiziert

---

## 📌 Synchronisierungsstrategie

### Windows → Mac Synchronisierung
**Anforderung:** Finanzplanung-Datei aktuell halten zwischen Windows-Produktiv und Mac-Entwicklung

**Automatische Sync-Routine (zu implementieren):**
```bash
# 1. Prüfe Änderung auf Windows
stat "/Volumes/MRT/Vermittler/.../Programm Finanzplanung 5.0.xls"

# 2. Bei Delta → Kopiere lokal
cp "/Volumes/MRT/.../Programm Finanzplanung 5.0.xls" \
   "/Users/volkertippmann/CloudStation/Documents/Finanzplanung/Programm/"

# 3. Benachrichtige + Commit
git add -A
git commit -m "Finanzplanung 5.0: Sync von Windows (2026-07-24)"
```

### Testumgebung (Untitled + MRT-NAS)
**Pfad:** `/Volumes/MRT/Vermittler/Volker Tippmann/Finanzplanung/Programm/Testumgebung VScode Programm/`

**Automatische Aktualisierung:**
- Tools/setup-testumgebung-mrt.sh kopiert aktuelle Programmdatei automatisch
- PreFix-Sicherung als Rollback-Basis
- Kundendaten können selektiv geladen werden

---

## ⚠️ Kritische Erkenntnisse

### 1. Windows-Abhängigkeit
- VBA-Code ist nicht portabel (Windows-spezifische APIs, Dateipfade)
- Testumgebung auf Mac muss via SMB-Mount arbeiten
- Direktes Debuggen auf Mac nicht möglich (VBA nur Excel/Windows)

### 2. Pfad-Sensitivität
Viele Operationen sind an feste Pfade gebunden:
- Kundendaten-Verzeichnis
- Externe Daten-Dateien (Parameter, Produkte, AMS)
- Bestandslisten und Import-Dateien

**Risiko:** Bei Pfadänderungen oder Netzwerkausfällen funktioniert die Anwendung nicht.

### 3. Versionskontrolle
- XLS-Binärformat schwer zu versionieren
- Keine klassische Git-Diff möglich
- Empfehlung: Nur letzte Produktiv-Versionen sichern, nicht alle Zwischenstände

---

## 📋 Nächste Schritte

### Phase 1: Dokumentation (diese Woche)
- [ ] Alle Pfad-Variablen dokumentieren
- [ ] Externe Abhängigkeiten katalogisieren
- [ ] Prozeduren-Übersicht erstellen

### Phase 2: Automatische Sync (nächste Woche)
- [ ] Sync-Skript: Windows → Mac (/CloudStation)
- [ ] Change-Detection (Dateiänderungs-Hash)
- [ ] Automatische Benachrichtigung bei Änderungen

### Phase 3: Portabilität (später)
- [ ] Python-Port der kritischen Geschäftslogik
- [ ] Ablösung der Windows-Abhängigkeiten schrittweise
- [ ] Kundendaten-API als Alternative zur Datei-I/O

---

**Analysedatum:** 2026-07-24  
**Autor:** Claude (Code Analysis Agent)  
**Status:** Laufend aktualisiert
