# USE-CASES v0.1

Statusdatum: 2026-07-14
Zweck: Ableitung von 5 belastbaren Kern-Use-Cases aus dem geklaerten Domain-Stand (Finanzplanungs-Tool, Bestandslisten, Beratung, Rollenmodell).

## Leitlinie

- Fuehrende Arbeitsoberflaeche: Finanzplanungs-Tool
- Zentrale Datenquellen fuer Abgleich und Zuordnung: VEMA/Pool-Bestaende, AMS-Altdaten, Bestandslisten der Gesellschaften, Provisions-/Courtage-CSV
- OFFEN-Punkte werden markiert, blockieren den Entwurf aber nicht

## Use-Case 1: Jahresgespraech steuern und dokumentieren

- Ziel: Regelmaessige, nachvollziehbare Kundenberatung mit vorbereitetem Gesamtbild je Haushalt.
- Ausloeser: Faelligkeit Jahresrhythmus oder anlassbezogener Trigger (z. B. Geburtstag, Lebensereignis).
- Datenquellen: Finanzplanungs-Tool (Haushaltsuebersicht), Kundenakte, Vertragsbestand, letzte Beratungsprotokolle.
- Beteiligte Rollen: Kundenbetreuer (fuehrend), Assistenz (Vor-/Nachbereitung), bei Bedarf Spezialist.
- Ergebnis: Durchgefuehrtes Gespraech mit priorisierten Massnahmen, Folgeaufgaben und revisionsfaehigem Beratungsprotokoll.
- OFFEN: Einheitlicher Trigger- und Wiedervorlage-Mechanismus (Kalender/Workflow) noch nicht final definiert.

## Use-Case 2: Bestandslisten-Abgleich per Vertragsnummer

- Ziel: Soll-Ist-Transparenz ueber uebernommene, fehlende oder fehlerhafte Vertraege je Gesellschaft.
- Ausloeser: Neue Bestandsliste der Gesellschaft oder regelmaessiger Abgleichstermin.
- Datenquellen: Gesellschaftslisten (Excel/CSV), eigener Bestand, VEMA Office/Pool-Informationen.
- Beteiligte Rollen: Innendienst/Assistenz (operativ), Kundenbetreuer (Fachklaerung), Spezialist bei Sonderfaellen.
- Ergebnis: Abweichungsliste mit Status (OK, fehlt, inkonsistent), priorisierte Klaerfaelle.
- OFFEN: Verbindliche Normalisierung fuer heterogene Spaltenformate der Gesellschaftslisten.

## Use-Case 3: Provisionsabrechnung Soll-Ist und Ertragssicht pro Kunde

- Ziel: Abrechnungsabweichungen frueh erkennen und Ertragsbeitrag je Kunde/Vertrag belastbar auswerten.
- Ausloeser: Eingang neuer Abrechnungsdaten (CSV/Abrechnungslauf).
- Datenquellen: Provisions-/Courtage-CSV auf Einzelpositionsbasis, Abrechnungs-Excel, Vertragszuordnung ueber Vertragsnummer.
- Beteiligte Rollen: Buchhaltung (fuehrend), Innendienst (Datenpflege), Leitung (Controlling).
- Ergebnis: Klaerfaelle, Nachverfolgung offener Zahlungen und periodische Ertragsauswertung.
- OFFEN: Vollstaendige, stabile Vertragsnummern-Zuordnung zwischen allen Quellen noch nicht final verifiziert.

## Use-Case 4: Assistenz-Workflow fuer Vor- und Nachbereitung

- Ziel: Standardisierte Entlastung der Beratung durch klare To-dos vor und nach Gespraechen.
- Ausloeser: Geplanter Termin oder abgeschlossenes Beratungsgespraech.
- Datenquellen: Terminplan, Kundenakte, Dokumentenablage, offene Aufgaben/Fristen.
- Beteiligte Rollen: Assistenz (fuehrend), Kundenbetreuer, optional Spezialist.
- Ergebnis: Vollstaendige Unterlagen, saubere Nachbearbeitung, termingerechte Folgeaktionen.
- OFFEN: Einheitliche Aufgaben- und Fristenansicht ueber alle Quellen ist noch nicht umgesetzt.

## Use-Case 5: Spezialisten-Einsatz in komplexen Faellen

- Ziel: Fachlich tiefe Beratung sicherstellen, ohne die Gesamtverantwortung der Kundenbeziehung zu verlieren.
- Ausloeser: Komplexer Bedarf in Saeulen wie Finanzierung, Investment, Schaden oder Rechtsvorsorge.
- Datenquellen: Bedarfsermittlung/Analysebogen, Haushaltskontext im Finanzplanungs-Tool, Spezialistenunterlagen.
- Beteiligte Rollen: Kundenbetreuer (koordiniert), passender Spezialist (fachlich fuehrend), Assistenz (Dokumentation/Koordination).
- Ergebnis: Abgestimmte Loesung mit klarer Verantwortlichkeit, dokumentierter Empfehlung und umsetzbarer Massnahmenliste.
- OFFEN: Standard fuer gemeinsame Dokumentation Kundenbetreuer plus Spezialist pro Fall muss noch konkretisiert werden.

## Gemeinsame Mindestfelder (pro Use-Case)

- Kunde/Haushalt
- Anlass/Ausloeser
- Beteiligte Rollen
- Verwendete Datenquellen
- Entscheidung/Ergebnis
- Folgeaufgabe mit Termin
- Nachweis/Protokollstatus

## Naechster Schritt

1. Rollen- und Zugriffsrechte v0.1 aus diesen Use-Cases ableiten.
2. Danach Datenmodell v0.1 (Objekte, Beziehungen, Pflichtfelder, Dublettenlogik) finalisieren.
