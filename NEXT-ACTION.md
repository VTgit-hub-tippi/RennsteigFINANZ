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

## DANACH (P1 — Nächste Phase)

P0-A) Mac Speicherreserve ausbauen (akut):
1. Aktuellen Freispeicher dokumentieren und auf mindestens 8 bis 10 GiB stabilisieren.
2. Nur reversible, app-sichere Entlastungsschritte aus dem Runbook anwenden.
3. Backup-Ziel verifizieren: primaer Untitled als Sicherungsebene; falls temporär nicht verfuegbar, dokumentierter Fallback ohne Betriebsstopp.
4. Vorher/Nachher-Messung in Log und STATUS festhalten.

P0-B) Windows Testumgebung live ausfuehren (parallel):
1. Testordner auf dem betrieblichen Windows-Desktop vorbereiten und Testkopie anlegen.
2. Falls Daten fuer den Ablauf benoetigt werden: Kundenpfad oder Gesellschaftspfad gezielt in die Testumgebung kopieren (echte Firmendaten, kein Dummy-Modus).
3. Vor jedem Zusammenfuehren/Ersetzen von Kundendaten verbindliche Rueckfrage stellen (Datensaetze, Fuehrungsquelle, Konfliktregeln, Ersetzungsumfang).
4. VBA-Projekt oeffnen und Stelle im Rueckkehr-Handler lokalisieren (frmFinanzen).
5. Harten Close-Aufruf auf robuste Workbook-Referenz umbauen (Objektbezug statt fixer Name).
6. Live-Demo Ende-zu-Ende durchlaufen (Start -> Suche -> Stammdaten -> Finanzdaten -> Vertragsdaten -> Zurueck).
7. Ergebnis mit Vorher/Nachher dokumentieren und erst danach Uebernahme in Produktivpfad freigeben.
8. STATUS.md und Logdatei mit Befund, Fix und Testergebnis aktualisieren.

Zusatzpflicht (ab sofort):
6. Bei jedem Session-Start `bash tools/it-watch.sh` ausfuehren.
7. Bei `CRITICAL` oder `WARNING` den PLAN aus recovery/it-watch-latest.txt priorisiert umsetzen.
8. Lehren verbindlich verankern: mindestens 3 Lehren je Session erfassen und jeweils als konkrete Regel/Vorlage/Skript absichern.
9. Verankerungsnachweis in `logs/Protokoll_YYYY-MM-DD_[Thema].md` und in `STATUS.md` dokumentieren.
10. Kernmethode verbindlich anwenden: Schnappschuss -> VB-Coding -> Prozesspruefung -> Toolverbesserung.
11. Vor jedem Testlauf PreFix-Kopie, Abbruchkriterium und 1:1-Rollback-Nachweis gemaess `docs/TEST-SICHERHEIT-ROLLBACK-STANDARD.md` sichern.

## Definition of Done
- Freispeicher auf Mac ist stabil im Zielkorridor (mindestens 8 bis 10 GiB) oder mit OFFEN klar begruendet.
- Backup-Ziel ist verifiziert (primaer Untitled) oder mit dokumentiertem Fallback abgesichert.
- Windows-Testkopie ist eingerichtet und vom Produktivpfad getrennt.
- Rueckkehr-Handler in frmFinanzen ist robust umgesetzt (kein harter Workbook-Name).
- Demoablauf laeuft ohne Debugger-Stopp durch.
- Vorher/Nachher-Befund und Rest-Risiken sind dokumentiert.
- IT-Watch-Report liegt aktuell in recovery/it-watch-latest.txt vor.
- STATUS.md ist um die Session und den neuen naechsten Schritt aktualisiert.

## Fallback-Regel
Wenn notwendige Fachdetails fehlen, mit konservativen Platzhaltern arbeiten und als `OFFEN` markieren; keine Blockade durch fehlende Perfektion.

## Danach (P1)
1. Rollen- und Zugriffsrechte v0.1 aus den bereits notierten Use-Cases ableiten.
2. Datenmodell v0.1 auf Basis der stabilisierten Kernablaeufe finalisieren.
3. Compliance-Anforderungen pro Saeule vertiefen und konkretisieren.

<!-- markdownlint-enable MD007 MD009 MD022 MD029 MD032 MD060 -->
