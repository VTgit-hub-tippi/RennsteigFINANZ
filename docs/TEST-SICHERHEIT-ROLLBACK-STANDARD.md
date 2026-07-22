# TEST-SICHERHEIT-ROLLBACK-STANDARD

Statusdatum: 2026-07-22
Gueltigkeit: verbindlich fuer alle Tests auf Mac, Windows und Untitled

## 1. Grundsatz

Jeder Testlauf muss voll reversibel sein.

Ziel: Wenn ein Test fehlschlaegt, kann der Zustand 1:1 auf den Stand vor dem Test zurueckgestellt werden.

## 2. Pflicht vor jedem Test

1. Nur isolierte Testkopien nutzen, nie direkt in Produktivpfaden arbeiten.
2. Vor dem ersten Eingriff PreFix-Kopie erstellen (gleiches Verzeichnis).
3. Test-Startzustand protokollieren:
- Datum/Uhrzeit
- Systemrolle (Mac, Windows, Untitled)
- Dateipfade
- geplanter Eingriff
4. Backup-Ziel verifizieren.
5. Abbruchkriterium vorher festlegen (wann wird sofort zurueckgerollt).

## 3. Pflicht waehrend des Tests

1. Nur den freigegebenen Scope bearbeiten.
2. Nach jedem Eingriff kurz testen und dokumentieren.
3. Bei unerwartetem Verhalten sofort stoppen, nicht "weiterprobieren".

## 4. 1:1 Rollback-Verfahren

1. Lauf stoppen.
2. Geaenderte Testdatei verwerfen.
3. PreFix-Kopie auf den Testdateinamen zuruecksetzen.
4. Test erneut nur mit klarer Ursache starten.

Beispiel (Dateiebene):
- `Finanzen_TEST.xls` loeschen/ersetzen
- `Finanzen_TEST_preFix.xls` nach `Finanzen_TEST.xls` zurueckkopieren

## 5. Abbruchkriterien (sofortiger Rollback)

1. Ungeplante Aenderungen ausserhalb der Testkopie.
2. Unklare Datenzusammenfuehrung ohne explizite Freigabe.
3. Fehlerbild nicht mehr reproduzierbar und Zustand unklar.
4. Verdacht auf Einfluss auf Produktivpfade.

## 6. Nach dem Rollback

1. Vorfall mit Ursache und Zeitpunkt dokumentieren.
2. Rest-Risiko als OFFEN markieren.
3. Erst nach klarer Freigabe neuen Testlauf starten.

## 7. Nachweispflicht

Jeder Testlauf muss einen Nachweis enthalten:
1. PreFix vorhanden: Ja/Nein
2. Rollback moeglich bestaetigt: Ja/Nein
3. Rollback ausgefuehrt (falls noetig): Ja/Nein
4. Ergebnis: PASS/FAIL mit Begruendung