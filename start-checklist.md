<!-- markdownlint-disable MD032 -->

# Start-Checkliste

## Autopilot-Wiedereinstieg (ohne Rueckfrage)

0. Zuerst [NEXT-ACTION.md](NEXT-ACTION.md) lesen und die dort markierte `AKTUELLE-AKTION` ausfuehren.
1. Danach [STATUS.md](STATUS.md) lesen, um Blocker, Prioritaet und Session-Kontext zu bestaetigen.
2. Git-Zustand mit `git status --short --branch` pruefen (nur Kontext, keine Reverts).
3. Wenn `AKTUELLE-AKTION` eindeutig ist: direkt umsetzen, testen, im Anschluss [STATUS.md](STATUS.md) und [NEXT-ACTION.md](NEXT-ACTION.md) fortschreiben.
4. Nur wenn `AKTUELLE-AKTION` fehlt/mehrdeutig/blockiert ist: genau eine fokussierte Rueckfrage stellen.
5. IT-Watch verpflichtend ausfuehren: `bash tools/it-watch.sh`.
6. Bei `CRITICAL`/`WARNING` zuerst den PLAN aus `recovery/it-watch-latest.txt` priorisiert bearbeiten.
7. Anti-Amnesie-Guard ausfuehren: `bash tools/anti-amnesie-guard.sh`.
8. Dreisystem-Check ausfuehren: `docs/DREISYSTEM-BETRIEBSMODELL.md` lesen und Rolle der aktuellen Session festhalten (Mac, Windows oder Untitled-Recovery).
9. Bei Untitled-Recovery den passenden Portable-Starter nutzen: `tools/portable/start-untitled.command` (Mac) oder `tools/portable/START-UNTITLED.cmd` (Windows).

Ziel: kein Leerlauf beim Wiedereinstieg, sondern sofortige, reproduzierbare Weiterarbeit.

## Entscheidraster je Thema (verbindlich)

Bei neuen Themen oder Konflikten immer dieses 4-Punkte-Raster anwenden:
1. Zielbild
2. Minimal machbarer Schritt diese Woche
3. Risiko/Trade-off
4. Nachweis, dass der Schritt funktioniert hat

Vorlage:
- [docs/ENTSCHEIDRASTER-VORLAGE.md](docs/ENTSCHEIDRASTER-VORLAGE.md)

## Lehren verankern (Pflicht)

1. Am Session-Ende mindestens 3 konkrete Lehren aus Fehlern, Umwegen oder Erfolgsfaktoren notieren.
2. Jede Lehre mit genau einer operativen Verankerung verbinden (Checkliste, Skript, Vorlage oder Regel).
3. Lehren und Verankerung im Session-Protokoll sowie in [STATUS.md](STATUS.md) sichtbar machen.
4. Ohne Verankerung gilt eine Lehre als nicht abgeschlossen.

Zentralmodus (geraeteunabhaengig):
1. Copilot bleibt der operative Dreh- und Angelpunkt, unabhaengig vom verwendeten Rechner.
2. Bei Fortsetzungs-Formulierungen (weiter, nahtlos, fortsetzen) exakt an der laufenden P0-Aktion anschliessen.
3. Kein Themenwechsel ohne explizite Umpriorisierung durch den Nutzer.

## Toolwechsel VS Code <-> Claude.ai (verbindlich)

Grundsatz: Es gibt kein garantiert geteiltes Session-Gedaechtnis zwischen Tools.
Wahrheit kommt aus Dateien, nicht aus Chat-Verlauf.

Pflichtquellen vor jeder Weiterarbeit:
1. [STATUS.md](STATUS.md)
2. [NEXT-ACTION.md](NEXT-ACTION.md)
3. [docs/context-snapshot.md](docs/context-snapshot.md)
4. Aktueller Git-Status (`git status -sb`)

Wenn ein Wechsel ansteht:
1. In der aktiven Session zuerst [STATUS.md](STATUS.md), [NEXT-ACTION.md](NEXT-ACTION.md) und [docs/context-snapshot.md](docs/context-snapshot.md) aktualisieren.
2. In der neuen Session diese drei Dateien als Pflichtkontext einlesen lassen.
3. Erst danach Umsetzung starten.

Fallback bei Unklarheit:
- [docs/KONTEXT-UEBERGABE.txt](docs/KONTEXT-UEBERGABE.txt) anwenden.

Schnellzugriff fuer externen Einstieg:
- Universelles Runbook: [docs/CROSS-ENTRY-RUNBOOK.txt](docs/CROSS-ENTRY-RUNBOOK.txt)
- Claude.ai Startprompt: [docs/STARTPROMPT-CLAUDE-AI.txt](docs/STARTPROMPT-CLAUDE-AI.txt)
- ChatGPT Startprompt: [docs/STARTPROMPT-CHATGPT.txt](docs/STARTPROMPT-CHATGPT.txt)
- Universal-Kurzprompt: [docs/STARTPROMPT-UNIVERSAL-3ZEILEN.txt](docs/STARTPROMPT-UNIVERSAL-3ZEILEN.txt)

Automatischer Funktionsnachweis (ohne manuelle Haken):
- `bash tools/handoff-proof.sh`
- Wirkung: aktualisiert `docs/context-snapshot.md` und prueft alle Einstiegspunkte mit PASS/FAIL.

1. Claude Code starten.
2. Falls lokale Skills nicht sofort sichtbar sind, Claude neu starten oder `/reload-plugins` ausführen.
3. Einen einfachen Testprompt senden, zum Beispiel:
   - "Fasse dieses Projekt in 6 Bulletpoints zusammen."
   - "Prüfe diesen Codeabschnitt mit dem lokalen Review-Skill."
4. Kontextbudget beobachten: bei ca. 60-70% immer geplanter Neustart mit Pflichtfolge
   - zuerst `/context-snapshot`
   - dann Neustart
   - danach `/context-restore`
5. Nutzungsseite parallel offen halten und Verbrauch regelmaessig pruefen:
   - `https://claude.ai/new#settings/usage`
6. Modell bewusst waehlen (`/model`):
   - mindestens Sonnet
   - fuer komplexes Coding bevorzugt Opus
7. Prompt immer mit klarem Ziel und Scope starten; bei Datei-Checks betroffene Datei(en) explizit nennen.
8. Rueckfragen aktiv einfordern; Arbeitsfolge sichtbar halten: Anforderungen -> Spezifikation -> Plan -> Umsetzung -> Tests.
9. Bei groesseren Coding-Aufgaben Sub-Agents gezielt fuer Parallelisierung und Token-Effizienz nutzen.
10. Bei Bedarf die Eval-Dateien in [evals/README.md](evals/README.md) verwenden.

<!-- markdownlint-enable MD032 -->
