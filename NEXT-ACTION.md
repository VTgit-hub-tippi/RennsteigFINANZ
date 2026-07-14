<!-- markdownlint-disable MD007 MD009 MD022 MD029 MD032 MD060 -->

# NEXT-ACTION — Single Source of Next Work

Statusdatum: 2026-07-09

## AKTUELLE-AKTION (P0)
Fuehre als naechste Arbeitsphase die konkrete Use-Case-Ableitung aus dem bereits geklaerten Domain-Stand durch:
Leitlinie: Das Finanzplanungs-Tool ist die fuehrende Arbeitsoberflaeche; VEMA- und AMS-Bestaende sind zentrale Datenquellen fuer Abgleich und Zuordnung. Die Dateien unter /Users/volkertippmann/Cloudstation/Documents/Finanzplanung/Programm/Module/Tabellen und /Users/volkertippmann/Cloudstation/Documents/Finanzplanung/Programm/Module/AMS sind dynamische Arbeitsdaten und als wichtige aktuelle Quellen zu behandeln.
1. Die gestern erarbeiteten Grundlagen priorisieren: Finanzplanungs-Tool, Bestandslisten-Abgleich, Kundenberatung, Rollenbild.
2. Daraus 3 bis 5 belastbare Kern-Use-Cases formulieren.
3. Pro Use-Case Ziel, Ausloeser, Datenquellen, beteiligte Rollen und Ergebnis festhalten.
4. OFFEN-Punkte klar markieren, ohne den Entwurf zu blockieren.
5. Ergebnisse in `STATUS.md` und bei Bedarf in neuen Fachnotizen in `docs/` festhalten.

Zusatzpflicht (ab sofort):
6. Bei jedem Session-Start `bash tools/it-watch.sh` ausfuehren.
7. Bei `CRITICAL` oder `WARNING` den PLAN aus recovery/it-watch-latest.txt priorisiert umsetzen.

## Definition of Done
- 3 bis 5 belastbare Kern-Use-Cases liegen beschrieben vor.
- Pro Use-Case sind Ziel, Ausloeser, Datenquellen, beteiligte Rollen und Ergebnis notiert.
- OFFEN-Punkte sind sichtbar markiert, ohne den Entwurf zu blockieren.
- IT-Watch-Report liegt aktuell in `recovery/it-watch-latest.txt` vor.
- `STATUS.md` ist um die Session und den neuen naechsten Schritt aktualisiert.

## Fallback-Regel
Wenn notwendige Fachdetails fehlen, mit konservativen Platzhaltern arbeiten und als `OFFEN` markieren; keine Blockade durch fehlende Perfektion.

## Danach (P1)
1. Compliance-Anforderungen pro Saeule vertiefen und konkretisieren.
2. Rollen- und Zugriffsrechte v0.1 aus den Use-Cases ableiten.
3. Datenmodell v0.1 auf dieser Basis strukturieren.

<!-- markdownlint-enable MD007 MD009 MD022 MD029 MD032 MD060 -->
