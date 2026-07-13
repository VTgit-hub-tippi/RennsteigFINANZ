# CLAUDE.md — RennsteigFINANZ Projektkontext

> **Für jede KI, die neu einsteigt (Claude Code, Claude.ai, ChatGPT, DeepSeek o.a.):**
> Lies diese Datei zuerst vollständig. Lies danach STATUS.md. Dann bist du sofort auf dem aktuellen Stand — keine Rückfragen nötig.

---

## Worum geht es?

**RennsteigFINANZ** ist ein Maklerbetrieb (Versicherungen + Finanzprodukte), geführt von Herrn Volker Tippmann als Betriebsleiter.

Ziel dieses Projekts: Eine KI-gestützte Infrastruktur aufbauen, die den Betrieb in seinen zentralen Abläufen unterstützt — von der Kundenverwaltung über Beratungsvorbereitung bis hin zu Abrechnungsauswertungen.

## Arbeitsweise / Kontinuitätsprinzip

- **GitHub ist das zentrale Gehirn.** Jede Session endet mit einem Commit. Wer einsteigt, liest dieses Repository — fertig.
- **Keine Plattform-Bindung.** Claude Code, Claude.ai, ChatGPT, DeepSeek — alle können und sollen nahtlos einsteigen.
- **Automatische Session-Dokumentation.** Jede Arbeitssitzung erzeugt: ein Protokoll in `/logs/`, ein STATUS.md-Update, einen Commit.
- **Chat-Verläufe** werden als TXT in `/logs/chats/` gesichert.

## Pflichtablauf am Session-Ende (für JEDE KI, IMMER)

1. Protokoll der Session unter `/logs/Protokoll_YYYY-MM-DD_[Thema].md` ablegen
2. STATUS.md aktualisieren
3. Chat-Verlauf als TXT unter `/logs/chats/Chat_YYYY-MM-DD_[Thema].txt` sichern
4. `git add -A && git commit -m "Session YYYY-MM-DD: [Thema]" && git push`

Kein manuelles Nachfragen. Kein "soll ich das noch speichern?". Immer. Automatisch.

## Rollen im Betrieb

| Rolle | Person/Funktion |
|---|---|
| Betriebsleiter / Generalist | Herr Tippmann (Finanzplanung, Bausparen, Finanzieren, alle Sparten) |
| Fachspezialisten (3) | Kfz, Gewerbliche Risiken, Krankenversicherung + Biometrische Risiken |
| Investment-Spezialist | Kapitalanlagen, Fondssparen, Depotführung, Erben/Schenken |
| Assistenz | Vor-/Nachbereitung Beratungen, Dokumentenverwaltung |
| Administrator (IT) | EDV, Infrastruktur, portable Arbeitsumgebung |

## Kernsysteme im Betrieb

- **VEMA Office** — Eigenbestand Kunden/Verträge, BiPro-Abgleich
- **VEMA Pool** — Poolverträge (VEMA = formaler Bestandsmakler; Direktzugriff auf Versicherer eingeschränkt)
- **Outlook** — zentraler Eingangskanal (GDV-Daten, Pool-Informationen); Schnittstelle zu VEMA in Vorbereitung
- **Eigene Ablage** (lokale Pfadstruktur) — vollständigste Kundenakte; enthält auch Nicht-Versicherungssparten
- **Abrechnungs-Excel** — Provisionsdaten; CSV-Einzelpositionsdaten von Gesellschaften vorhanden
- **Finanzplanungs-Tool** — Eigenentwicklung (VBA/Excel, Herr Tippmann); zentrales Beratungsinstrument; **Haushalt als aggregierende Entität** ist das wichtigste Datenmodell-Konzept

## Zentrale fachliche Konzepte

- **Haushalt als aggregierende Entität**: Verträge verschiedener Sparten werden im Haushaltskontext verknüpft (dynamisch auflösbar bei Trennung/Auszug).
- **Bedarf vor Produkt**: Kein Bedarf = kein Produkt. Bedarfsermittlung ist dem Produkt fachlich vorgelagert.
- **Vermögensaufbau ≠ Altersvorsorge**: Altersvorsorge erfordert zwingend biometrische Risikoabsicherung (z.B. BU-Beitragsfreistellung).

## Identifizierte Nutzen-Kandidaten (noch keine Use-Cases)

1. Ertragsauswertung pro Kunde aus CSV-Positionsdaten der Abrechnung
2. Automatisierter Bestandslisten-Abgleich (Soll-Ist, Vertragsnummer als Schlüssel)
3. KI-Assistenz: Vor-/Nachbereitung von Beratungen
4. Automatisierte Zusammenfassung der wöchentlichen Arbeitsbesprechung
5. Investment-Spezialist: Depotführung, Kontrolle, plattformübergreifende Entscheidungsschicht
6. Beratungsgespräch-Mitschnitt/-Protokollierung (inkl. Überlegungszeit-Nachweis § 61 VVG)
7. Administrator: portable, stabile, redundante Arbeitsumgebung

## Wichtige Rahmenbedingungen

- **Altersvorsorgedepot** (Riester-Nachfolger): beschlossenes Recht, Inkrafttreten 01.01.2027. Vorbereitungszeit: ca. 6 Monate.
- **IT-Grundproblem**: Windows-Instabilität (Updates verändern Berechtigungen). Kernanforderung: portable Arbeitsumgebung.
- **Beratungsphilosophie**: persönlich, analog, "Auge in Auge". KI unterstützt, ersetzt nicht.
- **Zugriffsphilosophie intern**: offenes Kernteam; Einschränkungen nur für Praktikanten/geringfügig Beschäftigte.

## Offene Blocker (Stand 13.07.2026)

| Punkt | Status |
|---|---|
| Tech-Stack | offen — größter Blocker |
| VEMA-Datenimport ins Finanzplanungs-Tool | technisch offen |
| Windows-Instabilität | neu aufgenommen, noch nicht priorisiert |
| Kundenanzahl/Datenmenge | noch nicht erhoben |

## Noch nicht behandelte Domain-Themen

- Schadensbearbeitung
- Datenschutz / DSGVO
- Akquise / Marketing / Kampagnen
