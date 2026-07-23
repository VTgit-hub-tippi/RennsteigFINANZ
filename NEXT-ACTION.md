<!-- markdownlint-disable MD007 MD009 MD022 MD029 MD032 MD060 -->

# NEXT-ACTION — Single Source of Next Work

Statusdatum: 2026-07-23 (aktualisiert nach Zentrale-Topologie-Session)

## AKTUELLE-AKTION (P0 — Diese Woche)

### Windows-Struktur aufbauen (Remote-Desktop, Arbeitsplatz Firma)
**Zeitpunkt:** 2026-07-24 (morgen)

**Aufgaben:**
1. Remote-Desktop am Windows-Arbeitsplatz anmelden
2. Git + Tools installieren (falls noch nicht vorhanden)
3. Repository klonen: `C:\dev\projects\RennsteigFINANZ\`
4. Struktur analog macOS (src/, docs/, logs/, tools/, data/, .git/)
5. `git remote -v` prüfen → `origin` zeigt auf GitHub
6. `git pull origin main` → Aktuellen Stand (inkl. Topologie-Doku) holen
7. Testdatei erstellen: `echo "Windows online" > WINDOWS-READY.txt`
8. Committen: `git add . && git commit -m "Windows-Setup abgeschlossen"` + push
9. Checkliste ausfüllen: `docs/WINDOWS-TOPOLOGIE-SETUP-CHECKLIST.md`

**Checkliste:** Wird vorbereitet  
**Verantwortung:** Nutzer (IT-Admin, vor Ort an Arbeitsplatz)

---

## 🎯 P1 — Nach Windows-Setup (ab 27.07.2026)

### Hybrid-Implementation starten: VBA/Finanzplanung ↔ Python/RennsteigFINANZ-App

**Strategie:** Parallel-Entwicklung für Enterprise LoB-System
```
Windows: VBA/Finanzplanung V.XXX (Produktiv, agil, schnell)
   ↓ (analysieren, dokumentieren)
Mac: Python/RennsteigFINANZ-App V.XXX (Moderne App, versioniert, testbar)
   ← (Logik portieren, Tests schreiben)
```

**Roadmap:**
- **Woche 1 (24-26.07):** VBA-Analyse + Python-Skeleton
  - Windows: VBA-Code analysieren, UC-001 Datenmodell dokumentieren
  - Mac: `src/python/rennsteigfinanz_app/` aufbauen
  - Git: Branches `feature/uc-001-vb` und `feature/uc-001-python`
  
- **Woche 2-3 (29.07-09.08):** UC-001 Implementierung
  - Windows: UC-001 (Haushaltsübersicht) VB-Skript komplett + Test-Daten
  - Mac: Python-Core + PyQt-GUI für UC-001 + pytest Tests
  - Git: Cross-Team Reviews
  
- **Woche 4 (12-16.08):** Validation & Release
  - End-to-End: 5 Szenarien VB vs Python → gleiche Ergebnisse
  - Merge in `main`, Tag: `v0.1-hybrid-uc-001`

**Details:** [HYBRID-IMPLEMENTATION.md](docs/HYBRID-IMPLEMENTATION.md)  
**Definition of Done:** UC-001 funktioniert auf Windows & Mac, Tests grün, Dokumentation fertig

---

## 🎯 P2 — Später (Backlog)

- Rollen- und Zugriffsrechte v0.1 (nach Hybrid v0.1)
- Datenmodell v0.1 (nach Hybrid v0.1)
- UC-002 (Finanzierung), UC-003 (Risikodeckung), UC-004 (Erben & Schenken)
- Compliance-Anforderungen pro Säule vertiefen

---

## 📋 Allgemeine Spielregeln

### Cleanup-Konvention (MANDATORY)
**Vor dem Löschen von Dateien/Ordnern:**
1. Auf Verwertbares prüfen (Protokolle, Logs, Fehler-Reports, Test-Daten)
2. Alles nach `logs/archive/YYYY-MM-DD/` archivieren
3. `logs/archive/YYYY-MM-DD/INDEX.md` erstellen/aktualisieren
4. Erst dann löschen

[Details: CLAUDE.md](CLAUDE.md)

### Session-Ritual (immer)
1. Vor Arbeit: `git status`, CLAUDE.md + STATUS.md lesen
2. Während: Änderungen dokumentieren, Commits granular
3. Nach: `git push`, STATUS.md aktualisieren

---

<!-- markdownlint-enable MD007 MD009 MD022 MD029 MD032 MD060 -->
