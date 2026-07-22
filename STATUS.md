<!-- markdownlint-disable MD007 MD009 MD022 MD029 MD032 MD034 MD060 -->

# STATUS.md — Wöchentliches Betriebslogbuch

> **Dies ist das lebende Gedächtnis des Betriebs.** Jede Session beginnt hier, jede Session endet hier aktualisiert.
> 
> Update-Frequenz: Nach jeder Session / täglich / wöchentlich (je nach Intensität)

---

## 📅 Aktueller Stand (22.07.2026)

### Gegenwart
- **Phase:** Fachkonkretisierung nach Domain-Analyse
- **Meilenstein:** Kern-Use-Cases v0.1 aus Domain-Stand abgeleitet
- **Status:** Rollen- und Zugriffsrechte v0.1 als naechster Hauptschritt

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

## ✅ Neu abgeschlossen (14.07.2026)

- [x] Kern-Use-Cases v0.1 dokumentiert: docs/USE-CASES-v0.1.md (5 Use-Cases inkl. Ziel, Ausloeser, Datenquellen, Rollen, Ergebnis, OFFEN)
- [x] Session-Startlauf tools/it-watch.sh durchgefuehrt: Status weiterhin CRITICAL, aber Reserve verbessert auf 4 GiB frei (Delta +4 GiB)
- [x] NEXT-ACTION auf neuen P0-Schritt aktualisiert (Rollen- und Zugriffsrechte v0.1)

## ✅ Neu abgeschlossen (15.07.2026)

- [x] Standardisierte Ablauf- und Fehlerpruefung eingefuehrt: TXT-Snapshot-Vorlage erstellt
- [x] UI-VBA-Fehler-Ursachen-Matrix als CSV-Vorlage erstellt
- [x] Rueckkehrpfad-Test nach jedem Fix als PowerShell-Routine eingefuehrt
- [x] 1-Klick-Starter fuer den Rueckkehrpfad-Test in `tools/windows-sync` ergaenzt
- [x] Windows-Testumgebungs-Checkliste um neue Betriebsmittel erweitert
- [x] Setup-Skript `tools/setup-testumgebung-mrt.sh` erweitert: Vorlagen werden beim Aufbau der Testumgebung mitkopiert
- [x] VS Code-Erweiterung `mechatroner.rainbow-csv` installiert
- [x] Lehren aus der Session verbindlich verankert: `docs/LEHREN-VERANKERUNG.md` plus Pflichtschritte in Start-Checkliste und NEXT-ACTION

## ✅ Neu abgeschlossen (22.07.2026)

- [x] Mac-Wiedereinstieg mit aktuellem Windows-Arbeitsstand abgeglichen
- [x] `NEXT-ACTION.md` um die Kernmethode Schnappschuss -> VB-Coding -> Prozesspruefung -> Toolverbesserung ergaenzt
- [x] `docs/LEHREN-VERANKERUNG.md` um die aktuelle Verankerungslogik erweitert
- [x] Betriebsprotokoll fuer die aktuelle Reentry-/Sync-Phase vorbereitet
- [x] Verbindliches Dreisystem-Betriebsmodell fuer Mac, Windows und Untitled eingefuehrt (`docs/DREISYSTEM-BETRIEBSMODELL.md`)
- [x] Portable Starter fuer Untitled-Recovery eingefuehrt (`tools/portable/start-untitled.command`, `tools/portable/START-UNTITLED.cmd`)
- [x] macOS-Live-Test des Portable-Starters erfolgreich durchgefuehrt (Backup-Ziel Untitled erkannt)
- [x] Windows-Live-Test-Checkroutine fuer den Portable-Starter dokumentiert
- [x] Verbindlicher Test-Sicherheits- und 1:1-Rollback-Standard eingefuehrt
- [x] Rollback-Nachweisvorlage fuer Schnellprotokoll eingefuehrt und ins Test-Setup integriert
- [x] CSV-Rollback-Vorlage fuer serielle Auswertung eingefuehrt und ins Test-Setup integriert

## ✅ Neu abgeschlossen (23.07.2026)

- [x] Chat-Archivierung als Skript operationalisiert (`tools/archive-chat.sh`)
- [x] Aktuellen Chat als TXT im Archiv gesichert (`logs/chats/Chat_2026-07-23_Dreisystem-Portable-und-Pruefstand.txt`)
- [x] Sitzungsprotokoll zur Agenda-Sicherung erstellt (`logs/Protokoll_2026-07-23_Chat-Archiv-und-Agenda-Sicherung.md`)
- [x] End-Session-Ein-Klick-Routine erstellt (`tools/end-session.sh`) inkl. Dry-Run/No-Push-Option
- [x] Verbindliches 4-Punkte-Entscheidraster eingefuehrt (`docs/ENTSCHEIDRASTER-VORLAGE.md`)

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
1. Rollen- und Zugriffsrechte v0.1 aus den vorliegenden Use-Cases ableiten.

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

### 2026-07-14 — Session 14: Backup-Sicherung + Windows-Demoablauf erfasst
- **Ziel:** Projektstand sichern, Untitled-Synchronisierung abschliessen, Toolablauf live sichtbar machen
- **Ergebnis:** ✓ Vollbackup unter `/Volumes/Untitled/CloudStation/Documents/Backup/RennsteigFINANZ-full-2026-07-14` erstellt
- **Ergebnis:** ✓ Tagesstand unter `/Volumes/Untitled/CloudStation/Documents/RennsteigFINANZ-Tagesstand-2026-07-14` erstellt
- **Ergebnis:** ✓ Live-Demo in Screenshots chronologisch erfasst (Start, Pfadpruefung, Haushaltsuche, Stammdaten, Finanzdaten, Vertragsdaten)
- **Befund:** VBA-Debugger-Stopp beim Zurueck-Ablauf in `frmFinanzen` am harten Close-Aufruf (`Workbooks("Finanzen.xls").Close SaveChanges:=True`)
- **Regel:** Fix nur in Windows-Testkopie umsetzen, nicht direkt in Produktivdatei
- **Naechster Schritt:** Windows-Dev-Setup in Testordner, robuste Workbook-Referenz im Zurueck-Handler implementieren und testen

### 2026-07-14 — Session 15: Speicher-Reserve Notfallplan dokumentiert
- **Ziel:** Sicherstellen, dass APFS-Reserve/Quota mit klarer Rueckfallstrategie dokumentiert ist
- **Ergebnis:** ✓ Runbook erstellt: `docs/SPEICHER-RESERVE-RUNBOOK.md`
- **Inhalt:** Vorbedingungen, Standard-Umsetzung, Notfall-/Rollback-Ablauf, Warnschwellen und Schnellcheck-Kommandos
- **Naechster Schritt:** Nach 5 bis 10 GB Entlastung APFS-Arbeitsvolume mit Reserve/Quota umsetzen und gegenchecken

### 2026-07-14 — Session 16: Akut-Entlastung erfolgreich umgesetzt
- **Ziel:** Schreibfehler `ENOSPC` beheben und wieder stabilen Arbeitsraum herstellen
- **Ergebnis:** ✓ Freier Platz auf `/` von ~20 MB auf ~6.8 GB erhoeht
- **Massnahme:** Groesserer Container `~/Library/Containers/com.apple.BKAgentService` nach
  `/Volumes/Untitled/CloudStation/Documents/Storage-Offload-2026-07-14/Library-Containers/` ausgelagert und lokal entfernt
- **Hinweis:** `rsync`-Warnung Code 24 (`file has vanished`) trat auf, weil Dateien waehrend laufender Apple-Books-Aktivitaet wechselten; finaler Resume-Lauf war erfolgreich
- **Naechster Schritt:** APFS-Reserve/Quota in kleiner Startgroesse anlegen und danach auf Zielwert ausbauen

### 2026-07-14 — Session 17: Abschlusssicherung fuer nahtlosen Wiedereinstieg
- **Ziel:** Aktuellen Stand final sichern, damit die naechste Session ohne Luecke starten kann
- **Ergebnis:** ✓ Git-Stand gesichert (Commit/PUSH, sofern technisch erreichbar)
- **Ergebnis:** ✓ Untitled-Backups (Full + Tagesstand) auf aktuellen Projektstand aktualisiert
- **Naechster Schritt:** Wiedereinstieg mit `git status`, danach APFS-Reserve/Quota umsetzen

### 2026-07-14 — Session 18: Fokuskorrektur auf Windows-Testumgebung
- **Ziel:** Nahtlose Fortsetzung am zuletzt priorisierten Thema (Windows-Demo/Fix), keine fachliche Seitenspur
- **Ergebnis:** ✓ NEXT-ACTION auf Windows-Testfix (`frmFinanzen`) zurueckgestellt
- **Ergebnis:** ✓ Operative Checkliste erstellt: `docs/WINDOWS-TESTUMGEBUNG-CHECKLISTE.md`
- **Regel:** Erst isolierte Testkopie, dann Ende-zu-Ende-Test, danach erst Produktivuebernahme
- **Naechster Schritt:** Windows-Testordner einrichten und Rueckkehr-Handler robust umbauen

### 2026-07-14 — Session 19: Verbindlicher Zwei-Spur-Betrieb (Mac + Windows)
- **Ziel:** Stopperhaften Wiedereinstieg beenden und geraeteunabhaengig fortsetzen
- **Ergebnis:** ✓ P0 auf zwei parallele Pflichtspuren gesetzt:
  - Mac-Freiraum stabil ausbauen
  - Windows-Testumgebung live mit VBA-Fix durchlaufen
- **Ergebnis:** ✓ Zentralmodus in Start-Checkliste verankert (kein Themenwechsel ohne explizite Umpriorisierung)
- **Befund:** Aktuell ca. 4.2 GiB frei auf `/`; Untitled-Pfade waren im letzten Check nicht verfuegbar (Mount/Pfad pruefen)
- **Naechster Schritt:** Untitled-Verfuegbarkeit klaeren und Mac-Freiraum Richtung 8-10 GiB stabilisieren, parallel Windows-Livetest starten

### 2026-07-14 — Session 20: Mac-Track verifiziert und Cleanup-Skript stabilisiert
- **Ziel:** Speicher-Ausbau ohne Skriptabbrueche wieder verlässlich machen
- **Ergebnis:** ✓ Aktueller Freispeicher gemessen: 4.4 GiB auf `/` (weiterhin unter Zielkorridor)
- **Ergebnis:** ✓ `tools/cleanup-safe.sh` repariert (Locale-/Formatfehler in Freispeicher-Ausgabe behoben)
- **Ergebnis:** ✓ Dry-Run des Cleanup-Skripts erfolgreich durchgelaufen, Protokoll erzeugt
- **Befund:** Externes Ziel `Untitled` aktuell nicht gemountet; sichtbares externes Volume: `trekstor`
- **Naechster Schritt:** Relevante Backup-Pfade auf `trekstor` verifizieren und danach naechsten reversiblen Entlastungsschritt fuer 8-10 GiB frei ausfuehren; parallel Windows-Livetest nach Checkliste starten

### 2026-07-14 — Session 21: Windows-Testumgebung automatisiert bereitgestellt
- **Ziel:** Testumgebung auf MRT ohne Tipplast reproduzierbar vorbereiten
- **Ergebnis:** ✓ Setup-Skript erstellt und ausgefuehrt: `tools/setup-testumgebung-mrt.sh`
- **Ergebnis:** ✓ Testdatei + PreFix-Kopie in MRT abgelegt (`Programm Finanzplanung 5.0_TEST.xls`, `..._preFix.xls`)
- **Ergebnis:** ✓ Startdatei bereitgestellt: `START-TESTUMGEBUNG.command`
- **Ergebnis:** ✓ Windows-Sync 1-Klick-Dateien bereitgestellt unter `Windows-Sync/` (Stand holen / zurueckschreiben)
- **Regel:** Echtdatenmodus aktiv; vor Datenzusammenfuehrung immer Rueckfrage zu Fuehrungsquelle und Konfliktregeln
- **Naechster Schritt:** Windows-Livefix in `frmFinanzen` durchfuehren und Ende-zu-Ende testen

### 2026-07-14 — Session 22: Anti-Amnesie-Guard als Dauerkontrolle eingefuehrt
- **Ziel:** Rueckfall/Ausfall zwischen Mac/Windows/externen Sessions systemisch verhindern
- **Ergebnis:** ✓ `tools/anti-amnesie-guard.sh` eingefuehrt und in `tools/new-session.sh` integriert
- **Ergebnis:** ✓ Guard-Lauf validiert: `sync_state=gleich`, `handoff_state=PASS`
- **Ergebnis:** ✓ Spiegelstatus in MRT-Testumgebung verfuegbar: `ANTI-AMNESIE-STATUS.txt`
- **Naechster Schritt:** Session-Ende mit Commit/Push und finalem Tagesstand abschliessen

### 2026-07-22 — Session 23: Mac-Reentry und Windows-Sync-Übernahme
- **Ziel:** Den aktuellen Windows-Arbeitsstand wieder auf dem Mac sauber anschliessen und die Betriebsdokumentation auf denselben Stand bringen
- **Ergebnis:** ✓ Mac-Stand mit den aktuellen Windows-getriebenen Dokumentationsaenderungen abgeglichen
- **Ergebnis:** ✓ Kernmethode und Pruefmodus als verbindliche Betriebsmechanik lokal verankert
- **Ergebnis:** ✓ Status-, Next-Action- und Lehren-Artefakte auf den neuen Stand gezogen
- **Naechster Schritt:** Windows-Livefix nach Checkliste fortsetzen oder Mac-Freiraum weiter stabilisieren, je nach naechster Prioritaet

### 2026-07-22 — Session 24: Dreisystem-Architektur verbindlich verankert
- **Ziel:** Mac, Windows und Untitled als durchgaengiges, ausfallsicheres Betriebsmodell verbindlich definieren
- **Ergebnis:** ✓ Neues Architektur-Runbook erstellt: `docs/DREISYSTEM-BETRIEBSMODELL.md`
- **Ergebnis:** ✓ Kontinuitaetsregel in `CLAUDE.md` um die Dreisystem-Logik erweitert
- **Ergebnis:** ✓ Start-Checkliste um verpflichtenden Dreisystem-Reentry-Check ergaenzt
- **Naechster Schritt:** Portable Starter- und Restore-Ablauf auf Untitled als gefuehrten Assistenten technisch konkretisieren

### 2026-07-22 — Session 25: Portable Untitled-Starter eingefuehrt
- **Ziel:** Untitled als portable Wiederanlaufinstanz auf Mac und Windows direkt startbar machen
- **Ergebnis:** ✓ Portable-Runbook erstellt: `docs/PORTABLE-UNTITLED-START.md`
- **Ergebnis:** ✓ macOS-Starter erstellt: `tools/portable/start-untitled.command`
- **Ergebnis:** ✓ Windows-Starter erstellt: `tools/portable/START-UNTITLED.cmd`
- **Ergebnis:** ✓ Dreisystem-Modell und Start-Checkliste um Starter-Verweise erweitert
- **Naechster Schritt:** Optional einen automatischen Reentry-Logeintrag im Starter ergänzen und auf beiden Systemen live testen

### 2026-07-22 — Session 26: Portable-Starter Mac live verifiziert, Windows-Test vorbereitet
- **Ziel:** Den ersten Live-Test abschliessen und den Windows-Gegentest reproduzierbar vorbereiten
- **Ergebnis:** ✓ `tools/portable/start-untitled.command` live ausgefuehrt
- **Ergebnis:** ✓ Backup-Ziel erfolgreich erkannt: `/Volumes/Untitled/CloudStation/Documents`
- **Ergebnis:** ✓ Starter-Fix umgesetzt: Resolver-Pruefung auf Dateivorhandensein statt Executable-Bit
- **Ergebnis:** ✓ Windows-Checkroutine als Schrittfolge dokumentiert: `docs/PORTABLE-UNTITLED-START.md` (Abschnitt 7)
- **Naechster Schritt:** Windows-Live-Test mit `tools/portable/START-UNTITLED.cmd` auf Zielsystem ausfuehren und PASS/FAIL in STATUS eintragen

### 2026-07-22 — Session 27: Reversibilitaet als Pflichtstandard verankert
- **Ziel:** Sicherstellen, dass alle Tests auf Mac/Windows/Untitled ohne Schaeden und mit 1:1-Rueckstellung laufen
- **Ergebnis:** ✓ Neuer Standard erstellt: `docs/TEST-SICHERHEIT-ROLLBACK-STANDARD.md`
- **Ergebnis:** ✓ Windows-Testcheckliste um Rollback-Pflicht und Sofort-Abbruchkriterien erweitert
- **Ergebnis:** ✓ Dreisystem-Modell um Reversibilitaetsziel erweitert
- **Ergebnis:** ✓ NEXT-ACTION um verpflichtenden Rollback-Nachweis ergaenzt
- **Naechster Schritt:** Windows-Live-Test ausfuehren und den Rollback-Nachweis (PreFix/Abbruchkriterium/PASS-FAIL) im Session-Log dokumentieren

### 2026-07-22 — Session 28: Rollback-Kurzvorlage operationalisiert
- **Ziel:** Rollback-Nachweis je Testlauf in unter einer Minute erfassbar machen
- **Ergebnis:** ✓ Neue Kurzvorlage erstellt: `docs/ROLLBACK-NACHWEIS-VORLAGE.txt`
- **Ergebnis:** ✓ Setup-Skript kopiert die Vorlage automatisch in die Windows-Testumgebung
- **Ergebnis:** ✓ Windows-Testcheckliste um die Vorlage als Pflicht-Betriebsmittel erweitert
- **Naechster Schritt:** Beim naechsten Windows-Testlauf die Vorlage live ausfuellen und PASS/FAIL in STATUS dokumentieren

### 2026-07-22 — Session 29: Rollback-CSV fuer Auswertung integriert
- **Ziel:** Rollback-Nachweise ueber mehrere Testlaeufe tabellarisch auswertbar machen
- **Ergebnis:** ✓ CSV-Vorlage erstellt: `docs/ROLLBACK-NACHWEIS-VORLAGE.csv`
- **Ergebnis:** ✓ Setup-Skript kopiert TXT- und CSV-Rollbackvorlage in die Testumgebung
- **Ergebnis:** ✓ Windows-Testcheckliste um CSV-Vorlage erweitert
- **Naechster Schritt:** Beim naechsten Windows-Livetest den ersten CSV-Nachweisdatensatz eintragen

### 2026-07-23 — Session 30: Chat-Archivierung und Agenda-Sicherung
- **Ziel:** Die Chat-TXT-Sicherung am Session-Ende verbindlich und reproduzierbar machen
- **Ergebnis:** ✓ `tools/archive-chat.sh` erstellt (Export von VS Code Copilot Transcript nach `logs/chats/`)
- **Ergebnis:** ✓ Aktueller Chat archiviert: `logs/chats/Chat_2026-07-23_Dreisystem-Portable-und-Pruefstand.txt`
- **Ergebnis:** ✓ Protokoll fuer den Sicherungsschritt angelegt: `logs/Protokoll_2026-07-23_Chat-Archiv-und-Agenda-Sicherung.md`
- **Naechster Schritt:** Optional End-Session-Automation (`tools/end-session.sh`) fuer Protokoll + Chat-Archiv + Git-Schritte zusammenfuehren

### 2026-07-23 — Session 31: End-Session-Ein-Klick-Routine eingefuehrt
- **Ziel:** Session-Abschluss als einen reproduzierbaren Befehl bereitstellen
- **Ergebnis:** ✓ `tools/end-session.sh` erstellt (Protokollanlage + Chat-Export + Git-Commit + optional Push)
- **Ergebnis:** ✓ Sicherheitsoptionen verfuegbar: `--dry-run` und `--no-push`
- **Ergebnis:** ✓ Syntaxcheck und Dry-Run erfolgreich ausgefuehrt
- **Naechster Schritt:** Routine beim naechsten realen Session-Ende produktiv mit Thema ausfuehren

### 2026-07-23 — Session 32: Entscheidraster als Standard verankert
- **Ziel:** Themen ab sofort realistisch, schrittweise und nachweisbar entscheiden
- **Ergebnis:** ✓ 4-Punkte-Vorlage erstellt: `docs/ENTSCHEIDRASTER-VORLAGE.md`
- **Ergebnis:** ✓ Start-Checkliste um verbindlichen Raster-Abschnitt erweitert
- **Ergebnis:** ✓ CLAUDE-Regelwerk um den Machbarkeits-/Kompromissmodus ergaenzt
- **Naechster Schritt:** Beim naechsten Thema das Raster live anwenden und den Nachweis in STATUS/Log fuehren

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

**Zuletzt aktualisiert:** 2026-07-23, Session 32 (Entscheidraster als Standard verankert)
**Nächste automatische Review:** Nach erstem live dokumentierten Thema mit vollem 4-Punkte-Raster

<!-- markdownlint-enable MD007 MD009 MD022 MD029 MD032 MD034 MD060 -->
