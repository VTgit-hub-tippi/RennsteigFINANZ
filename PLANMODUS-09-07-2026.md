# 🎯 PLANMODUS — 09.07.2026 (Session 11)

**Datum:** 09.07.2026 22:27:37  
**Status:** Systemanalyse + Priorisierung aktiv  
**Nächste Aktion:** Nutzer-Input erforderlich

---

## 🚨 IT-STATUS (Sofortanalyse)

### Speichersituation
```
Zustand:        CRITICAL ⚠️
Frei:           4 GiB (Sollte: 10-20 GiB)
Belegt:         442 GiB (von 476 GiB = 92.9%)
Trend:          Unveränderт
Risk:           Systemblockade bei nächster größerer Operation
```

### Große Verbraucher (in absteigender Größe)
| Anwendung | Größe | Typ | Aktion möglich |
|-----------|-------|-----|---|
| **DEVONthink 3** | **76 GiB** | Backup/Datenbank | Ja, mit Freigabe |
| **Music** | **75 GiB** | Medienbibliothek | Ja, mit Freigabe |
| **Telegram** | 1 GiB | Chat-Cache | Ja, sicher |
| **Homebrew Cache** | 57 MB | Build-Cache | Ja, sicher |
| **Music-Cache** | 48 MB | Streaming-Cache | Ja, sicher |

### Systemlast (Kandidaten-Prozesse)
```
✓ Metadaten-Indexierung (mds/mdworker) — Multiple Instanzen aktiv
✓ Time Machine (backupd) — Lädt in Hintergrund
✓ iCloud Services (cloudd, bird, photolibraryd, photoanalysisd) — 7 Prozesse aktiv
✓ Music-Cache-Extension — Streaming-Cache
✓ NAS (DiskStation) — ONLINE aber LANGSAM (53.366ms, wahrscheinlich WiFi)
⚠️ adb-Daemon (Android Debug Bridge) — PID 55063, Ursprung unklar
```

---

## 📊 FACHWELT-ANALYSE (Business Design)

### Was ist fertig?
- ✅ 4-Säulen-Modell (VERSICHERN, SPAREN, FINANZIEREN, RECHTLICHE VORSORGE)
- ✅ Organisationsstruktur (Beratung, Back-Office, Buchhaltung, Compliance)
- ✅ 6-phasiger Beratungsablauf dokumentiert
- ✅ Website-Audit (Rennsteigfinanz.de → Säulen + Team bestätigt)

### Was fehlt? (Blockade für Systemarchitektur)
| Punkt | Status | Abhängig von |
|-------|--------|--------------|
| Service-Gebühren-Modell | ⏳ Nutzer-Input | Hochladen Dokumente |
| Maklervertrag + Makler-Vollmacht | ⏳ Nutzer-Input | Hochladen Dokumente |
| Compliance-Anforderungen (detailliert) | 🔄 Recherchierbar | Keine externe Abhängigkeit |
| Rollen & Zugriffsrechte | 🔄 Ableitbar | Compliance-Details |
| Datenmodell v0.1 | ⏳ Nach Compliance | Alles oben |

---

## 🎯 PRIORISIERTE HANDLUNGSSCHRITTE (für nächste 3 Sessions)

### **PHASE 1: SPEICHER STABILISIEREN** (P0 — BLOCKIERT alles)
**Ziel:** Mindestens 8-10 GiB frei machen  
**Dauer:** 20-30 Min  
**Abhängig von:** Nutzer-Entscheidungen

**Stufe 1a (SICHER — keine Freigabe nötig):**
```
1. Homebrew Cache leeren                   (57 MB frei)
2. Telegram partielle Downloads bereinigen (wenn noch vorhanden)
3. Music-Cache leeren                       (48 MB frei)
   → Subtotal: ~100 MB
   → NICHT ausreichend! Weiter zu 1b nötig.
```

**Stufe 1b (MITTELSICHER — Nutzer-Freigabe erforderlich):**
```
4a. DEVONthink Backup-Retention kürzen?     (Potenzial: 10-30 GiB)
   ⚠️ FRAGE: Darf ich Backups älter als 30 Tage löschen?
   
4b. Music-Ordner extern auslagern?         (75 GiB → NAS oder externe Platte)
   ⚠️ FRAGE: Kann ich Music auf ein Backup-Medium verschieben?
   
4c. adb-Daemon klären?                     (Warum läuft Android-Debugging?)
   ⚠️ FRAGE: Darf adb-Daemon gestoppt werden? Ist es noch nötig?

4d. NAS-Latenz prüfen?                     (WiFi vs. Ethernet)
   ⚠️ FRAGE: Läuft NAS auf WiFi? Kann auf Ethernet umgestellt werden?
```

### **PHASE 2: DOKUMENTENEINGANG VERARBEITEN** (P1 — nach Storage freigegeben)
**Ziel:** Fachliche Grundlagen für Rollen, Finanzfluss, Compliance etablieren  
**Dauer:** 30-45 Min  
**Abhängig von:** Phase 1 + Nutzer-Hochladen

```
1. Dokumente clustern nach Themen:
   - Vergütung & Service-Gebühren
   - Vertretungsvollmacht & Rollen
   - Beratungsprozess & Compliance
   
2. Pro Dokument markieren:
   - Fachlicher Zweck
   - Systemwirkung (Datenfluss, Rollen, Regeln)
   - Offene Punkte als OFFEN kennzeichnen
   
3. Output in docs/ aktualisieren:
   - docs/ORGANISATIONSSTRUKTUR.md (Rollen verfeinern)
   - docs/COMPLIANCE-PRO-SAEULE.md (neu, Compliance per Säule)
   - docs/ROLLENMATRIX.md (neu, Zugriffsrechte-Entwurf)
```

### **PHASE 3: COMPLIANCE-RECHERCHE STARTEN** (P1 parallel zu Phase 2)
**Ziel:** Regulatorische Anforderungen pro Säule dokumentieren  
**Dauer:** 60 Min Recherche + 30 Min Dokumentation  
**Abhängig von:** Nichts (kann jetzt schon beginnen)

```
Pro Säule recherchieren:
1. VERSICHERN
   → Maklerrichtlinie (BaFin), Versicherungsvermittlerrichtlinie (Ombudsman?)
   
2. SPAREN & VERMÖGEN
   → MiFID II (Anlageberatungsprotokoll, Eignungsfeststellung, Gebührenoffenlegung)
   
3. FINANZIEREN
   → PSD2 (Zahlungsverkehr), Kreditwürdigkeitsprüfung, Verbraucherkreditrichtlinie
   
4. RECHTLICHE VORSORGE
   → Netzwerkpartner-Verantwortung, Beratungsdokumentation, Vollmachtsverwaltung

Output: docs/COMPLIANCE-PRO-SAEULE.md
```

### **PHASE 4: ROLLEN & ZUGRIFFSRECHTE v0.1** (P2 — nach Phase 1 + 2)
**Ziel:** Matrix: Wer darf Was und Wo?  
**Dauer:** 30 Min  
**Abhängig von:** Phase 1 + 2 + 3

```
Zu definieren:
- Kundenbetreuer (Generalist): Lesezugriff alle Säulen, Schreibzugriff nur Notizen
- Spezialist (pro Säule): Lese-/Schreibzugriff auf Säule + Allokation
- Back-Office/Assistenz: Dateneingabe, Dokumentenverwaltung
- Buchhaltung: Provisionen, Provisionsabrechnung, Finanzberichte
- Compliance-Officer: Audit-Log, Compliance-Checks, Beratungsprotokolle
- Admin: Alles

Output: docs/ROLLENMATRIX-v0.1.md
```

### **PHASE 5: DATENMODELL v0.1** (P2 — nach Phase 1-4)
**Ziel:** Entitäten, Relationships, Constraints  
**Dauer:** 45 Min Entwurf  
**Abhängig von:** Phase 1-4

```
Entitäten (erste Skizze):
- Kunde (+ Basisdaten, Kontakt, Adresse)
- Policy / Versicherung (Deckung, Prämie, Status)
- Finanzprodukt (Sparbuch, ETF, Kredit, etc.)
- Maklervertrag (mit welcher Gesellschaft, Provisionen)
- Beratungstermin (Datum, Teilnehmer, Ergebnis)
- Provisionsabrechnung (Monat, Betrag, Status)
- Beratungsprotokoll (Compliance-relevant)
- Netzwerkpartner (Versicherer, Bank, Berater)

Output: docs/DATENMODELL-v0.1.md
```

---

## ❓ ENTSCHEIDUNGEN ERFORDERLICH (vom Nutzer)

### **Speicherfreigaben**
```
A) DEVONthink Backup-Retention
   Option 1: Behalte alles (Status quo)
   Option 2: Behalte nur letzte 30 Tage (potenziell 10-30 GiB frei)
   Option 3: Behalte nur letzte 7 Tage (aggressiv, möglicherweise zu wenig)
   
   → Was möchte ich?

B) Music-Auslagerung
   Option 1: Music bleibt lokal (Status quo)
   Option 2: Music auf NAS auslagern (NAS muss schnell genug sein)
   Option 3: Music auf externe Platte (USB-Drive/SSD)
   Option 4: Music in Cloud-Service (Streaming-Lösung nutzen)
   
   → Was möchte ich?

C) adb-Daemon
   Option 1: Behalte adb aktiv (für Android-Debugging)
   Option 2: Stoppe adb und registriere Launch-Quelle
   
   → Brauche ich Android-Debugging noch?

D) NAS-Verbindung
   Option 1: WiFi beibehalten
   Option 2: Auf Ethernet umschalten (wenn NAS/Router näher beieinander)
   Option 3: Beide Verbindungen für Failover nutzen
   
   → Kann ich NAS besser anschließen?
```

### **Dokumenteneingang**
```
E) Hochladen
   Welche Dokumente stehen bereit zum Hochladen?
   - Service-Gebühren-Dokument (PDF/Excel?)
   - Maklervertrag-Template
   - Makler-Vollmacht-Template
   - Weitere interne Papiere?
   
   → Können diese hochgeladen werden?
```

---

## ✅ WORKPLAN FÜR DIESE SESSION

### **Sofort (jetzt)**
```
[ ] 1. Entscheidungen aus der ❓ Sektion treffen
[ ] 2. Storage-Freigaben genehmigen (oder ablehnen)
[ ] 3. Dokumenteneingang planen: Welche Dateien und wann?
```

### **Abhängig von Entscheidung**
```
WENN Storage freigegeben → 
[ ] 4. Homebrew + Telegram + Music-Cache bereinigen (P0)
[ ] 5. DEVONthink / Music-Auslagerung durchführen (P1b)

IMMER (unabhängig von Storage) →
[ ] 6. Compliance-Recherche Phase 1: VERSICHERN + SPAREN
[ ] 7. Compliance-Recherche Phase 2: FINANZIEREN + RECHTLICHE VORSORGE
[ ] 8. Ergebnisse in docs/COMPLIANCE-PRO-SAEULE.md dokumentieren
```

### **Nach Dokumenteneingang**
```
[ ] 9. Dokumente verarbeiten & clustern (Phase 2)
[ ] 10. Rollen & Zugriffsrechte verfeinern
[ ] 11. Datenmodell v0.1 skizzieren
```

---

## 📋 DEFINITION OF DONE (diese Session)

- [ ] IT-Status stabil (mindestens 8 GiB frei ODER klare Roadmap für Auslagerung)
- [ ] Compliance-Recherche Phase 1+2 abgeschlossen → docs/COMPLIANCE-PRO-SAEULE.md
- [ ] Dokumenteneingang geplant oder teilweise durchgeführt
- [ ] STATUS.md aktualisiert mit neuem nächsten Schritt
- [ ] Dieser PLANMODUS-Report in STATUS.md referenziert

---

## 🚀 NÄCHSTER SCHRITT

**Nutzer entscheidet über die 5 Fragen (A-E oben).**

Dann folgt automatisch der nächste konkrete Arbeitsschritt aus diesem Plan.

---

**Erstellt:** 2026-07-09 22:30:00  
**Gültig bis:** Nutzer-Input oder nächste wesentliche Systemänderung  
**Verantwortlich:** Claude Code (Scribe & Executor)
