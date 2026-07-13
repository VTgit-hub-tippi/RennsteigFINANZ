# ORGANISATIONSSTRUKTUR RennsteigFINANZ

Statusdatum: 2026-07-09  
Zweck: Überblick der Abteilungen und Funktionen für Systemarchitektur

---

## Überblick: 4 Organisationsebenen

```
RennsteigFINANZ GmbH & Co. KG
│
├─ BERATUNG (kundenorientiert)
│  ├─ Generalisten (Kundenbetreuer)
│  └─ Spezialisten (pro Säule/Sparte)
│
├─ BACK-OFFICE / ASSISTENZ (operativ)
│  ├─ Kundenservice & Korrespondenz
│  ├─ Terminverwaltung
│  └─ Dokumentenmanagement & Ablage
│
├─ RECHNUNGSWESEN & CONTROLLING (finanziell)
│  ├─ Einnahmen (Provisionen, Courtagen, Service-Gebühren, Honorare, Abschlussgebühren)
│  ├─ Ausgaben & Buchhaltung
│  └─ Steuerliche Belange & Auswertungen
│
└─ DATENSCHUTZ & COMPLIANCE (übergreifend)
   ├─ Datenschutz & Datenverarbeitung
   ├─ Sorgfaltspflichten ordentlicher Kaufleute
   └─ Beratungsdokumentation & Archivierung
```

---

## 1) BERATUNG

### Kundenbetreuer (Generalist)
- **Fachkompetenz:** Breitere Beratung, übergreifend über mehrere Säulen
- **Kundenbeziehung:** Trägt die persönliche Kundenbeziehung, Vertrauen
- **Prozess:**
  - Phase 1: Erstkontakt (Firmenphilosophie erklären)
  - Phase 2: Erstaufnahme (Fragebogen-Interview)
  - Phase 3: Analyse & Auswertung
  - Phase 4: Folgegespräch (ggf. mit Spezialisten)
- **Dokumentation:** Fragebogen, Analyseergebnisse, Empfehlungen, Vereinbarungen

### Spezialist (nach Säule)
- **Fachkompetenz:** Tiefe Expertise in einer Säule (Versicherung, Sparen, Finanzieren, Vorsorge)
- **Hoheitswissen:** Jahrzehnte Erfahrung, tiefe Branchenkompetenz
- **Einsatz:** Bei Bedarf hinzugezogen für komplexe Sachverhalte
- **Kooperation:** Mit Kundenbetreuer und evtl. Netzwerkpartnern
- **Dokumentation:** Fachberatung, Produktempfehlungen, Rationale

---

## 2) BACK-OFFICE / ASSISTENZ

### Kundenservice & Korrespondenz
- **E-Mail-Management:** Ein- und Ausgang, Weiterleitung
- **Postbearbeitung:** Eingang, Sortierung, Archivierung
- **Korrespondenzen:** Briefe, Bestätigungen, Informationen

### Terminverwaltung
- **Kalender:** Termine für Kundengespräche, Besprechungen, Fristen
- **Erinnerungen:** Vor Terminen an Kundenbetreuer und Team
- **Terminbestätigung:** Mit Kunden absprechen

### Dokumentenvorbereitung & Nachbereitung
- **Vor Beratungsgespräch:** Kundenakte zusammenstellen, Fragebogen drucken, Unterlagen vorbereiten
- **Nach Beratungsgespräch:** Notizen transkribieren, Dokumente ablegen, Folgeschritte notieren
- **Ablage:** Ordnungsgemäße Speicherung und Archivierung

---

## 3) RECHNUNGSWESEN & CONTROLLING

### Einnahmen
- **Provisionen** — von Versicherungsgesellschaften für vermittelte Verträge
- **Courtagen** — Vermittlungsgebühren bei bestimmten Produkten
- **Abschlussgebühren** — Gebühren bei Vertragsabschluss
- **Honorare** — direkt vom Kunden für Beratung/Planung
- **Service-Gebühren** — Zusatzleistungen über Standard-Leistungsspektrum hinaus

### Ausgaben & Buchhaltung
- **Betriebsausgaben** (Miete, IT, Personal, etc.)
- **Provisionsauskehrungen** (an Partner/Netzwerk)
- **Sonstiges** (Reisen, Fortbildung, etc.)

### Steuerliche Belange
- **Quartals-/Jahresabschlüsse**
- **Umsatzsteuer, Einkommensteuer**
- **Compliance mit Steuerbehörden**

### Datenfluss
- **Input:** Beratungsdokumente, Vertragsabschlüsse, Service-Vereinbarungen
- **Output:** Rechnungen, Provisionsabrechnungen, Finanzberichte

---

## 4) DATENSCHUTZ & COMPLIANCE (übergreifend)

### Datenschutz & Datenverarbeitung
- **Datenschutzerklärung** (DSGVO-konform)
- **Datenaufbewahrung** (Aufbewahrungsfristen je Dokumenttyp)
- **Kundendaten-Sicherheit** (Zugriffskontrolle, Verschlüsselung)

### Sorgfaltspflichten ordentlicher Kaufleute
- **Beratungsqualität** — Fachkompetenz, Dokumentation
- **Interessenskonflikte** — Offenlegung, Unabhängigkeit
- **Kundenschutz** — Faire Behandlung, Transparenz

### Beratungsdokumentation & Archivierung
- **Beratungsprotokolle** — müssen erstellt und aufbewahrt werden
- **Archivierung** — je nach Produkt/Säule unterschiedliche Aufbewahrungsfristen
- **Compliance-Anforderungen:**
  - **Versicherung (VERSICHERN):** Maklerrichtlinie, BaFin-Anforderungen
  - **Investmentfonds (SPAREN):** MiFID II (Beratungsprotokoll, Eignung)
  - **Kreditvermittlung (FINANZIEREN):** PSD2, Kreditwürdigkeitsprüfung
  - **Vorsorge (RECHTLICHE VORSORGE):** Netzwerkpartner-Verantwortung, ggf. Beratungsdokumentation

---

## Datenfluss durch die Organisation

```
BERATUNG:              BACK-OFFICE:           RECHNUNGSWESEN:
│                      │                      │
├─ Kundengespräch      ├─ Fragebogen         ├─ Provisionsabrechnung
├─ Fragebogen          │  vorbereiten        │
├─ Analyse             ├─ Nachbereitung      ├─ Service-Gebühr Fakturierung
├─ Empfehlungen        │  Dokumentation      │
├─ Vertragsabschluss   ├─ Ablage, Archiv     ├─ Steuerliche Erfassung
└─ Service-Vereinbarung├─ Terminverwaltung   └─ Finanzberichte
                       └─ Korrespondenz
```

---

## Nächste Schritte für Systemgestaltung

1. **Benutzer-Rollen definieren** (Kundenbetreuer, Spezialist, Back-Office, Buchhaltung, Admin)
2. **Zugriffsrechte festlegen** (wer sieht was? wer darf editieren?)
3. **Automatisierungen planen** (z. B. Provisionskalkulation, Archivierungsfristen)
4. **Integrationspunkte klären** (externe Systeme wie Accounting-Software, Dokumentenverwaltung)
5. **Compliance-Module** (Audit-Logs, Archivierung, Datenschutz-Reporting)
