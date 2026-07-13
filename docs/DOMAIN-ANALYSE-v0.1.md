# DOMAIN-ANALYSE v0.2

Statusdatum: 2026-07-09
Zweck: Arbeitsfaehige Startbasis fuer den Maklerbetrieb; fehlende Fachdetails sind explizit als OFFEN markiert.

## KERNMISSION (konkretisiert 09.07.2026)

**RennsteigFINANZ** ist eine **Finanzberatungs- und Vermittlungsgesellschaft** mit vier Geschäftssäulen:

1. **Zentral:** Bedarfsgerechte Kundenberatung (mit strukturierten Bedarfsanalyseverfahren)
2. **Teammodell:** Interdisziplinäre Zusammenarbeit von Generalisten und Spezialisten
3. **Workflow:** Bedarf ermitteln → Lösungen entwickeln → Produkte finden → Verträge vermitteln
4. **Einnahmen:** Provisionen, Courtagen, Honorare, Service-Gebühren (flexibles Modell pro Säule)
5. **Kundenvariabilität:** Bedarfe unterscheiden sich je nach Lebenssituation, Alter, Absicherungswunsch

## GESCHÄFTSSÄULEN (4-Säulen-Modell)

### Säule 1: VERSICHERN
- **Private Versicherungen** (alle Sparten)
- **Gewerbliche Versicherungen** (alle Sparten)

**Services (über Standardleistung hinaus):**
- Schadensituation-Begleitung (Schadensregulierung, "persönlich und kompetent mit starker Stimme")
- Vollständige Versicherungsleistung-Durchsetzung
- Schaden-Management und -Beratung

### Säule 2: SPAREN
- **Bank-Sparen:** Tagesgeldkonten, Sparbücher, Bausparverträge
- **Investment-Sparen:** Depots (begrenzt auf Zulassung + Kompetenz)
  - Ja: Investmentfonds (über Fondsshop: https://finance-cloud.de/page/98184/fonds)
  - Nein: Einzelaktien (außerhalb Kompetenz)

**Services (über Standardleistung hinaus):**
- Persönliche Finanzplanung (Erbschaftsplanung, Vermögensaufbau-Strategie)
- Vermögensaufbau-Konzepte
- Portfolioanalyse und -optimierung
- Laufende Marktüberwachung und Anpassung an Lebenssituation

### Säule 3: FINANZIEREN
- Privatkredite
- Baufinanzierungen
- Bausparfinanzierungen
- Refinanzierungen

**Services (über Standardleistung hinaus):**
- Finanzierungsoptimierungen
- Strukturberatung (welche Finanzierungsform passt?)
- Modernisierungsfinanzierung-Beratung
- Umfinanzierungen analysieren

### Säule 4: RECHTLICHE VORSORGE
- Vorsorgevollmacht
- Patientenverfügungen
- Testamente
- Sorgerechtsvollmachten

**Hinweis:** Keine Rechtsberatung/Steuerberatung selbst; Netzwerkpartner (MSN Anwaltsteam) leisten juristische Unterstützung

**Services (über Standardleistung hinaus):**
- Beratung zur selbstbestimmten Rechtsvorsorge
- Koordination mit Rechtsanwälten
- Erstellungs- und Aktualisierungs-Management

Implikationen fuer Systementwicklung:
- Bedarfsprofile muessen zentral erfasst und verwaltbar sein
- Beratung ist ein strukturierter Prozess mit Dokumentation
- Produktempfehlung basiert auf ermitteltem Bedarf pro Säule
- Compliance-kritisch: Beratung + Bedarf + Begründung müssen nachweisbar sein
- System muss mehrsparten-fähig sein (nicht nur Versicherung)
- **KRITISCH:** System ist nicht nur "CRM für Kundenberatung"
- Das System muss **3-4 Organisationsabteilungen** verbinden:
  1. **Kundenberatung** (Kundenbetreuer, Spezialisten)
  2. **Back-Office/Assistenz** (E-Mail, Post, Terminverwaltung, Gesprächsvorbereitung)
  3. **Rechnungswesen & Controlling** (Provisionen, Courtagen, Service-Gebühren, Steuern)
  4. **Datenschutz & Compliance** (übergreifend)

## 1) Rollen und Kernverantwortung

### Organisationsmodell: Generalisten + Spezialisten

**Spezialist:**
- Fachgebietsexperte mit Hoheitswissen
- Sehr hohe spezielle Fachkenntnis und -erfahrung (Jahrzehnte entwickelt)
- Deep Expertise in einer Säule/Sparte

**Generalist (Kundenbetreuer):**
- Fachspezialist in übergreifenden komplexen Fachgebieten
- Breiteres Beratungsspektrum (mehrere Säulen)
- Hohe Fachkompetenz über Grenzen hinweg
- **Trägt die persönliche Kundenbeziehung** und das Vertrauen

**Zusammenarbeit:**
- Polytechnische interdisziplinäre Kooperation
- Generalist kann allein beraten (auch komplexe Fälle: Brände, Schäden)
- Generalist kann mit Spezialisten kooperieren (Schadenregulierer, Rechtsanwälte, Versicherungsberater)
- Mehrere Ansprechpartner pro Kunde möglich (je nach Sachverhalt/Säule)

### Rollen nach Betriebsfunktion

1. **Kundenbetreuer (Generalist)**
   - Akquise und Beratung von Kunden (Erstaufnahme → Analyse → Folgetermine)
   - Bedarfsanalyse, Dokumentation, Vorgangsbegleitung
   - Trägt die Kundenbeziehung

2. **Spezialist (nach Säule: Versicherung, Sparen, Finanzierung, Vorsorge)**
   - Tiefe Fachberatung bei komplexen Sachverhalten
   - Produktempfehlungen mit Hoheitswissen
   - Schadensituationen, Spezialfälle

3. **Innendienst**
   - Vorgangsbearbeitung, Dokumentenmanagement, Fristenkontrolle
   - Rückfragen mit Gesellschaften und Kunden
   - Datenpflege im Bestand

4. **Buchhaltung**
   - Prüfung von Courtage-/Provisionsabrechnungen
   - Soll-Ist-Abgleich, Mahn- und Klärfälle
   - Monats-/Quartalsauswertungen

5. **Leitung (Inhaber/Prokurist)**
   - Steuerung von Vertrieb, Bestand, Ertrag
   - Qualitätssicherung und Priorisierung
   - Compliance- und Betriebsentscheidungen

## 2) Beratungsablauf: Erstaufnahme bis Umsetzung

### Phase 1: ERSTKONTAKT (meist auf Empfehlung)
- Information über Firmenphilosophie und Arbeitsweise
- Erklärung: Warum korrekte Datenaufnahme? Maklermandate? Service-Gebühren?
- Vertrauensbasis zwischen Kundenbetreuer und Kunde schaffen

### Phase 2: ERSTAUFNAHME (Fragebogen-Interview)
- Systematische Datenabfrage mittels **Analysebogen** (siehe Abb. oben)
- Der Fragebogen wird zur **Grundlage für alles Folgende**
- Der Kundenbetreuer führt das Interview durch

### Phase 3: ANALYSE & AUSWERTUNG (zwischen Erstkontakt und Folgetermin)
- Der Kundenbetreuer wertet die Daten aus
- **Bedarfssituationen** werden identifiziert (z. B. Versicherungslücken, Optimierungspotenziale)
- **Erste Produktvorschläge** werden entwickelt (mit Rationale)
- Auswertung wird dokumentiert

### Phase 4: FOLGEGESPRÄCH (Konkretisierung & Arbeitsteilung)
- Analyse wird präsentiert und diskutiert
- Bedarfe werden konkretisiert und priorisiert
- **Erste Schritte werden vereinbart**
- **Arbeitsteilung:** Je nach Komplexität/Säule werden Spezialisten einbezogen
- Kundenbetreuer bleibt Ansprechpartner, koordiniert Spezialisteneinsatz

### Phase 5: SPEZIALISTENEINSATZ (bei Bedarf)
- Spezialist berät zu komplexem Sachverhalt (z. B. Finanzierungsstruktur, Schadensituation)
- Spezialist dokumentiert seine Beratung
- Kundenbetreuer integriert Erkenntnisse in Gesamtstrategie

### Phase 6: UMSETZUNG & FOLLOW-UP
- Antrag/Vertrag/Maßnahme wird durchgeführt
- Abschluss und Ablage
- Bestandsverwaltung und periodische Überprüfung

---

## Dokumentation nach Rollenperspektive

- **Analysebogen** = Basis für alles (erfasst Ist-Situation, Handlungsfelder, Ziele)
- **Kundenbetreuer** dokumentiert: Interview, Analyse, Empfehlungen, Vereinbarungen
- **Spezialist** dokumentiert: Fachberatung, Produktempfehlungen, Rationale
- **Beide** dokumentieren ihre Tätigkeiten; diese Dokumentationen fließen in Kundenakte

## 3) Zentrale Datenobjekte

1. Kunde
- Stammdaten, Kontaktdaten, Segment, Einwilligungen

2. Vertrag/Police
- Sparte, Tarif, Beginn/Ende, Praemie, Status

3. Gesellschaft
- Versicherer, Produktlinie, Ansprechpartner, Abrechnungskanal

4. Sparte
- Kategorisierung (z. B. LV, KV, Komposit, Gewerbe)

5. Provision/Courtage
- Soll, Ist, Zahlungsdatum, Abweichungsgrund

6. Termin
- Art, Datum, Beteiligte, Ergebnis, Folgeaktion

7. Dokument
- Typ, Version, Gueltigkeit, Zuordnung zu Kunde/Vertrag

OFFEN:
- Eindeutige Schluesselstruktur (IDs), Dublettenlogik und Loeschkonzept.
- Pflichtfelder je Objekt und Validierungsregeln.

## 4) Netzwerkpartner-Ökosystem

**Strategie:** RennsteigFINANZ arbeitet mit Spezialisten und Institutionen zusammen, wo die eigene Kompetenz endet oder Fachlichkeit vertieft werden muss.

### Institutionelle Partner
- **VEMA** — Genossenschaft der Versicherer (Mitgliedschaft, Versicherungs-Rahmenverträge)
- **Thüringer Finanz- und Versicherungsmakler e.V.** — Branchenverband
- **TÜV-Thüringen** — Zertifizierung, Qualitätsprüfung

### Fachspezialisten (Netzwerk)
- **MSN Anwaltsteam** (https://msn-gmbh.de) — Juristische Unterstützung für Kunden (Vorsorge, Testamente, Rechtsvorsorge)
- **GFS** (https://www.gfs-schadenberater.de) — Sachschaden-Spezialist (Schadensituationen, Regulierung)
  - Kontakt: Dieter Freigang ("unser weißer Ritter")

### Produktpartner
- **Finance Cloud / Fondsshop** (https://finance-cloud.de/page/98184/fonds) — Investment-Fonds Plattform
- **Carglass** — KFZ-Glasschaden-Direkthilfe (Partner)

### Marketing & Media
- **BBN Finanzberatung** (https://www.bbn-finanz.de) — Netzwerk-Austausch
- **fink-positiv** (https://www.fink-positiv.de) — Design & Kommunikation
- **Rhön-Rennsteig-Verlag** (https://rrv-online.de/) — Regionale Medien
- **magrida Medien und Design** — Digital-Marketing, Design

### Datenfluss in der Netzwerk-Zusammenarbeit

```
Kundengespräch (RennsteigFINANZ)
    ↓
Bedarf erkannt: "Rechtsvorsorge nötig"
    ↓
MSN Anwaltsteam hinzugezogen
    ↓
Kunde erhält juristische Unterstützung (Vollmacht, Testament)
    ↓
RennsteigFINANZ koordiniert, bleibt Ansprechpartner
```

### Compliance-Implikation
- **Nur Beratung, keine juristische Ausführung:** RennsteigFINANZ vermittelt und koordiniert; rechtliche Verantwortlichkeit liegt bei MSN Anwaltsteam
- **Schadenfälle:** GFS übernimmt Spezialist-Aufgaben; RennsteigFINANZ bleibt Kundenkontakt
- **Produktvertrieb:** Finance Cloud/Fondsshop ist externe Plattform; RennsteigFINANZ leistet Beratung (MiFID II)

---

## 5) Top-5-Schmerzpunkte im Ist-Betrieb

1. Medienbrueche
- Auswirkung: Doppelpflege, Fehler, Zeitverlust.

2. Intransparenter Vorgangsstatus
- Auswirkung: Nachfassen zu spaet, Frist-/Terminrisiken.

3. Schwache Provisionsnachverfolgung
- Auswirkung: Ertragsverluste und hoher Klaeraufwand.

4. Unstrukturierte Dokumentenablage
- Auswirkung: Suchzeiten, Compliance-Risiko, Wissensverlust.

5. Personenabhaengige Prozesse
- Auswirkung: Ausfallrisiko, geringe Skalierbarkeit, Onboarding-Aufwand.

OFFEN:
- Priorisierung der Schmerzpunkte nach betriebswirtschaftlichem Schaden.

## 5) Regulatorische Muss-Anforderungen

1. Datenschutz und Vertraulichkeit (DSGVO)
- OFFEN: Konkretisierung zu Rechtsgrundlagen, Aufbewahrungsfristen, Loeschkonzept.

2. Beratungs- und Dokumentationspflichten
- OFFEN: Verbindliches Soll-Protokoll fuer Beratungsdokumentation.

3. Nachweis- und Revisionsfaehigkeit
- OFFEN: Anforderungen an Audit-Trail, Versionierung, Unveraenderbarkeit.

4. Rollen- und Berechtigungskonzept
- OFFEN: Minimalrechte je Rolle und Freigabeprozesse.

5. Aufbewahrung und Archivierung
- OFFEN: Fristen je Dokumententyp und technische Durchsetzung.

## Naechster Schritt
Aus dieser Domain-Basis das Datenmodell v0.1 ableiten (Entities, Beziehungen, Constraints) und offene Punkte in eine verifizierbare Fragenliste ueberfuehren.
