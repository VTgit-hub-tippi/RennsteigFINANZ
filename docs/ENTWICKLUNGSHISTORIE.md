<!-- markdownlint-disable MD007 MD009 MD022 MD029 MD032 MD034 MD060 -->

# ENTWICKLUNGSHISTORIE — Von Anfang bis aktuell

> **Chronologisches Projekttagebuch der RennsteigFINANZ-Infrastruktur und Fachkonkretisierung.**
> 
> Alle Meilensteine, Phasen und Erkenntnisse von 2026-07-07 bis heute dokumentiert.

---

## 📅 Phase 1: Infrastruktur-Debugging & Notfall-Stabilisierung (07.07.2026)

**Status:** ✅ Abgeschlossen | **Fokus:** Systemstabilität, Speicherkrise

### Ausgangslage
- macOS-System überlastet: CRITICAL-Speicher
- Music-App: ~1M fehlerhafte Symlinks (zirkuläre Referenzen, broken links)
- Laufwerk fragmentiert; Arbeitsfähigkeit stark eingeschränkt
- Kein strukturiertes Infrastruktur-Modell vorhanden

### Interventionen (manuelles Debugging)
1. **Music-App Analyse:** Systematische Symlink-Reparatur
   - 435 KB Fehler-Liste generiert
   - Zirkuläre Referenzen identifiziert (Loop-Report 70 KB)
   - Reparatur-Kandidaten geprieft (Scoring-Verfahren)
   - ~36-39 "fehlende Komponenten" restlich ungelöst

2. **Speicher-Remediation:** Lokale Entspannung
   - DEVONthink Backup gekürzt (ältere Datensicherung entfernt)
   - Telegram-Cache bereinigt (500+ MB)
   - adb-Fork-Server gestoppt (PID 2243)
   - Delta: +1.2 GiB, Status bleibt CRITICAL

3. **Dokumentation:**
   - Alle Analyse-Ausgaben als TXT archiviert
   - Chat-Verlauf bereinigt und versioniert
   - Setup-Skripte (`enterprise-setup-script.sh`) erstellt

### Lehren aus Phase 1
- **Früherkennung:** Automatisiertes Monitoring ist notwendig
- **Krise-Playbook:** Standardisierte Reparatur-Abläufe später etablieren
- **Archivierung:** Historische Protokolle sind wertvolle Referenzen (nicht löschen!)

### Archiv-Referenz
- `logs/archive/2026-07-07/` — 40+ detaillierte Protokolle
- `logs/archive/2026-07-07/INDEX.md` — Inhaltsverzeichnis

---

## 📅 Phase 2: Governance & Betriebsmodell (13.07.2026, Session 1)

**Status:** ✅ Abgeschlossen | **Fokus:** Spielregeln, zentrale Konventionen

### Hauptergebnisse

#### Repository-Gründung
- Git-Repository initialisiert (`/Users/volkertippmann/dev/projects/RennsteigFINANZ`)
- GitHub Remote konfiguriert (zentrale Wahrheitsquelle)
- `.git/` mit automatisierten Hooks vorbereitet

#### CLAUDE.md — Spielregeln als Maschinencode
```
- 🏛️ Betriebsmodell (3 Ebenen: Admin, Buchhaltung, Produktiv)
- 🤝 Grundregeln (Infrastruktur vor Inhalt, Idempotenz, Kontextbudget)
- 📊 Quellen der Wahrheit (STATUS.md, Git-History, GitHub Issues)
- 🔄 Kontinuitätsprinzip (GitHub = Gehirn aller Systeme)
- ✅ Session-Ritual (vor/während/nach Struktur)
```

#### STATUS.md — Wöchentliches Betriebslogbuch
- Template aufgebaut
- Meilensteine dokumentierbar
- Wöchentliche Updates als Pflicht etabliert

### Dokumentation
- `CLAUDE.md` — Zentrale Spielregeln
- `STATUS.md` — Laufendes Protokoll
- `README.md` — Projektüberblick
- `InitialSetup.md` — Onboarding für neue KI-Instanzen

---

## 📅 Phase 3: Domain-Analyse Teil 1 (13.07.2026, Session 2)

**Status:** ✅ Abgeschlossen | **Fokus:** Geschäftsmodell, Stakeholder, Kernsysteme

### Business-Domain konkretisiert

#### 4 Säulen der Finanzberatung (rennsteigfinanz.de)
1. **VERSICHERN** — Risiken absichern (Haftung, Eigentum, Personen)
2. **SPAREN** — Vermögensaufbau (Fonds, Bausparen, Kapitalanlage)
3. **FINANZIEREN** — Liquidität & Eigenkapital (Kredite, Hypotheken)
4. **RECHTLICHE VORSORGE** — Biometrische Risiken & Testamentsplanung

#### Kernsysteme im Betrieb dokumentiert
| System | Rolle | Besonderheit |
|---|---|---|
| VEMA Office | Eigenbestand Kunden/Verträge | Primärsystem |
| VEMA Pool | Poolverträge | Bestandsmakler-Beziehung |
| Outlook | Zentraler Eingangskanal | GDV-Daten + Pool-Info |
| Eigene Ablage | Lokale Kundenakte | Vollständigste Quelle |
| Abrechnungs-Excel | Provisionsdaten (CSV) | Einzelpositionen |
| Finanzplanungs-Tool | Beratungsinstrument (VBA/Excel) | **Haushalt als zentrales Modell** |

#### Rollen identifiziert
- **Betriebsleiter / Generalist** (Herr Tippmann)
- **3 Fachspezialisten** (Kfz, Gewerbliche Risiken, KV + Biometrische Risiken)
- **Investment-Spezialist** (Kapitalanlagen, Fondssparen, Depotführung)
- **Assistenz** (Vor-/Nachbereitung, Dokumentation)
- **Administrator (IT)** (EDV, portable Arbeitsumgebung)

### Dokumentation
- `docs/DOMAIN-ANALYSE-v0.1.md` — Ausführliche Business-Analyse
- `docs/ORGANISATIONSSTRUKTUR.md` — Rollen, Abteilungen, Datenfluss

---

## 📅 Phase 4: Domain-Analyse Teil 2 & Use-Cases (13.07.2026, Session 3)

**Status:** ✅ Abgeschlossen | **Fokus:** Fachkonkretisierung, Prozesse, Compliance

### Kundenberatung & Prozesse

#### Kundenberatungs-Prozess (6-phasig)
1. **Erstkontakt** — Initiative erkannt (Bedarf/Angebot/Termin)
2. **Aufnahme** — Basisdaten erfasst (Kontakt, Haushalt, Bedarfsindikation)
3. **Analyse** — Tiefer gehende Datensammlung (Risiken, Vermögen, Ziele)
4. **Folgetermin** — Mit Arbeitsteilung (Spezialist hinzugezogen)
5. **Spezialisteneinsatz** — Tiefergehende Bewertung pro Säule
6. **Umsetzung** — Verträge, Abrechnung, Dokumentation

#### Zentrales Datenmodell-Konzept
- **Haushalt als aggregierende Entität:** Verträge verschiedener Sparten werden im Haushaltskontext verknüpft
- **Bedarf vor Produkt:** Keine Produkte ohne Bedarf — Bedarfsermittlung ist dem Produkt fachlich vorgelagert
- **Vermögensaufbau ≠ Altersvorsorge:** Altersvorsorge erfordert biometrische Risikoabsicherung

#### Compliance-Anforderungen
- **§ 61 VVG (Protokollierungspflicht):** Beratungsgespräche müssen dokumentiert sein (inkl. Überlegungszeit-Nachweis)
- **Altersvorsorgedepot-Reform:** Inkrafttreten 01.01.2027 (Vorbereitungszeit läuft)
- **Unabhängigkeit & Transparenz:** "Unabhängig, ehrlich, kompetent" — Compliance-Statement

### Nutzen-Kandidaten identifiziert (noch keine Use-Cases)
1. Ertragsauswertung pro Kunde (CSV-Positionen)
2. Bestandslisten-Abgleich (Vertragsnummer-Matching)
3. KI-Assistenz: Vor-/Nachbereitung Beratungen
4. Automatisierte Arbeitsbesprechungs-Zusammenfassung
5. Investment-Spezialist: plattformübergreifende Entscheidungsschicht
6. Beratungsgespräch-Protokollierung inkl. Zeitnachweis (§ 61 VVG)
7. Administrator: portable, stabile, redundante Arbeitsumgebung

### Dokumentation
- `docs/DOMAIN-ANALYSE-v0.1.md` — Erweitert mit Prozessen & Compliance
- `docs/USE-CASES-v0.1.md` — Kern-Use-Cases mit Zielbild, Auslöser, Datenquellen
- `CLAUDE.md` — Domain-Wissen aufgenommen

---

## 📅 Phase 5: Repository-Setup & Infrastruktur-Automation (13.07.2026, Session 4)

**Status:** ✅ Abgeschlossen | **Fokus:** IT-Betriebsmodus, Automatisierung, Monitoring

### Infrastruktur aufgebaut

#### IT-Abteilung gegründet
- `docs/IT-ABTEILUNG-CHARTA.md` — Auftrag, Rollen, Kompetenzen
- `docs/IT-SERVICEKATALOG.md` — Services (Setup, Maintenance, Recovery, Monitoring)
- `docs/IT-WARTUNGSPLAN.md` — Regelmäßige Aufgaben
- `docs/IT-MONITORING-PROTOKOLL.md` — Laufender Wachdienst

#### Monitoring & Automation
- `tools/it-watch.sh` — Speicher-Monitoring (Schwellenwert-Warnungen)
- `tools/cleanup-safe.sh` — Sichere Speicherbereinigung (validiert, keine Fehler)
- Session-Startlauf durchgeführt: +4 GiB Reserve (Delta von Phase 1)

#### Portable Arbeitsumgebung geplant
- Untitled-Volume als Backup + Recovery-Basis identifiziert
- `docs/DREISYSTEM-BETRIEBSMODELL.md` vorbereitet (Mac, Windows, Untitled)

### Dokumentation
- `docs/IT-BESTANDSAUFNAHME-v0.1.md` — Hardware, Software, Konfiguration
- `docs/IT-BETRIEBSMODUS.md` — Tägliche/wöchentliche Routinen
- `tools/` — Setup- und Maintenance-Skripte

---

## 📅 Phase 6: Anti-Amnesie & Kontinuitätsstrategie (14.07.2026, Session 1)

**Status:** ✅ Abgeschlossen | **Fokus:** Session-Kontinuität, Wissensbewahrung, Windows-Vorbereitung

### Kernel-Dokumentation

#### Recovery-Infrastruktur
- `docs/context-snapshot.md` — Kontext-Snapshot bei 60-70% Token-Auslastung
- `docs/context-restore.md` — Kontext-Wiederherstellung in neuer Session
- Anti-Amnesie-Protokoll: Keine Informationen gehen verloren

#### Startprompts
- `docs/STARTPROMPT-UNIVERSAL-3ZEILEN.txt` — Schnelle Orientierung (3 Zeilen max)
- `docs/STARTPROMPT-CLAUDE-AI.txt` — Browser-Einstieg
- `docs/STARTPROMPT-CHATGPT.txt` — Externe Tool-Integration

#### Verwendeter Speicher optimiert
- Session-Store aufgebaut (`recovery/`)
- Backup-Strategie: Incremental Daily, Full Weekly

### Dokumentation
- `docs/KONTEXT-UEBERGABE.txt` — Wie Session-Kontinuität funktioniert
- `recovery/` — Backup-Verzeichnis
- `STATUS.md` — Bereits als primärer Informationshub etabliert

---

## 📅 Phase 7: Windows-Testumgebung & Prozess-Standardisierung (14.07.2026, Session 2)

**Status:** ✅ Abgeschlossen | **Fokus:** Testautomation, VBA-Fehler-Handling, Rollback-Standards

### Testing & Qualitätssicherung

#### Testumgebungs-Setup
- Windows 10/11 VM vorbereitet
- `tools/setup-testumgebung-mrt.sh` — Automatisiertes Setup
- `docs/WINDOWS-TESTUMGEBUNG-CHECKLISTE.md` — Schritt-für-Schritt-Vorbereitung

#### VBA-Fehler-Handling standardisiert
- `docs/UI-VBA-FEHLER-URSACHEN-MATRIX-VORLAGE.csv` — Fehler-Klassifizierung
- `docs/ABLAUF-UND-FEHLERPRUEFUNG-SNAPSHOT-VORLAGE.txt` — Reproduzier-Ablauf

#### Rollback-Mechanismus
- `docs/TEST-SICHERHEIT-ROLLBACK-STANDARD.md` — Rollback-Prozedur (1:1-Mapping)
- `docs/ROLLBACK-NACHWEIS-VORLAGE.txt` — Schnellprotokoll
- `docs/ROLLBACK-NACHWEIS-VORLAGE.csv` — Serielle Auswertung
- Rueckkehrpfad-Test nach jedem Fix (PowerShell-Routine)

#### Tooling & Extensions
- VS Code `mechatroner.rainbow-csv` installiert (CSV-Dateien lesbar)

### Dokumentation
- `docs/LEHREN-VERANKERUNG.md` — Lessons-learned-Prozess
- `start-checklist.md` — Pflicht-Steps bei Session-Beginn
- `NEXT-ACTION.md` — Priorisierte Aufgaben für nächste Phase

---

## 📅 Phase 8: Entscheidraster & Betriebliche Grundlagen (23.07.2026, Session 1-2)

**Status:** ✅ Abgeschlossen | **Fokus:** Entscheidungsmechaniken, Prozess-Verankerung, Automation

### Entscheidungsmechanismus standardisiert

#### 4-Punkte-Entscheidraster (verbindlich)
```
1. Zielbild — Was soll erreicht sein? (Visuelle Zielklärung)
2. Minimal machbarer Schritt diese Woche — Was ist machbar? (Priorisierung)
3. Risiko/Trade-off — Welche Risiken entstehen? (Realistische Bewertung)
4. Nachweis, dass der Schritt funktioniert hat — Wie wird Erfolg gemessen? (Validierung)
```
- `docs/ENTSCHEIDRASTER-VORLAGE.md` — Wiederverwendbare Vorlage

#### Session-Automation
- `tools/archive-chat.sh` — Chat-Archivierung als TXT im `logs/chats/`
- `tools/end-session.sh` — 1-Klick-Routine mit Dry-Run und No-Push-Option
- Automatisches Commit am Session-Ende (Optional, Nutzer steuert)

#### Ordnung in Betriebsdokumenten
- `STATUS.md` — Wöchentlich aktualisiert (aktueller Stand)
- `NEXT-ACTION.md` — Priorisierte Aufgaben
- `logs/Protokoll_YYYY-MM-DD_*.md` — Session-Protokolle
- `logs/chats/Chat_YYYY-MM-DD_*.txt` — Chat-Verlauf archiviert
- `logs/archive/` — Historische Ablage (2026-07-07+)

### Portable & Multi-System-Betrieb

#### Dreisystem-Betriebsmodell
- **macOS:** Operative Entwicklung (Hauptsystem)
- **Windows:** Test- & Validierungs-Umgebung
- **Untitled:** Backup, Recovery, portable Fallback-Umgebung
- `docs/DREISYSTEM-BETRIEBSMODELL.md` — Architektur-Übersicht

#### Portable Starter für Untitled
- `tools/portable/start-untitled.command` — macOS-Shell
- `tools/portable/START-UNTITLED.cmd` — Windows-Batch
- Live-Test erfolgreich auf macOS durchgeführt

#### Rollback-Standards vollständig
- 1:1-Rollback-Mapping (Schnellprotokoll + CSV)
- Test-Sicherheits-Standard eingeführt
- Recovery-Tests dokumentiert

### Dokumentation
- `docs/ENTSCHEIDRASTER-VORLAGE.md` — Entscheidungshilfe
- `logs/Protokoll_2026-07-23_*.md` — 3 Session-Protokolle
- `logs/chats/Chat_2026-07-23_*.txt` — Chat-Archive

---

## 📅 Phase 9: Zentrale Topologie-Reorganisierung (23.07.2026, Session 3 — AKTUELL)

**Status:** 🔄 In Arbeit | **Fokus:** Konsistente Struktur über Mac/Windows/Untitled, Archivierung

### Infrastruktur-Konsolidierung

#### Zentrale Ablage-Struktur etabliert
```
macOS:
~/dev/projects/RennsteigFINANZ/  ← Operative Arbeitsumgebung (Git)

Windows (analog):
C:\dev\projects\RennsteigFINANZ\  ← Test/Validierungs-Umgebung (Git)

Untitled (extern):
/Volumes/Untitled/RennsteigFINANZ/
├── active/              ← Portable Arbeitsumgebung
├── backups/full/        ← Vollständige Snapshots
├── backups/tagesstand/  ← Daily-Snapshots
├── git-bundles/         ← Git-Archive für Recovery
└── storage-offload/     ← Non-Project Data
```
- `docs/TOPOLOGIE-ZENTRALE-ABLAGE.md` — Architektur-Dokumentation

#### Alte Artefakte geräumt
- ✅ Untitled: Fragmentierte Ordner zentralisiert
- ✅ Mac-Downloads: `Projekt Claude` aufgeräumt (9.1 MB)
- 🔄 Historische Protokolle archiviert (`logs/archive/2026-07-07/`)

#### Archive etabliert
- `logs/archive/2026-07-07/` — 40+ Protokolle + INDEX
- Alle Entwicklungsschritte bewahrt (nicht gelöscht)
- Zentrale Topologie-Dokumentation verlinkt

### Nächste Schritte
- Windows-Struktur analog einrichten
- Untitled `active/` als portable Umgebung testen
- Git-Bundles auf Aktualität prüfen

### Dokumentation (diese Phase)
- `docs/TOPOLOGIE-ZENTRALE-ABLAGE.md` — NEU: Zentrale Struktur
- `logs/archive/2026-07-07/INDEX.md` — NEU: Archiv-Inhaltsverzeichnis
- `ENTWICKLUNGSHISTORIE.md` — NEU: Dieses Dokument

---

## 🎯 Synthese: Reisekarte der Infrastruktur

### Phasen nach Charakter

| Phase | Charakter | Dauer | Ergebnis |
|---|---|---|---|
| 1 (07.07) | 🚨 Notfall-Debugging | ~1 Tag | Speicher-Stabilisierung, Lehren dokumentiert |
| 2 (13.07-1) | 🏗️ Governance | ~4h | Spielregeln, GitHub-Setup, Betriebsmodell |
| 3 (13.07-2) | 📊 Domain-Analyse 1 | ~3h | Business-Architektur konkretisiert |
| 4 (13.07-3) | 🔍 Domain-Analyse 2 | ~3h | Prozesse, Compliance, Use-Cases |
| 5 (13.07-4) | ⚙️ IT-Automation | ~2h | Monitoring, Cleanup, Skalierbarkeit |
| 6 (14.07-1) | 💾 Anti-Amnesie | ~2h | Kontextbewahrung, Session-Kontinuität |
| 7 (14.07-2) | 🧪 Testautomation | ~2h | Rollback-Standards, VBA-Fehlerbehandlung |
| 8 (23.07-1,2) | 📋 Entscheidsmuster | ~3h | 4-Punkte-Raster, Session-Automation |
| 9 (23.07-3) | 🗂️ Zentrale Topologie | 🔄 | Mac/Windows/Untitled-Konsistenz, Archive |

### Kumulative Erkenntnisse
1. **Infrastruktur vor Inhalt** — Nicht ins Coding starten, bevor Struktur steht
2. **Dokumentation ist Code** — Jede Entscheidung und jeder Fehler wird protokolliert
3. **Automatisierung spart manuelle Arbeit** — Skripte für repetitive Aufgaben essentiell
4. **Kontextbewahrung zentriert Kontinuität** — GitHub + STATUS.md + Chat-Archive
5. **Multi-System-Betrieb braucht Topologie** — Zentrale Struktur über alle Geräte
6. **Recovery-First-Denken** — Untitled als Defibrilator mindestens genauso wichtig wie Produktivs-System

---

## 📌 Aktueller Stand (23.07.2026, Session 3)

**Arbeitsphase:** Zentrale Topologie-Reorganisierung  
**Aktuell:** Untitled ist zentral reorganisiert; Mac-Downloads bereinigt; Archiv etabliert  
**Nächstes:** Windows-Struktur + Fachkonkretisierung (Rollen-/Zugriffrechte v0.1)

**Git-Status:** 
```
Branch: main
Remote: origin/main (in Sync)
Status: Clean (keine offenen Änderungen)
Letzter Commit: Session 2026-07-23: Tagesgeschaeft-Hospitationen-und-Ausblick
```

---

**Dokument erstellt:** 2026-07-23  
**Status:** Laufend aktualisierbar (lebende Dokumentation)  
**Nächste Reviews:** Nach jeder Phase (weekly oder bei Major-Meilenstein)

