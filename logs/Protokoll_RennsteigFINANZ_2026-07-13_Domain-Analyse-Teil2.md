# Sitzungsprotokoll — RennsteigFINANZ: Domain-Analyse (Fortsetzung, Teil 2)
**Datum:** 13.07.2026
**Teilnehmer:** Herr Tippmann (Betriebsleiter), Claude (Berater)
**Kontext:** Fortsetzung derselben Session auf dem iPad (vorheriger Teil siehe Protokoll_RennsteigFINANZ_2026-07-13_Domain-Analyse.md), nach Unterbrechung wegen Fingerermüdung beim Tippen auf dem iPhone.

---

## Finanzplanungs-Tool (Vertiefung)

- **Eigenentwicklung** auf Basis von Visual Basic und Excel, von Herrn Tippmann selbst geschrieben und laufend gepflegt/erweitert. Kein professioneller Programmierhintergrund — daher an manchen Stellen technisch nicht optimal gelöst, punktuell fehleranfällig, funktioniert aber im Kern zuverlässig.
- **Motivation:** Kein anderes Verwaltungssystem (auch nicht VEMA) kann Haushalte abbilden, Verträge querverbinden oder eine vollständige Einkommens-/Vertragsübersicht liefern. Diese Lücke schließt das Tool.
- **Zentrales Datenmodell-Konzept — Haushalt als aggregierende Entität:** Verträge unterschiedlicher Sparten (z. B. Risikolebensversicherung, Immobilienfinanzierung, Wohngebäudeversicherung) werden im Haushaltskontext miteinander verknüpft und lassen sich bei Bedarf (Trennung, Auszug, Wechsel des Vertragsinhabers) wieder auflösen und neu ordnen.
- **Schnittstelle zur eigenen Ablage:** konzeptionell vorbereitet, technisch noch nicht umgesetzt.
- **Datenimport:** grundsätzlich über extern exportierte Tabellen möglich.
- **AMS-Altdaten** (aus dem früheren Verwaltungsprogramm, intern scherzhaft „Anti-Makler-System" genannt): vollständig importiert, abgeschlossen.
- **VEMA-Import:** noch offen, technische Anpassung erforderlich.
- **Nutzung:** durch Herrn Tippmann selbst, im Rahmen der Kundenberatung als zentrale Gesprächsgrundlage.

## Bestandslisten der Gesellschaften

- Excel-Listen verschiedener Versicherer, die mit dem eigenen Bestand abgeglichen werden müssen (Soll-Ist-Abgleich: was ist bereits übernommen, was wurde abgerechnet, was fehlt noch).
- Struktur je Gesellschaft unterschiedlich, aber fachlich nicht kompliziert.
- Abgleich erfolgt aktuell **vollständig manuell**, sehr aufwändig.
- Abweichungen stehen in direktem Zusammenhang mit **Provisionsabrechnungen**, die dadurch unvollständig oder fehlerhaft sein können — finanzielle Relevanz.
- **Nutzen-Kandidat:** strukturierter, automatisierbarer Abgleich über Vertragsnummer als gemeinsamen Schlüssel.

## Kundenberatung (vollständiges Prozessbild)

**Grundphilosophie:** Beratung erfolgt bewusst analog, persönlich, "Auge in Auge" — Video-Beratung wird als vertrauensschwach und "wie Fernsehunterhaltung mit künstlichen Spannungspunkten" abgelehnt. Regelmäßigkeit und punktuelle fachliche Tiefe sind die Leitprinzipien. Digitalisierung soll das persönliche Gespräch unterstützen, nicht ersetzen.

**Struktur:**
1. **Jahresgespräch** als Basis-Rhythmus, ausgehend von der Finanzplanungsübersicht als Resümee-Grundlage.
2. **Vertiefende Beratungen** bei Bedarf zu konkreten Lebensereignissen (Ausbildung/neue Tätigkeit, Immobilienerwerb, Altersvorsorge, Krankenversicherungs-Optimierung u. a.) — fachlich komplex genug, dass mehrere Gespräche nötig sind.

**Auslösemechanismus (doppelt):**
- Terminlich-prognostisch über einen Kalender (Regelmäßigkeit).
- Anlassbezogen — z. B. Geburtstag oder Ereignis wird genutzt, um an das fällige Jahresgespräch zu erinnern (persönlicher Charakter der Ansprache).

**Drei-Phasen-Modell jeder Beratung (Jahresgespräch, Anlass-Beratung, operative Beratung):**
- **Vorbereitung:** Vertragsübersicht erstellen, Aktualität der Vertragsdaten prüfen, Vollständigkeit der Vertragsdaten prüfen, Vollständigkeit/Richtigkeit der persönlichen Angaben prüfen, thematisch-inhaltliche Vorbereitung.
- **Durchführung:** fachliche Expertise anhand der Finanzübersicht einbringen. **Zukunftsidee:** Tool, das das Gespräch still mitschneidet/protokolliert, damit nichts verloren geht.
- **Nachbereitung:** Anträge aufnehmen, Verträge ändern/kündigen, Vorbereitung für Folgeschritte, Kampagnenplanung, Informationen für spätere Weiterleitung vorhalten.

**Wöchentliche Arbeitsbesprechung:** fester Rhythmus, alle Kollegen einbezogen, alle Gespräche der Woche werden gemeinsam besprochen, beraten, ausgewertet. Aktuell Dokumentation freihand in Collegeblocks. **Nutzen-Kandidat:** Tool zur automatisierten Zusammenfassung als Handout für Teilnehmer und Arbeitsgrundlage für nächste Schritte.

## Rollen-Definition

**Herr Tippmann:**
- Generalist für alle Finanzprodukte in Haushalt oder Firma (Master of Financial Consulting).
- Methodischer Ansatz: Haushalt vollständig und in Gesamtheit betrachten — alle Personen, alle Verträge, deren Wechselwirkungen, die daraus resultierende Bedarfsabsicherung.
- **Bedarfsermittlung als zentraler Dreh- und Angelpunkt:** kein Bedarf, kein Produkt. Bedarf ist dem Produkt fachlich vorgelagert.
- Zugleich Spezialist in eigener Person für Bausparen und Finanzieren, mit Kernkompetenzen in Versichern und Anlagen — könnte das gesamte Spektrum notfalls allein abdecken, sucht aber bewusst Spezialisten-Unterstützung.

**Team (3 Kollegen als Spezialisten):**
- Kfz-Versicherung
- Gewerbliche Risiken
- Krankenversicherung
- Biometrische Risiken (Altersvorsorge, Berufsunfähigkeit, Kindervorsorge)

**Investment-Spezialist (1 Kollege):**
- Gesamtes Feld Kapitalanlagen: Fondssparen, versicherungsgebundene Investments, Depotkritiken.
- Vermögensweitergabe (Erben/Schenken) über Versicherungsmantellösungen.
- **Expliziter KI-Unterstützungsbedarf:** Depotführung, Kontrolle, Auswertung.

**Assistenz:**
- Feste Person/Funktion im Unternehmen.
- Vor-/Nachbereitung aller Unterlagen und Dokumente, federführend.
- **Expliziter KI-Unterstützungsbedarf** von Herrn Tippmann benannt.

**Administrator (IT):**
- Feste Rolle, zuständig für EDV/IT-Infrastruktur.
- **Expliziter KI-Unterstützungsbedarf** von Herrn Tippmann benannt.

**Zugriffsphilosophie:** Kernteam versteht sich als ein Team ohne Geheimniskrämerei — grundsätzlich offener Zugriff, keine internen Beschränkungen zwischen den Fachrollen. Einschränkungen gelten ausschließlich für Personen mit befristeter/geringfügiger Einbindung (Praktikanten, geringfügig Beschäftigte) — kein Zugriff auf Kerndaten.

## Investment-Thema (vertieft)

**Mehrschichtige Struktur:**
1. Trägerebene — verschiedene Plattformen/Pools, je eigener Beratungs-/Verarbeitungsprozess.
2. Produktebene — reine Fondsdepots, fondsgebundene Versicherungen mit Überschusssystemen, Versicherungsmantel-Lösungen für Erben/Schenken.
3. Zielebene — wichtige fachliche Trennung, die oft fälschlich vermischt wird:
   - **Vermögensaufbau:** freies Ziel, keine biometrische Komponente zwingend.
   - **Altersvorsorge:** biometrische Risiken sind konstitutiv (z. B. Beitragsfreistellung bei Berufsunfähigkeit, damit das Sparziel trotz Leistungsfall erreicht wird).

**Vision:** Prozesse der verschiedenen Plattformen auf einer Ebene abbilden, um kundenoptimale Entscheidungen treffen zu können — eine Entscheidungsschicht oberhalb der Anbieter-Silos, strukturell verwandt mit dem Bestandslisten-Abgleich, aber auf beraterischer statt administrativer Ebene.

**Regulatorischer Fakt (per Websuche bestätigt, Stand 13.07.2026):** Das Altersvorsorgedepot als Riester-Nachfolger ist beschlossenes Recht — Bundestag-Beschluss 27.03.2026, Bundesrat-Zustimmung 08.05.2026, Inkrafttreten zum 01.01.2027. Bis zu 540 € Grundzulage/Jahr plus bis zu 300 € Kinderzulage/Kind, erstmals Förderberechtigung für Selbstständige/Freiberufler, Anlage in ETFs/Fonds/Anleihen (keine Einzelaktien/Krypto), gesetzlicher Kostendeckel von 1 % Effektivkosten/Jahr beim Standardprodukt. Bestehende Riester-Verträge laufen mit Bestandsschutz weiter. **Zeitfenster für Vorbereitung: gut ein halbes Jahr bis zur praktischen Relevanz bei Kunden.**

## Protokollierungspflicht (Wirtschaftsprüfer / Haftungsrisiko)

- Für jede Beratung muss ein Protokoll erstellt werden, das gegenüber dem Wirtschaftsprüfer plausibel macht, dass der Kunde zwischen Beratung und Handeln/Entscheidung die gesetzlich vorgeschriebene Überlegungszeit hatte (Bezug: Beratungsprotokoll-Pflicht, vgl. § 61 VVG, bereits zu Beginn der Domain-Analyse allgemein benannt).
- Ablauf: abgelegte Dokumente durchsehen, relevante Eckdaten ins Protokoll übertragen, Überlegungszeit-Einhaltung plausibilisieren.
- **Bewertung von Herrn Tippmann:** aufwändig und mit Haftungsrisiko behaftet — eigenständiger, dringend zu organisierender Bereich.
- **Ist-Zustand:** Protokollierung erfolgt stets im Anschluss an die Beratung, ist "systemisch integriert" — Kunden können ihr protokolliertes Handeln per Papier oder elektronischer Signatur bestätigen. Ablage strukturiert pro Kunde, pro Produkt, im jeweiligen Kundenordner.
- **Möglicher Bezug zur Aufzeichnungsidee aus der Kundenberatung:** Eine Gesprächsaufzeichnung/-transkription könnte Eckdaten und Überlegungszeit-Nachweis vermutlich zuverlässiger liefern als die heutige Kombination aus Notizen und Dokumentendurchsicht.

## IT-Abteilung / EDV

**Zuständigkeiten:**
- Pflege des eigenen Systems und der Peripherie, Netzwerkverbindungen, Zugriffsregelungen.
- **IT-Flexibilität/Redundanz:** Bei Ausfall eines Wegs (Beispiel aus dieser Session: Mac offline, VS Code nicht nutzbar) muss über andere Partner/Tools (Claude, GitHub, ChatGPT) dennoch 100 % Arbeitsfähigkeit erreichbar sein.
- Sicherheitskopien/Backups als Standardpraxis.

**Kernanforderung — portable Arbeitsumgebung:** Nicht das komplette Betriebssystem, sondern die Arbeitsumgebung (Projektdateien, Konfiguration, Zugänge) soll sauber konfiguriert, stabil, gesichert und auf beliebige andere Rechner portierbar sein — Rechnerwechsel "ohne großen Schnickschnack".

**Ist-Zustand / Schmerzpunkt:**
- Arbeit erfolgt auf Windows-Basis; als instabil erlebt — Updates verändern laut Herrn Tippmann "ständig" Berechtigungen und verursachen Schäden. Kein Einzelfall, sondern wiederkehrendes strukturelles Problem.
- Es gibt eine feste Rolle **Administrator**, die ebenfalls wesentliche KI-Unterstützung erhalten soll.

---

## Gesamtstand der Domain-Analyse (Ende dieser Session)

**Abgedeckte Themen:** Datenlandschaft (VEMA Office/Pool, Outlook, eigene Ablage, Abrechnungs-Excel), Finanzplanungs-Tool inkl. Haushaltskonzept, Bestandslisten-Abgleich, vollständiger Kundenberatungsprozess, Rollen-Definition (Generalist, Fachspezialisten, Investment-Spezialist, Assistenz, Administrator), Investment-Thema inkl. Altersvorsorgedepot-Reform, Protokollierungspflicht/Haftungsrisiko, IT-Abteilung/EDV.

**Identifizierte Nutzen-Kandidaten für RennsteigFINANZ (bisher gesammelt):**
1. Ertragsauswertung pro Kunde aus vorhandenen CSV-Positionsdaten der Abrechnung.
2. Automatisierter/strukturierter Bestandslisten-Abgleich (Soll-Ist, Vertragsnummer als Schlüssel).
3. Assistenz-Rolle: aktive KI-Unterstützung bei Vor-/Nachbereitung.
4. Automatisierte Zusammenfassung der wöchentlichen Arbeitsbesprechung (Handout, Arbeitsgrundlage).
5. Investment-Spezialist: KI-Unterstützung bei Depotführung, Kontrolle, Auswertung; plattformübergreifende Entscheidungsschicht für Investment/Altersvorsorge.
6. Beratungsgespräch-Mitschnitt/-Protokollierung als Assistenzfunktion — potenziell auch nutzbar für den Überlegungszeit-Nachweis gegenüber dem Wirtschaftsprüfer.
7. Administrator-Rolle: KI-Unterstützung für portable, stabile Arbeitsumgebung.

**Noch nicht behandelt:** Schadensbearbeitung, Datenschutz/DSGVO, Akquise/Marketing — als mögliche Themen für Folgesitzungen benannt, aber nicht vertieft.

## Nächste Schritte

1. Weitere Domain-Themen bei Bedarf vertiefen (Schadensbearbeitung, DSGVO, Akquise/Marketing) oder direkt zu Kern-Use-Cases übergehen.
2. Aus den sechs Rollen und den Nutzen-Kandidaten erste konkrete Use-Cases ableiten.
3. Diese beiden Protokolle (Teil 1 und Teil 2 der heutigen Session) ins Repository übertragen (STATUS.md aktualisieren, /logs ablegen), sobald Mac/VS Code wieder verfügbar sind, damit Claude Code auf demselben Stand ist.
