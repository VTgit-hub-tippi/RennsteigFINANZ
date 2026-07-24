#!/usr/bin/env python3
"""
Analyse: Programm Finanzplanung 5.0.xls — VBA-Struktur und Umgebungsinteraktion

Ziel: VBA-Module, Prozeduren, Umgebungsvariablen und externe Pfadinteraktionen erfassen.
"""

import sys
import os
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

def analyze_xls_structure(xls_file):
    """Analysiere XLS-Dateistruktur (OLE2-Format)"""
    
    print(f"📊 Analysiere: {xls_file}")
    print(f"   Größe: {os.path.getsize(xls_file) / 1024 / 1024:.1f} MB")
    print(f"   Format: Microsoft Excel 97-2003 (.xls = OLE2)")
    print()
    
    # XLS ist OLE2, nicht ZIP — aber wir können die Struktur prüfen
    try:
        # Versuche mit Python's zipfile (funktioniert nicht bei OLE2, aber wir fangen ab)
        with zipfile.ZipFile(xls_file, 'r') as z:
            print("   ⚠️  Format scheint ZIP/XLSX zu sein")
            files = z.namelist()
            print(f"   Dateien: {len(files)}")
            for f in sorted(files)[:20]:
                print(f"      {f}")
    except zipfile.BadZipFile:
        print("   ✓ Format ist OLE2 (binär, nicht extrahierbar via ZIP)")
        print()
        print("   Lösung: Verwende specialized XLS-Parser (xlrd, openpyxl)")
        print()
        return analyze_with_xlrd(xls_file)

def analyze_with_xlrd(xls_file):
    """Verwende xlrd zur VBA-Analyse"""
    try:
        import xlrd
        print("   📖 xlrd-Analyse:")
        
        book = xlrd.open_workbook(xls_file, on_demand=True)
        
        print(f"   • Sheets: {book.nsheets}")
        for sheet in book.sheet_names():
            print(f"      - {sheet}")
        
        print(f"   • Encoding: {book.encoding}")
        print(f"   • Named Ranges: {len(book.name_map)}")
        
        # Versuche, auf Makros zuzugreifen (wenn vorhanden)
        if hasattr(book, 'macros'):
            print(f"   • Makros: {len(book.macros)} gefunden")
            for macro in book.macros:
                print(f"      - {macro}")
        else:
            print("   • Makros: Können mit xlrd nicht direkt extrahiert werden")
        
        print()
        print("   ⚠️  Für VBA-Code-Extraktion:")
        print("      Verwende: olevba (pip install olevba)")
        print()
        
        return book
        
    except ImportError:
        print("   ❌ xlrd nicht installiert. Installiere: pip install xlrd")
        return None

def analyze_with_olevba(xls_file):
    """Verwende olevba zur VBA-Makro-Extraktion"""
    try:
        import olevba
        
        print("   🔍 olevba-Makro-Analyse:")
        print()
        
        vba = olevba.VBA_Parser(xls_file)
        
        if vba.detect_vba_macros():
            print("   ✓ VBA-Makros gefunden!")
            print()
            
            macros = []
            for (filename, stream_path, vba_filename), code in vba.extract_macros():
                macros.append({
                    'file': filename,
                    'stream': stream_path,
                    'vba': vba_filename,
                    'code': code
                })
            
            for i, macro in enumerate(macros, 1):
                print(f"   [{i}] {macro['vba']}")
                print(f"       Stream: {macro['stream']}")
                print()
                
                # Zähle Prozeduren
                lines = macro['code'].split('\n')
                procs = [l for l in lines if l.strip().startswith('Sub ') or l.strip().startswith('Function ')]
                print(f"       Prozeduren: {len(procs)}")
                for proc in procs[:5]:
                    print(f"          {proc.strip()[:80]}")
                if len(procs) > 5:
                    print(f"          ... und {len(procs)-5} weitere")
                print()
                
                # Suche Umgebungsinteraktionen
                print("       🔗 Umgebungsinteraktionen:")
                env_keywords = [
                    'CreateObject', 'GetObject', 'Shell', 'WScript', 'FileSystem',
                    'Environ', 'Scripting.FileSystemObject', 'VBShell', 'Dir ', 'ChDir',
                    'Open ', 'SaveAs', 'Load ', 'Workbook', 'Range', 'ThisWorkbook'
                ]
                
                interactions = set()
                for line in lines:
                    for keyword in env_keywords:
                        if keyword in line:
                            interactions.add(line.strip()[:100])
                
                for interaction in sorted(list(interactions))[:10]:
                    print(f"          {interaction}")
                if len(interactions) > 10:
                    print(f"          ... und {len(interactions)-10} weitere")
                print()
        else:
            print("   ⚠️  Keine VBA-Makros erkannt (oder passwortgeschützt)")
        
        vba.close()
        
    except ImportError:
        print("   ❌ olevba nicht installiert.")
        print("      Installiere: pip install oletools")
        print()

def generate_report(xls_file):
    """Generiere Analysebericht"""
    
    report_path = "/Users/volkertippmann/dev/projects/RennsteigFINANZ/docs/FINANZPLANUNG-VBA-ANALYSE.md"
    
    print(f"📝 Schreibe Bericht nach: {report_path}")
    print()
    
    with open(report_path, 'w') as f:
        f.write(f"""# Finanzplanung 5.0 — VBA-Analyse
        
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
""")
    
    print(f"✓ Bericht erstellt.")

if __name__ == "__main__":
    xls_file = "/Users/volkertippmann/CloudStation/Documents/Finanzplanung/Programm/Programm Finanzplanung 5.0.xls"
    
    if not os.path.exists(xls_file):
        print(f"❌ Datei nicht gefunden: {xls_file}")
        sys.exit(1)
    
    analyze_xls_structure(xls_file)
    analyze_with_olevba(xls_file)
    generate_report(xls_file)
    
    print()
    print("=" * 60)
    print("🔍 Nächste Schritte:")
    print("1. Installiere specialized Tools:")
    print("   pip install xlrd olevba")
    print()
    print("2. Führe erneut aus:")
    print("   python3 tools/analyze-finanzplanung-vba.py")
    print()
    print("3. Ergebnis liegt hier:")
    print("   docs/FINANZPLANUNG-VBA-ANALYSE.md")
    print("=" * 60)
