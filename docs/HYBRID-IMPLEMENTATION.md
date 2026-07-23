<!-- markdownlint-disable MD007 MD009 MD022 MD029 MD032 MD034 MD060 -->

# HYBRID-IMPLEMENTATION: VBA/Finanzplanung ↔ Python/RennsteigFINANZ-App

> **Dual-Stack-Strategie für Enterprise-Finanzplanungs-Tool**
> 
> - **Windows:** VBA/Finanzplanung V.XXX (Produktiv, agil, schnell)
> - **Mac:** Python/RennsteigFINANZ-App V.XXX (Parallel-Entwicklung, modern, versioniert)

---

## 📊 Systemdefinition

### Was das Tool macht
- ✅ Professionelle **Haushaltsübersicht** (komplette Finanzübersicht pro Kunde/Haushalt)
- ✅ **Komplexe Finanzierungen** (Refinanzierungen, Szenarien)
- ✅ **Bedarfsanalysen** (5 Säulen: Versichern, Sparen, Finanzieren, Rechtliche Vorsorge, Investmentmanagement)
- ✅ **Vermögensaufbau & Altersvorsorgeplanungen**
- ✅ **Erben & Schenken** (Nachlassplanung)
- ✅ **Risikodeckungen & -analysen** (Biometrische Risiken)
- ✅ **Kampagnen & Aktionen** (Marketing, Abschluss-Management)
- ✅ **Korrespondenzen** (Schreiben-Generator, Vorlagen)
- ✅ **Dokumentenmanagement** (Integration mit Pfadstruktur, Ablage)
- ✅ **Datenmodell:** ID-gesteuerte Selektionen, Tabellenstruktur

**Größe der Aufgabe:** Enterprise-LoB-System, nicht trivial  
**Komplexität:** Modular, ID-gesteuert, stabil (selten geändert)  
**Update-Frequenz:** ~monatlich (nicht im ständigen Flux)

---

## 🏗️ Architektur-Strategie

### Phase 1: Dual-Stack für Wissenstransfer (Woche 1-4)

```
Windows (Produktiv):
  VBA/Finanzplanung V.001 (bestehend)
      ↓ (analysieren, dokumentieren)
      ↓ (ID-Logik, Datenmodell, Geschäftsregeln)
  
Mac (Parallel-Entwicklung):
  Python/RennsteigFINANZ-App V.001 (Neubau)
      ← (Logik portieren, Tests schreiben)
      ← (Moderne Architektur, Git-versioniert)
      
Validation:
  Windows Input → Python Output = Identisch?
  (End-to-End-Tests pro Use-Case)
```

### Phase 2: Langfristig Python als Quelle der Wahrheit (Monat 2-12)

```
Mac wird zur Primary Implementation:
  - Python/RennsteigFINANZ-App wird erweitert
  - Alle neuen Features zuerst in Python
  - Windows wird "Reporting Layer" (Displays Python-API)
  
Windows wird optional/legacy:
  - Weiterhin voll funktionsfähig
  - Wird zu "bekannte Probleme, bitte auf Mac testen"
  - Wird schrittweise auf Python-Backend umgestellt
```

---

## 📋 Erkenntnis-Phase: Morgen am Windows-Arbeitsplatz

**Aufgabe:** VBA-Code & Datenmodell verstehen

### Was wir analysieren:
1. **VBA-Quellcode-Struktur**
   - Welche Funktionen / Subroutinen?
   - Input-Parameter → Output-Ergebnisse?
   - Welche External APIs (VEMA, Outlook, Dateisystem)?
   - Datenbankbindung oder CSV/Excel-basiert?

2. **Excel-Datenmodell**
   - Tabellen-Layout pro Use-Case
   - Spalten, Datentypen, Berechnungen
   - Verknüpfungen zwischen Tabellen
   - Welche Spalten sind "ID-gesteuert"?

3. **Kritische Geschäftslogik**
   - Kalkulations-Formeln (welche sind mathematisch, welche regelbasiert?)
   - Abhängigkeiten zwischen Modulen (Haushalt → Finanzierung → Risikodeckung)
   - Fehlerbehandlung, Validierung

4. **Dokumentation lücken**
   - Was ist dokumentiert, was nicht?
   - Wohin müssen wir "reverse-engineeren"?

### Ergebnis nach morgen:
- [ ] Screenshots/Export der VBA-Struktur
- [ ] Tabellen-Schemas dokumentiert
- [ ] Top 3 Use-Cases identifiziert (für Python-Port Priorisierung)
- [ ] Aufwand-Schätzung: wie komplex ist der Port?

---

## 🔄 Dual-Stack-Roadmap (4 Wochen)

### **Woche 1 (24.07-26.07): Analysis & Setup**

**Windows:**
- [ ] VBA-Code in Struktur gebracht (Screenshot/Dokumentation)
- [ ] Erste UC (Use-Case) identifiziert, z.B. "Haushalts-Übersicht"
- [ ] Input-Daten definiert, Output-Ergebnis dokumentiert

**Mac:**
- [ ] `src/python/rennsteigfinanz_app/` Verzeichnis aufgebaut
- [ ] `requirements.txt`: PyQt6, pandas, pytest
- [ ] Skeleton-App: "Hallo RennsteigFINANZ"
- [ ] Git-Branches: `feature/uc-001-vb` und `feature/uc-001-python`

**Git:**
- [ ] Beide Branches in main
- [ ] Dokumentation: `docs/HYBRID-IMPLEMENTATION.md` (dieses Dokument)

### **Woche 2-3 (29.07-09.08): First Use-Case Implementation**

**Windows:**
- [ ] VB-Skript für UC-001 (Haushalts-Übersicht): vollständig dokumentiert
- [ ] Test-Daten: Beispielhaushalt mit erwarteten Ergebnissen
- [ ] Fehler-Protokoll: Welche Edge-Cases?

**Mac:**
- [ ] Python-Core für UC-001 geschrieben
- [ ] GUI (PyQt): Eingabe-Felder, Berechnung starten, Ergebnis anzeigen
- [ ] Tests (pytest): Input → Output validieren gegen Windows-Ergebnisse
- [ ] CI-Integration: Tests bei jedem Commit

**Git:**
- [ ] Pull Requests: Windows-Code Review, Mac-Code Review
- [ ] Cross-Team: Windows-Team prüft Python-Logik, Mac-Team prüft VB-Verständnis

### **Woche 4 (12.08-16.08): Validation & Release**

**Beide:**
- [ ] End-to-End-Tests: 5 Szenarien, beide Implementierungen
- [ ] Performance: VB vs Python Vergleich (Speed, Memory)
- [ ] Dokumentation fertig: VB-zu-Python-Mapping

**Release:**
- [ ] Merge in `main`
- [ ] Tag: `v0.1-hybrid-uc-001`
- [ ] Release Notes: Was funktioniert, was noch nicht, nächste Steps

---

## 📁 Git-Struktur

```
RennsteigFINANZ/
├── src/
│   ├── vba/                            ← Windows VB-Skripte
│   │   ├── UC-001-Haushaltsübersicht.vbs
│   │   ├── UC-002-Finanzierung.vbs
│   │   ├── UC-003-Risikodeckung.vbs
│   │   └── README.md (Struktur, APIs, Datenmodell)
│   │
│   └── python/                         ← Mac Python-App
│       ├── rennsteigfinanz_app/
│       │   ├── core/
│       │   │   ├── household.py        ← UC-001 Logic
│       │   │   ├── financing.py        ← UC-002 Logic
│       │   │   ├── risk.py             ← UC-003 Logic
│       │   │   └── __init__.py
│       │   ├── gui/
│       │   │   ├── main.py             ← PyQt Main Window
│       │   │   ├── household_ui.py     ← UC-001 GUI
│       │   │   └── __init__.py
│       │   └── __init__.py
│       ├── tests/
│       │   ├── test_household.py       ← UC-001 Tests
│       │   ├── test_financing.py       ← UC-002 Tests
│       │   └── conftest.py
│       ├── requirements.txt
│       ├── setup.py
│       └── README.md
│
├── docs/
│   ├── HYBRID-IMPLEMENTATION.md        ← Strategy (dieses Dokument)
│   ├── VB-PYTHON-MAPPING.md            ← "Funktion X in VB → Modul Y in Python"
│   ├── DATA-MODEL.md                   ← Tabellen-Schemas, Verknüpfungen
│   └── TEST-PLAN.md                    ← End-to-End Szenarien
│
├── tests/                              ← Integration Tests
│   └── e2e/
│       ├── test_uc001_household.py
│       └── fixtures/
│           └── sample_data.xlsx
│
└── ... (rest bleibt gleich)
```

---

## 🎯 Kriterien für Erfolg (Definition of Done)

### Nach Woche 1:
- [ ] Windows-VBA analysiert & dokumentiert
- [ ] UC-001 Datenmodell kartographiert
- [ ] Python-Skeleton läuft auf Mac
- [ ] Git-Branches established

### Nach Woche 4:
- [ ] UC-001 komplett implementiert (VB + Python)
- [ ] 5 End-to-End-Szenarien: beide Systeme → gleiche Ergebnisse ✓
- [ ] Tests grün (pytest mit 80%+ Code Coverage)
- [ ] Dokumentation: VB-zu-Python-Mapping fertig
- [ ] Release-Tag gemerkt

---

## 🚀 Langfristige Roadmap (nach v0.1)

### Monat 2: UC-002 (Finanzierung) portieren
- [ ] VB-Analyse
- [ ] Python-Core schreiben
- [ ] GUI erweitern
- [ ] Tests

### Monat 3-4: UC-003 (Risikodeckung) portieren
- [ ] Parallel Python reift
- [ ] VB bleibt stabil (Bugfixes nur)

### Monat 5+: Python wird primary
- [ ] Neue Features zuerst in Python
- [ ] Windows wird auf Python-API aufgebaut (Proxy-Calls)
- [ ] VB schrittweise deprecated

---

## ❓ Offene Fragen (für morgen)

1. **Auf welcher Datenbasis arbeitet das Tool?**
   - Nur Excel-intern? Oder auch externe Datenquellen (VEMA, SQL, etc.)?
   
2. **Wie ist die Nutzer-Interaktion?**
   - Welche Eingaben macht der Berater? (über Excel-UI oder Formulare?)
   - Welche Outputs erwartet er? (PDF, Excel-Export, Visualisierung?)

3. **Gibt es bestehende Tests?**
   - VB-Unit-Tests vorhanden?
   - Test-Daten/Szenarien dokumentiert?

4. **Performance-Anforderungen?**
   - Wie schnell muss die Berechnung sein? (< 1 Sekunde? < 10 Sekunden?)
   - Speicher-Constraints?

5. **Abhängigkeiten zu anderen Tools?**
   - Muss Finanzplanung mit VEMA kommunizieren? Outlook? Andere?

---

## 📌 Status

**Erstellt:** 2026-07-23  
**Gültig ab:** 2026-07-24 (nach Windows-Analyse)  
**Review-Termin:** Nach Woche 1 (27.07.2026)

---

## 🔗 Verwandte Dokumente

- [TOPOLOGIE-ZENTRALE-ABLAGE.md](TOPOLOGIE-ZENTRALE-ABLAGE.md) — Wo Code lebt
- [ENTWICKLUNGSHISTORIE.md](ENTWICKLUNGSHISTORIE.md) — Wie wir hier angekommen sind
- [ENTSCHEIDRASTER-VORLAGE.md](ENTSCHEIDRASTER-VORLAGE.md) — Entscheidungsmethode für Trade-offs
- [CLAUDE.md](../CLAUDE.md) — Spielregeln für diesen Betrieb

