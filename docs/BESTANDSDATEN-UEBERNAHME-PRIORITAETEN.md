# Bestandsdaten-Uebernahme: Prioritaeten

## Ziel

Wegen akutem Speicherengpass wird die Uebernahme aus AMS nicht als Vollkopie, sondern stufenweise durchgefuehrt.

Grundsatz:

- erst kleine, fachlich zentrale Dateien
- dann Zuordnungs- und Uebergabedateien
- grosse Gesamtdateien nur bei ausreichend freiem Speicher

## Aktueller Stand

Bereits in die Projektwelt uebernommen nach data/bestandsdaten/aktuell:

- Agenturdaten RennsteigFinanz.xlsx
- Agenturdaten BeraterHaus.xlsx
- AMS Vermittler.xls
- AMSVerträge.xls
- Kunden Beraterhaus.xls
- Kunden Tippmann.xls
- AMSWVL.xls
- AMSVorgaenge.xls

## Prioritaet P0 (bereits uebernommen)

Fachlicher Zweck:

- Agenturnummern und Partnerzuordnung
- Vermittler- und Kundenzuordnung
- Vorgaenge und Wiedervorlagen (WVL)

Speicherbedarf:

- ca. 28 MB

## Prioritaet P1 (naechster Schritt)

Dateitypen:

- relevante Vertraege je Kernvermittler
- zentrale AMS-Vertragsdateien mit direktem Abgleichsbezug
- Dateien aus AMS/zum Import, die aktiv fuer Bestandsuebertragungen genutzt werden

Empfohlene Kandidaten (Beispiele):

- AMS Vertraege VM Tippmann.xls
- Vertraege Tippmann.xls
- AMS Vertraege VM Schumacher.xls
- AMS Vertraege VM Hildebrandt.xls
- AMS Vertraege VM Furch.xls

Hinweis:

- Bei gleichnamigen, aber inhaltlich verschiedenen Dateien immer beide Varianten behalten und als Konfliktversionen markieren.

## Prioritaet P2 (grosses Paket, nur bei mehr freiem Speicher)

Dateien:

- Gesamtbestand Kunden RF.xlsx
- Gesamtbestand Vertraege RF.xlsx
- VM Gesamtbestand Kunden RF.xlsx
- VM Gesamtbestand Vertraege RF.xlsx

Begruendung:

- Diese Dateien sind fachlich sehr wertvoll fuer den Gesamtblick, aber gross.
- Sie sollen erst uebernommen werden, wenn die freie Kapazitaet stabil ist.

## Konfliktregel

Konfliktdateien werden nicht ueberschrieben.

Ablageorte im Quellbestand:

- AMS/Bestand/KONFLIKT_TOPLEVEL
- AMS/zum Import/KONFLIKT_TOPLEVEL

Regel:

- erst inhaltlich vergleichen
- dann als Quelle A/Quelle B kennzeichnen
- danach in das Projekt uebernehmen

## Empfehlung fuer die naechste Session

1. P1 als kleines Paket selektiv uebernehmen
2. Nur danach freien Speicher neu pruefen
3. P2 erst bei entspanntem Speicherstand kopieren
