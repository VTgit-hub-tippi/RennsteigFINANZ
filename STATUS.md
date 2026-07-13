# STATUS.md — Wöchentliches Betriebslogbuch

> **Dies ist das lebende Gedächtnis des Betriebs.** Jede Session beginnt hier, jede Session endet hier aktualisiert.
> 
> Update-Frequenz: Nach jeder Session / täglich / wöchentlich (je nach Intensität)

---

## 📅 Aktueller Stand (13.07.2026)

### Gegenwart
- **Phase:** Infrastruktur-Setup / Domain-Knowledge
- **Meilenstein:** Domain-Analyse Maklerbetrieb weitgehend abgeschlossen
- **Status:** Use-Case-Definition als nächster Schritt

---

## ✅ Neu abgeschlossen (13.07.2026)

- [x] Vollständige Domain-Analyse: VEMA Office/Pool, Outlook, eigene Ablage, Abrechnungs-Excel, Finanzplanungs-Tool, Bestandslisten
- [x] Rollen-Definition (Entwurf): Generalist, 3 Fachspezialisten, Investment-Spezialist, Assistenz, Administrator
- [x] Vollständiger Kundenberatungsprozess dokumentiert (Drei-Phasen-Modell, doppelter Auslösemechanismus)
- [x] Investment-Thema vertieft inkl. Altersvorsorgedepot-Reform (Inkrafttreten 01.01.2027)
- [x] Protokollierungspflicht § 61 VVG als eigenständiger Bereich mit Haftungsrelevanz identifiziert
- [x] IT-Anforderungen aufgenommen (portable, stabile, redundante Arbeitsumgebung)
- [x] Repository-Kontinuitätsstrategie etabliert: GitHub = zentrales Gehirn, automatische Session-Commits
- [x] CLAUDE.md mit Domain-Wissen und Kontinuitätsprinzip erweitert
- [x] Projektpfad von Documents/ (macOS-gesperrt) nach ~/dev/projects/RennsteigFINANZ/ verlegt
- [x] Protokolle in /logs/ abgelegt (Domain-Analyse Teil 1+2, Repo-Setup)
- [x] Session-Startlauf `tools/it-watch.sh` ausgeführt: Speicherstatus weiterhin CRITICAL, nur 0 GiB frei; Hauptkandidaten Music, DEVONthink und Telegram bestätigt
- [x] `tools/cleanup-safe.sh` repariert und erneut validiert; Safe-Cleanup läuft wieder ohne Numerikfehler und ohne pauschales Löschen von Benutzer-Logs
- [x] Telegram-Cache bereinigt: nur `cached`, `logs` und `temp` entfernt; `postbox`/`db` bewusst unberührt gelassen
- [x] adb-Fork-Server gestoppt (`PID 2243`); nach Prüfung keine Launch-Quelle im aktuellen Shell-Kontext sichtbar
- [x] DEVONthink-Retention gekürzt: älteres Backup `Inbox.dtBase2/Backup 2026-06-23 22-38-13` entfernt, aktuelles `Backup 2026-07-11 17-21-48` belassen

---

## 📅 Aktueller Stand (Woche vom 08.07.2026 — Archiv)

---

## 🎯 Ziel dieser Woche

**Fundament des Maklerbetrieb-Systems aufbauen:**
1. ✓ Geschäftsmodell & Use-Cases dokumentieren
2. Datenmodell skizzieren (Kunden, Policen, Provisionen, Makler)
3. Compliance-Anforderungen pro Säule konkretisieren
4. Erste Benutzer-Rollen und Zugriffsrechte definieren

---

## ✅ Abgeschlossen (diese Woche)

- [x] Git-Repository initialisiert
- [x] GitHub-Remote konfiguriert
- [x] **CLAUDE.md** geschrieben (Spielregeln als Maschinencode)
- [x] **STATUS.md Template** angelegt
- [x] Betriebsmodell verankert (3 Ebenen: Admin/Buchhaltung/Produktiv)

---

## 🔄 In Arbeit

### IT-Abteilung (abgeschlossen diese Woche)
- [x] **Storage-Remediation v0.1** — Akute Entlastung intern durchgefuehrt (+1.2 GiB); 5.4 GiB frei (CRITICAL bleibt)
- [x] **IT-Abteilung gegruendet** — Charta, Servicekatalog und Wartungsplan
- [x] **IT-Monitoring aktiv** — Wachdienst (tools/it-watch.sh, tools/cleanup-safe.sh)
- [x] **IT-Migrationsprojekte MIT-01/02/03** — Geplant, keine Ausführung ohne Vorbereitung
- [x] **Konstruktive Selbstkritik** — In CLAUDE.md, IT-CHARTA, IT-BETRIEBSMODUS verankert

### Business-Domäne (09.07.2026 — diese Session)
- [x] **DOMAIN-ANALYSE v0.2** — Konkretisiert:
  - 4-Säulen-Modell: VERSICHERN, SPAREN, FINANZIEREN, RECHTLICHE VORSORGE
  - Fragebogen mit 9 Bestandsaufnahme-Kategorien + 3 Handlungsfelder dokumentiert
  - Zwei Bedarfsanalyse-Modi: Erstaufnahme (strukturiert) vs. Situativ (fallgesteuert)
  
- [x] **ORGANISATIONSSTRUKTUR.md** — Neu erstellt:
  - 4 Abteilungen: Beratung, Back-Office/Assistenz, Rechnungswesen & Controlling, Compliance
  - Rollen: Kundenbetreuer (Generalist) vs. Spezialist (pro Säule)
  - Datenfluss: Beratung → Assistenz → Buchhaltung
  
- [x] **Beratungsablauf 6-phasig** — Dokumentiert:
  - Phase 1-2: Erstkontakt + Aufnahme
  - Phase 3-4: Analyse + Folgetermin mit Arbeitsteilung
  - Phase 5-6: Spezialisteneinsatz + Umsetzung
  
- [x] **Website-Analyse** — rennsteigfinanz.de bestätigt:
  - 4 Säulen öffentlich (Versichern, Sparen & Vermögen, Vorsorge, Finanzieren)
  - Team-Struktur: 4-5 Fachberater (Generalisten + Spezialisten)
  - Compliance-Statement: "unabhängig, ehrlich, kompetent"

- [ ] **Service-Gebühren-Modell** — AUSSTEHEND (Dokumente kommen später vom Nutzer)
- [ ] **Compliance-Details pro Säule** — AUSSTEHEND (Website analysiert, Tiefgang erforderlich)

---

## 📋 Nächste Schritte (priorisiert)

### FOLGE-SESSION (Business Design Fort.)
1. Use-Cases aus der heute geklärten Fachlinie ableiten:
  - Jahresgespräch als fester Beratungsrhythmus
  - Bestandslisten-Abgleich per Vertragsnummer
  - Ertragsauswertung pro Kunde aus CSV-Positionsdaten
  - Provisionsabrechnungen/Soll-Ist-Abgleich
  - Assistenz fuer Vorbereitung, Nachbereitung und Protokollierung

2. Finanzplanungs-Tool als zentrale Arbeitsoberflaeche weiter scharfstellen:
  - Haushalt als aggregierende Entitaet
  - Verbindung zu eigener Ablage und VEMA-Import
  - Rollenwirkung fuer Generalist, Spezialist, Assistenz und Buchhaltung

3. Datenmodell v0.1 aus den geklaerten Objekten ableiten:
  - Kunde, Haushalt, Vertrag, Gesellschaft, Abrechnung, Termin, Protokoll
  - Rueckverfolgbarkeit zwischen Bestandslisten und Provisionsdaten
  - Offene Felder und Dublettenlogik als OFFEN markieren

4. Danach erst Vertiefung der allgemeinen Compliance- und Gebuehrenpunkte,
  sobald die fachliche Arbeitsgrundlage klar abgegrenzt ist.

### FOLGE-SESSIONEN (Systemarchitektur)
4. Datenmodell v0.1 → Entities, Relationships, Constraints
5. UI/UX-Skizzen für Hauptprozesse
6. Tech-Stack Entscheidung treffen
7. API-Spezifikation (falls Web-App)
8. Deployment-Strategie

### IT-BEREICH (parallel, wenn Ressource verfügbar)
- MIT-01/02/03 Recherchephase (nicht kritisch, Background)
- Telegram Cache-Limit (manuell)
- adb-Daemon Ursprung klären (Background)

---

## 🚨 Blockers & Offene Fragen

| Frage | Status | Zuständig | Notizen |
|-------|--------|-----------|---------|
| **Service-Gebühren-Modell** | ⏳ Nutzer lädt Dokumente | Nutzer | Bestimmt Finanzfluss-Architektur |
| **Compliance-Anforderungen pro Säule** | 🔄 Research läuft | Nutzer + Claude | Website-Basis vorhanden, Tiefgang erforderlich |
| **Tech-Stack & Frontend** | ⏳ Nutzer entscheidet | Nutzer | Web/Desktop/Hybrid? Single-Page-App? |
| **Datenmenge & Performance** | ⏳ Zu klären | Nutzer | Bestimmt DB-Strategie, Skalierbarkeit |
| **Regulatorische Anforderungen** | 🟡 Teilweise bekannt | Nutzer | Makler-Gesetze, Datenschutz GDPR, Finanzmarktrichtlinien |
| **Speicherplatz auf Macintosh HD** | 🟡 kurzzeitig entlastet (752 MiB frei) | IT-Bereich | CRITICAL bleibt; große Blöcke liegen weiter bei Music und Telegram-Postbox |

---

## 📊 Ressourcen-Verbrauch (Buchhaltung)

| Ressource | Budget | Verbraucht | Frei |
|-----------|--------|-----------|------|
| Kontext (Claude) | 100% | ~35% | 65% |
| Git-Commits | ∞ | 2 | ∞ |
| GitHub-Storage | ✓ | <1MB | ✓ |
| Tokens (Claude.ai) | ? | Minimal | ? |

---

## 👥 Betriebsrat (Verantwortlichkeiten)

| Rolle | Träger | Verantwortung |
|-------|--------|---------------|
| **Betriebsleiter** | Nutzer | Strategie, Entscheidungen, Ressourcen |
| **CTO / Architekt** | Claude Code | Technische Struktur, Code-Qualität |
| **Berater** | Claude.ai | Strategisches Denken, Komplexe Fragen |
| **Scribe** | Claude (diese Instanz) | Protokolle, STATUS.md, Kommunikation |

---

## 📝 Session-Protokolle (Chronologie)

### 2026-07-08 — Session 1: Infrastruktur-Setup
- **Dauer:** ~30 Min
- **Ziel:** Zentrale Nervenbahn aufbauen
- **Ergebnis:** ✓ Git + CLAUDE.md + STATUS.md live
- **Nächster Schritt:** Domain-Knowledge-Session zum Maklerbetrieb

### 2026-07-08 — Session 2: Storage-Baseline vor Neustart
- **Ziel:** Wiederkehrendes Speicherproblem belastbar dokumentieren (Vorbereitung auf Ursachenanalyse)
- **Ergebnis:** ✓ Snapshot erstellt: recovery/disk-baseline-20260708-220143.txt
- **Kernaussage:** APFS Data nahezu voll (446 GiB belegt, nur 29-40 MiB frei), Kandidatenprozesse erfasst (rsync, backupd, mds/mdworker, cloudd, bird, photoanalysisd)
- **Maßnahme:** Laufender Restore-Prozess gestoppt, um zusätzliches Volllaufen während Analysefenster zu vermeiden
- **Nächster Schritt:** Nach Neustart Delta-Vergleich der Belegung + Prozesskorrelation, dann gezielte Drosselung/Abschaltung störender Dienste

### 2026-07-08 — Session 3: Vollprotokoll + Koordinationsbasis
- **Ziel:** Vollstaendige, bereinigte Dokumentation der heutigen Chat- und Arbeitslinie fuer alle Instanzen
- **Ergebnis:** ✓ TXT-Vollprotokoll erstellt: CHAT-PROTOKOLL-2026-07-08.txt
- **Ergebnis:** ✓ Koordinationspruefung erstellt: KOORDINATION-CHECK-2026-07-08.txt
- **Regel:** Projektphase hat Vorrang; Nebenaufgaben (z.B. Musik-Recovery) nur unauffaellig im Hintergrund
- **Naechster Schritt:** Nach Neustart Storage-Delta-Analyse und Prozessursachen eingrenzen

### 2026-07-08 — Session 4: Wiedereinstieg ohne Nutzersteuerung
- **Ziel:** Verbindlichen Autopilot fuer Folgesessions etablieren
- **Ergebnis:** ✓ NEXT-ACTION.md als Single Source fuer naechste ausfuehrbare Aktion eingefuehrt
- **Ergebnis:** ✓ Start-Checkliste um deterministischen Wiedereinstiegsablauf erweitert
- **Regel:** Bei eindeutigem naechsten Schritt direkte Ausfuehrung, keine Richtungsfrage an den Nutzer

### 2026-07-08 — Session 5: Autopilot in Ausfuehrung
- **Ziel:** Proof, dass Weiterarbeit ohne Richtungsfrage funktioniert
- **Ergebnis:** ✓ docs/DOMAIN-ANALYSE-v0.1.md erstellt (Rollen, Workflow, Datenobjekte, Schmerzpunkte, Regulierung)
- **Ergebnis:** ✓ Fehlende Fachdetails transparent als OFFEN markiert (keine Blockade)
- **Naechster Schritt:** Datenmodell v0.1 aus Domain-Basis ableiten

### 2026-07-08 — Session 6: Storage-Track priorisiert
- **Ziel:** Volllaufen der Systemplatte ohne externe Auslagerung abfangen
- **Ergebnis:** ✓ Externe Auslagerung verworfen und auf internen Pfad korrigiert
- **Ergebnis:** ✓ Telegram `*_partial` bereinigt (ca. 2.24 GiB)
- **Ergebnis:** ✓ Freier Speicher auf Data von ~29-40 MiB auf ~2.0 GiB erhoeht
- **Naechster Schritt:** In-App-Bereinigung (Telegram Cache, DEVONthink Backup-Retention) fuer robusten Puffer 10-20 GiB

### 2026-07-08 — Session 7: IT-Abteilungsmodus als Standard
- **Ziel:** Projekt als systemfreundlichen Mitnutzer ausrichten
- **Ergebnis:** ✓ Leitdokument erstellt: docs/IT-BETRIEBSMODUS.md
- **Regel:** App-Funktionalitaet hat Vorrang; nur funktionserhaltende, messbare Schritte
- **Naechster Schritt:** Storage-Stabilisierung im IT-Betriebsmodus bis mindestens 10 GiB frei

### 2026-07-08 — Session 8: Gruendung IT-Abteilung RennsteigFINANZ
- **Ziel:** IT als eigene Betriebseinheit fuer Systempflege, Stabilitaet und Integration etablieren
- **Ergebnis:** ✓ Charta erstellt: docs/IT-ABTEILUNG-CHARTA.md
- **Ergebnis:** ✓ Servicekatalog erstellt: docs/IT-SERVICEKATALOG.md
- **Ergebnis:** ✓ Wartungsplan erstellt: docs/IT-WARTUNGSPLAN.md
- **Ergebnis:** ✓ Office-Integration (Word/Excel/Pages/Numbers) als verbindlicher IT-Service aufgenommen
- **Naechster Schritt:** IT-Bestandsaufnahme v0.1 (Inventar, Abhaengigkeiten, Risiken, Zugriffspfade)

### 2026-07-08 — Session 9: Prozess-Wachdienst aktiviert
- **Ziel:** Kritische Zustaende frueh signalisieren und Reaktionsplan automatisiert anzeigen
- **Ergebnis:** ✓ Monitoring-Standard dokumentiert: docs/IT-MONITORING-PROTOKOLL.md
- **Ergebnis:** ✓ Watch-Skript erstellt: tools/it-watch.sh
- **Regel:** Bei jedem Session-Start Watch-Lauf + PLAN aus Report beachten

### 2026-07-09 — Session 10: Kontextbruch zwischen VS Code und Claude.ai behoben
- **Ziel:** Nahtlosen Wiedereinstieg tooluebergreifend reproduzierbar machen
- **Befund:** Claude.ai konnte nicht an der letzten VS-Code-Stelle fortsetzen, da kein garantiert geteiltes Session-Gedaechtnis vorliegt
- **Ergebnis:** ✓ Kontextartefakte verbindlich angelegt:
  - docs/context-snapshot.md
  - docs/context-restore.md
  - docs/KONTEXT-UEBERGABE.txt
- **Ergebnis:** ✓ Start-Checkliste um verbindlichen Toolwechsel-Prozess erweitert
- **Naechster Schritt:** Bei jedem Toolwechsel Pflichtpaket nutzen (STATUS.md + NEXT-ACTION.md + context-snapshot + git status)

### 2026-07-09 — Session 11: Kreuz-und-quer-Einstieg formalisiert
- **Ziel:** Einstieg aus jeder Applikation und jedem Procedere standardisieren
- **Ergebnis:** ✓ Universelles Runbook erstellt: docs/CROSS-ENTRY-RUNBOOK.txt
- **Ergebnis:** ✓ Copy/Paste-Startprompt fuer Claude.ai erstellt: docs/STARTPROMPT-CLAUDE-AI.txt
- **Ergebnis:** ✓ Start-Checkliste um Schnellzugriff auf beide Artefakte erweitert
- **Naechster Schritt:** Runbook als verbindlichen Ein-/Ausstiegsstandard in jeder Session anwenden

### 2026-07-09 — Session 12: Zero-Checklist Auto-Proof eingefuehrt
- **Ziel:** Funktionsnachweis ohne manuelle Haken erzwingen
- **Ergebnis:** ✓ Skripte erstellt: tools/context-snapshot-refresh.sh, tools/handoff-selfcheck.sh, tools/handoff-proof.sh
- **Ergebnis:** ✓ Live-Test ausgefuehrt: PASS fuer Vollstaendigkeit, Referenzen, Git-Grundzustand
- **Regel:** Vor Toolwechsel oder Session-Start `bash tools/handoff-proof.sh` ausfuehren

### 2026-07-09 — Session 13: KOORDINATIONS-CHARTA — Mannschaftsarbeit formalisiert
- **Ziel:** Koordinationsproblem zwischen Claude Code (VS Code) und Claude.ai (Browser) loesen
- **Befund:** Claude.ai konnte nicht eigenstaendig fortsetzen. Handoff-System war nur "Artefakte", nicht "funktional".
- **Analyse:** Es gibt kein direktes "Gedaechnis" zwischen Instanzen; nur Git + Dateien als Kommunikationsmedium.
- **Loesung:** KOORDINATIONS-CHARTA.md verfasst — verbindliches Regelwerk fuer alle Instanzen (Claude Code, Claude.ai, optional ChatGPT).
- **Ergebnis:** ✓ docs/KOORDINATIONS-CHARTA.md erstellt mit:
  - 👥 Klare Rollen: Claude Code (Executor/Kapitän), Claude.ai (Strategist/Co-Kapitän), Nutzer (Direktor)
  - 📋 Handoff-Protokoll: Wie Uebergaben funktionieren (3 Szenarios: Normal, Wechsel, Crash)
  - 💾 Git-Konvention: Commit-Format, Rhythmus (alle 30 Min)
  - 🛡️ Amnesia-Prävention: Was bleibt, was nicht, Worst-Case-Protokoll
  - 📅 Weekly-Ritual: Wochenstart, Daily-Routine, Session-Ende
  - 🧪 Validierungstests: 3 Tests zum Pruefen, dass Handoff funktioniert
  - ⚠️ 7 verbindliche Regeln fuer alle Instanzen
- **Regel:** Jede neue Instanz liest KOORDINATIONS-CHARTA.md nach CLAUDE.md
- **Status:** COMMITTED + PUSHED zu GitHub
- **Naechster Schritt:** DOKUMENTENEINGANG starten (36 Seiten clustern nach Vergütung/Vollmacht/Beratung/Compliance)

---

## 🔗 Wichtige Verweise

- **Betriebskonzept:** → CLAUDE.md
- **Spielregeln:** → CLAUDE.md (Grundregeln, Session-Ritual)
- **Projekt-README:** → README.md
- **GitHub:** https://github.com/VTgit-hub-tippi/RennsteigFINANZ

---

## 📌 Hinweise für künftige Sessions

1. **Vor dem Start:** Diesen Status lesen, Git-Pull machen
2. **Während:** Neue Erkenntnisse/Blockers hier notieren, nicht im Chat vergessen
3. **Beim Beenden:** Diese Datei updaten, committen, pushen
4. **Kontextbudget:** Bei >70% → `/context-snapshot` vor Schluss

---

**Zuletzt aktualisiert:** 2026-07-09, Session 13 (KOORDINATIONS-CHARTA live)
**Nächste automatische Review:** Nach DOKUMENTENEINGANG (Phase: Compliance-Anforderungen)
