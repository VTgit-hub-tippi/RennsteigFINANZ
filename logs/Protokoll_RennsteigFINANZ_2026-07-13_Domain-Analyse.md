# Sitzungsprotokoll — RennsteigFINANZ: Domain-Analyse Maklerbetrieb
**Datum:** 13.07.2026
**Teilnehmer:** Herr Tippmann (Betriebsleiter), Claude (Berater)
**Gerätewechsel:** Session begann auf Mac (Internetausfall durch Anbieterwechsel Deutsche Glasfaser → Telekom), fortgesetzt auf iPhone, wird auf iPad fortgesetzt.

---

## Kontext: Geräte- und Konnektivitätslage

- Mac aktuell ohne Internet (Anbieterwechsel), daher kein VS Code / Claude Code nutzbar.
- Geklärt: Claude Code "Remote Control" (Steuerung einer laufenden lokalen Session vom Handy aus) hätte hier ohnehin nicht geholfen, da die Remote-Verbindung eine funktionierende Internetverbindung *auf dem Mac selbst* voraussetzt — das Handy/iPad ist nur ein Fenster in die lokale Session, nicht deren Ersatz.
- Konzeptionelle Arbeit (dieses Gespräch) funktioniert unabhängig davon über Claude.ai auf jedem Gerät.

---

## Ziel der Session

Fortsetzung der im STATUS.md vorgesehenen Domain-Knowledge-Phase: Verständnis des Maklerbetriebs vertiefen, ausgehend vom priorisierten Schmerzpunkt.

**Priorisierter Schmerzpunkt (per Abfrage bestätigt):** Datenverteilung — mehrere Systeme, keine zentrale Sicht. Bezieht sich auf den **eigenen Maklerbetrieb** von Herrn Tippmann (nicht auf ein Produkt für Dritte).

---

## Erarbeitete Datenlandschaft

### VEMA Office
- Führt den Eigenbestand an Kunden und Verträgen.
- Abgleich mit Versicherern über BiPro-Standard.
- Abrechnung läuft überwiegend hier.

### VEMA Pool
- Verträge, die zu Abrechnungszwecken aus dem eigenen Bestand an die VEMA übergeben wurden.
- **Wichtige Präzisierung:** Durch die Übergabe wird VEMA formal der bestandsführende Makler. Das bedeutet realen Zugriffsverlust — nur VEMA hat direkten Zugriff auf die Bestandsführungsportale der Versicherer, nicht mehr der eigene Betrieb. Schnelle Auskünfte/Auswertungen sind dadurch eingeschränkt; Anfragen müssen beim Pool gestellt werden.
- Das Poolsystem selbst arbeitet operativ gut und schnell (Kommunikation zu Versicherern, Pool, Dritten). Das eigentliche Problem liegt nicht in der Poolarbeit, sondern in der bislang unvollständigen **Abbildung/Transparenz der Pool-Verträge im Office**.
- VEMA arbeitet bereits aktiv daran, Pool-Verträge korrekt im Office darzustellen — eine sich bessernde, aber extern kontrollierte Situation.
- Direktzugriff auf die Verwaltungssysteme der Versicherer selbst bleibt strukturell ausgeschlossen (Marktregel: nur der bestandsführende Makler hat Zugriff).

### Outlook
- Aktuell noch nicht direkt mit VEMA Office verbunden (Schnittstelle in Vorbereitung, Termin offen).
- Fungiert faktisch bereits heute als zentraler Eingangskanal für beide VEMA-Welten: GDV-Daten sowie alle vom Pool verarbeiteten Informationen (Vertragskopien, Schadeninformationen) laufen parallel und zügig über Outlook ein.
- Manueller Arbeitsschritt: GDV-Daten werden von dort aus zur VEMA hochgeladen.

### Eigene Ablage (lokale Pfadstruktur)
- Ursprünglich als Sicherheitskomponente gedacht (Internetausfall, Sperre), in der Praxis aber aktive Primärablage.
- **Struktur:** Kundenebene standardisiert nach Nachname/Vorname; bei Neuanlage werden automatisch feste Pfade angelegt.
- **Vertragsebene:** Untergruppierung je Vertrag, benannt nach Sparte/Gesellschaft + Vertragsnummer + ggf. Kennzeichen zur Unterscheidung — ohne verbindliche Namensrichtlinie, sondern eingespielte Praxis.
- **Archivierung:** Beendete Verträge/Kunden erhalten das Kürzel „ex", werden nicht gelöscht — vollständige Historie bleibt erhalten.
- **Zentraler Befund:** Diese Ablage bildet zusätzlich Nicht-Versicherungssparten ab (Sparen, Finanzieren, rechtliche Vorsorge, Steuer u. a.), die bei VEMA nicht sauber erfassbar sind. Die eigene Ablage ist damit inhaltlich bereits die vollständigere Kundenakte — nur unstrukturiert als Dateisystem statt als Datenbank geführt.

### Abrechnungs-Excel
- Bankbuchungssätze werden aktuell per Copy-Paste eingelesen; Tabelle enthält **keine Kundendaten**, nur Abrechnungs-/Provisionsdaten.
- Bei mehreren Anbietern bestehen bereits separate Untervermittlernummern (Firma + Vermittler), wodurch direkte Abrechnung möglich ist — Summenabrechnung läuft dann am saubersten über die VEMA-Abrechnung.
- Bei Anbietern ohne diese doppelte Nummernstruktur ist der Abgleich aufwändiger.
- Von den Gesellschaften erhaltene CSV-Dateien enthalten Abrechnungsdaten auf **Einzelvertragspositions-Ebene** der Kunden. Diese werden aktuell primär archiviert bzw. zur Summenbildung für Vermittler genutzt.
- **Offener Punkt (bewusst zurückgestellt):** Eine Auswertung "welcher Kunde welche Erträge bringt" wäre wünschenswert, ist aber aktuell zu aufwändig für manuelle Verknüpfung. Da der Kundenbezug über die Vertragsnummer in den Rohdaten technisch bereits vorhanden ist, wurde dies als **früher Nutzen-Kandidat für RennsteigFINANZ** notiert — sobald Vertragsnummer als gemeinsamer Schlüssel zwischen Abrechnungsdaten und Kundenstamm etabliert ist, ließe sich das nahezu automatisch mitführen.

### Finanzplanungs-Tool
- Noch nicht vertieft — Session wurde hier wegen Gerätewechsel unterbrochen.

---

## Offene Fragen für die Fortsetzung (Finanzplanungs-Tool)

Zum Tool selbst:
- Eigenständige Software oder selbstgebaute Excel-Vorlage/Berechnungslogik?
- Läuft es komplett getrennt von VEMA und der eigenen Ablage, oder gibt es bereits eine manuelle Verbindung (Werte werden von Hand übertragen)?

Zu den AMS-Altdaten:
- Was genau wurde aus AMS übernommen — historische Vertragsdaten, Kundendaten, oder beides?
- Einmaliger Datenimport (abgeschlossen) oder laufender Datenzufluss?

Zur Nutzung:
- Einsatzhäufigkeit und -anlass — nur Finanzplanung für Privathaushalte, oder auch anderswo?
- Wer pflegt die Daten dort — nur Herr Tippmann, oder auch andere im Betrieb?

---

## Stand zum Sitzungsende

- Domain-Analyse zu VEMA Office, VEMA Pool, Outlook, eigener Ablage und Abrechnungs-Excel abgeschlossen.
- Finanzplanungs-Tool: noch offen, s. Fragenkatalog oben.
- Kundenberatung (Jahresgespräche, Sparten-/Themen-Einzeltermine) sowie Rollen-Definition und Kern-Use-Cases: noch nicht begonnen.
- Ein früher Nutzen-Kandidat wurde identifiziert: Ertragsauswertung pro Kunde aus vorhandenen CSV-Positionsdaten.

## Nächste Schritte

1. Fortsetzung auf iPad: Finanzplanungs-Tool anhand der offenen Fragen vertiefen.
2. Danach: Kundenberatung besprechen, oder direkt zur Rollen-Definition (nächster STATUS.md-Schritt) übergehen — Entscheidung bei Herrn Tippmann.
3. Diese Erkenntnisse perspektivisch in STATUS.md / CLAUDE.md bzw. eine Log-Datei im Repository überführen, sobald Mac/VS Code wieder erreichbar sind, damit Claude Code (CTO/Architekt) auf demselben Stand ist.
