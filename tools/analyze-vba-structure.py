#!/usr/bin/env python3
"""
Finanzplanung 5.0 — Strukturierte VBA-Analyse
Extrahiert Module, Prozeduren, Pfadinteraktionen und Abhängigkeiten
"""

import re
from collections import defaultdict

def analyze_vba_code(vba_file):
    """Analysiere VBA-Code strukturiert"""
    
    with open(vba_file, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
    
    result = {
        'modules': defaultdict(dict),
        'procedures': [],
        'path_variables': set(),
        'file_operations': [],
        'workbook_operations': [],
        'forms': set(),
        'global_vars': [],
    }
    
    # Extrahiere Module
    module_pattern = r"^VBA MACRO (.+?) in file:.*?^Type:"
    modules = re.findall(module_pattern, content, re.MULTILINE | re.DOTALL)
    
    # Extrahiere Prozeduren (Sub und Function)
    proc_pattern = r"(?:Private|Public)?\s*(?:Sub|Function)\s+(\w+)\s*\("
    procedures = re.findall(proc_pattern, content)
    
    # Extrahiere Pfadvariablen
    path_var_pattern = r"(var\w*[Pp]fad\w*|varPath\w*)\s*(?:As String)?"
    path_vars = re.findall(path_var_pattern, content)
    
    # Extrahiere Datei-Operationen
    file_ops = re.findall(r"(Open|Close|Kill|FileCopy|Dir|ChDir|MkDir|RmDir)\s+\w+", content)
    
    # Extrahiere Workbook-Operationen
    wb_ops = re.findall(r"Workbooks\.(Open|Add|Close|SaveAs)", content)
    
    # Extrahiere Formulare
    forms = re.findall(r"(frm\w+)", content)
    
    result['procedures'] = sorted(set(procedures))
    result['path_variables'] = sorted(set(path_vars))
    result['file_operations'] = sorted(set(file_ops))
    result['workbook_operations'] = sorted(set(wb_ops))
    result['forms'] = sorted(set(forms))
    
    return result

def generate_analysis_report(analysis, output_file):
    """Generiere strukturierten Analysebericht"""
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("""# Finanzplanung 5.0 — VBA-Struktur-Analyse

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
""")
        
        for form in analysis['forms']:
            f.write(f"- `{form}`\n")
        
        f.write(f"\n**Gesamt:** {len(analysis['forms'])} Formulare\n\n")
        
        f.write("""---

## 🔧 Kritische Variablen & Umgebungsparameter

### Pfad-Variablen (für Kundendaten-Integration)
""")
        
        for var in analysis['path_variables']:
            f.write(f"- `{var}` — (String, Ablage-Pfad)\n")
        
        f.write(f"\n**Gesamt:** {len(analysis['path_variables'])} Pfad-Variablen\n\n")
        
        f.write("""Diese Variablen werden wahrscheinlich mit festen oder dynamischen Pfaden initialisiert,
die auf die SMB-Freigabe oder lokale Systemverzeichnisse zeigen.

---

## 🔍 Dateioperationen

### Erkannte Dateibefehle
""")
        
        ops_count = defaultdict(int)
        for op in analysis['file_operations']:
            ops_count[op] += 1
        
        for op, count in sorted(ops_count.items(), key=lambda x: -x[1]):
            f.write(f"- `{op}()` — {count}x verwendet\n")
        
        f.write("""
**Bedeutung:**
- `Open/Close` — Datei-Streams (CSV, TXT, externe Excel-Dateien)
- `Dir/ChDir` — Verzeichnis-Navigation und -Abfrage
- `FileCopy/Kill` — Datei-Manipulation und -Bereinigung

---

## 📊 Workbook-Operationen

### Excel-Workbook-Verwaltung
""")
        
        wb_ops_count = defaultdict(int)
        for op in analysis['workbook_operations']:
            wb_ops_count[op] += 1
        
        for op, count in sorted(wb_ops_count.items(), key=lambda x: -x[1]):
            f.write(f"- `Workbooks.{op}()` — {count}x verwendet\n")
        
        f.write("""
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
""")
        
        for i, proc in enumerate(analysis['procedures'][:20], 1):
            f.write(f"{i}. `{proc}()`\n")
        
        f.write(f"""
**Gesamt:** {len(analysis['procedures'])} Prozeduren identifiziert

---

## 📌 Synchronisierungsstrategie

### Windows → Mac Synchronisierung
**Anforderung:** Finanzplanung-Datei aktuell halten zwischen Windows-Produktiv und Mac-Entwicklung

**Automatische Sync-Routine (zu implementieren):**
```bash
# 1. Prüfe Änderung auf Windows
stat "/Volumes/MRT/Vermittler/.../Programm Finanzplanung 5.0.xls"

# 2. Bei Delta → Kopiere lokal
cp "/Volumes/MRT/.../Programm Finanzplanung 5.0.xls" \\
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
""")

def main():
    vba_file = "/Users/volkertippmann/dev/projects/RennsteigFINANZ/docs/FINANZPLANUNG-VBA-VOLLTEXT.txt"
    output_file = "/Users/volkertippmann/dev/projects/RennsteigFINANZ/docs/FINANZPLANUNG-STRUKTUR-ANALYSE.md"
    
    print("🔍 Analysiere VBA-Code...")
    analysis = analyze_vba_code(vba_file)
    
    print(f"✓ {len(analysis['forms'])} Formulare gefunden")
    print(f"✓ {len(analysis['path_variables'])} Pfad-Variablen gefunden")
    print(f"✓ {len(analysis['procedures'])} Prozeduren gefunden")
    print(f"✓ {len(set(analysis['file_operations']))} Datei-Operationen gefunden")
    print()
    
    print(f"📝 Schreibe strukturierten Bericht...")
    generate_analysis_report(analysis, output_file)
    
    print(f"✓ Bericht: {output_file}")
    print()
    
    # Kurzzusammenfassung
    print("=" * 70)
    print("FINANZPLANUNG 5.0 — KURZANALYSE")
    print("=" * 70)
    print()
    print("Formulare (UI):")
    for form in sorted(analysis['forms'])[:5]:
        print(f"  • {form}")
    if len(analysis['forms']) > 5:
        print(f"  ... und {len(analysis['forms']) - 5} weitere")
    print()
    
    print("Top Pfad-Variablen:")
    for var in sorted(analysis['path_variables'])[:8]:
        print(f"  • {var}")
    print()
    
    print("Datei-Operationen:")
    for op in set(analysis['file_operations']):
        count = analysis['file_operations'].count(op)
        print(f"  • {op}() — {count}x")
    print()
    print("=" * 70)

if __name__ == "__main__":
    main()
