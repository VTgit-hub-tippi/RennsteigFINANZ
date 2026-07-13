# NEXT-ACTION — Single Source of Next Work

Statusdatum: 2026-07-09

## AKTUELLE-AKTION (P0)
Fuehre als erste Arbeitsphase den Dokumenteneingang und die Inhaltspruefung fuer das Fachmodell durch:
1. Eingangspaket einsammeln (Service-Gebuehren, Maklervertraege, Maklervollmachten, inhaltliche Erklaerungen).
2. Dokumente nach Themen clustern: Verguetung, Vertretungsvollmacht, Beratungsprozess, Compliance.
3. Offene Punkte je Dokument als `OFFEN` markieren (keine Annahmen).
4. Auswirkungen auf Rollen, Rechte und Datenmodell herausarbeiten.
5. Ergebnisse in den relevanten Dateien fortschreiben (mindestens `STATUS.md` und bei Bedarf neue Fachnotizen in `docs/`).

Zusatzpflicht (ab sofort):
6. Bei jedem Session-Start `bash tools/it-watch.sh` ausfuehren.
7. Bei `CRITICAL` oder `WARNING` den PLAN aus recovery/it-watch-latest.txt priorisiert umsetzen.

## Definition of Done
- Eingangspaket liegt vollstaendig oder mit klarer OFFEN-Liste vor.
- Pro Dokument ist der fachliche Zweck und die Systemwirkung notiert.
- Rollen-/Rechte- und Compliance-Auswirkungen sind als Arbeitsstand festgehalten.
- IT-Watch-Report liegt aktuell in `recovery/it-watch-latest.txt` vor.
- `STATUS.md` ist um die Session und den neuen naechsten Schritt aktualisiert.

## Fallback-Regel
Wenn notwendige Fachdetails fehlen, mit konservativen Platzhaltern arbeiten und als `OFFEN` markieren; keine Blockade durch fehlende Perfektion.

## Danach (P1)
1. Compliance-Anforderungen pro Saeule vertiefen und konkretisieren.
2. Rollen- und Zugriffsrechte v0.1 aus den Dokumenten ableiten.
3. Datenmodell v0.1 auf dieser Basis strukturieren.
