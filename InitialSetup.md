# InitialSetup — Geführtes Claude-Code-Setup

> **An die ausführende Claude-Instanz:** Dies ist ein Runbook, das DU Schritt für
> Schritt abarbeitest. Du führst die Arbeit selbst aus (CLI-Befehle, Dateien
> schreiben) und bindest den User nur ein, wenn du eine Entscheidung/Information
> brauchst oder ein Schritt manuell durch ihn erfolgen muss. Manuelle Schritte
> erklärst du dem User **einfach und Schritt für Schritt**.

## Grundregeln für die Ausführung

1. **Sprache:** Sprich mit dem User in seiner Sprache (Default: Deutsch),
   freundlich und klar — kein Fachjargon ohne Erklärung.
2. **Freigaben:** Führe **keine verändernde Aktion** ohne Zustimmung des Users aus
   (Installationen, Datei-Schreiben außerhalb dieses Setups, Git/GitHub, Löschen).
3. **Idempotenz:** Prüfe vor jeder Aktion, ob sie schon erledigt ist, und
   überspringe Erledigtes mit kurzem Hinweis.
4. **Plattform:** Erkenne das OS und verwende passende Syntax/Pfade:
   - Windows → PowerShell, Pfade wie `~\.claude\commands\`
   - macOS → POSIX-Shell, Pfade wie `~/.claude/commands/`
5. **Abbruch:** Der User kann jederzeit abbrechen; bestätige dann den aktuellen
   Stand und überspringe die Selbstlöschung.
6. **Reihenfolge:** Arbeite die Phasen 1–8 der Reihe nach ab.

---

## Phase 1 — Begrüßung & Überblick

1. Begrüße den User kurz und erkläre, was dieses Setup tut: Claude Code mit einem
   Framework für strukturiertes, professionelles Coding ausstatten.
2. Nenne die Phasen in einem Satz je Phase (Umgebungs-Check, Claude-Update,
   Plugins, Context-Tools, Git/GitHub, Kommunikations-Präferenzen, Abschluss).
3. Weise darauf hin: nichts wird ohne Freigabe geändert, Abbruch jederzeit möglich,
   Dauer typischerweise wenige Minuten.
4. Frage: „Möchtest du starten?“ und warte auf Bestätigung, bevor du zu Phase 2 gehst.

---

## Phase 2 — Umgebungs-Check

Führe diese **read-only** Prüfungen selbst aus und berichte das Ergebnis kompakt:

1. **OS bestimmen.**
   - Windows: `$PSVersionTable.OS` (PowerShell) bzw. erkenne an der Shell.
   - macOS/Linux: `uname -s`.
2. **Claude-Version:** `claude --version`.
3. **Werkzeuge vorhanden?**
   - Windows: `Get-Command git`, `Get-Command node`, `Get-Command gh` (je in try/catch).
   - macOS: `command -v git`, `command -v node`, `command -v gh`.
4. **Bereits installierte Plugins:** `claude plugin list`.
5. **Vorhandene Context-Commands:** prüfe, ob `context-snapshot`/`context-restore`
   bereits im Command-Verzeichnis liegen (global und projektlokal).

Fasse zusammen, was vorhanden ist und was fehlt. Das ist die Grundlage für die
Idempotenz in den folgenden Phasen. Keine Änderungen in dieser Phase.

---

## Phase 3 — Claude-Update

1. Prüfe die installierte Version (aus Phase 2) und führe `claude update` aus, um
   auf Updates zu prüfen/zu aktualisieren.
2. Wenn `claude update` meldet, dass bereits aktuell → kurz bestätigen, weiter.
3. Falls das Update über den integrierten Updater fehlschlägt, erkläre dem User den
   plattformpassenden manuellen Weg **Schritt für Schritt**:
   - Windows: erneut `claude update` in einer normalen PowerShell; falls per npm
     installiert: `npm install -g @anthropic-ai/claude-code`.
   - macOS: `claude update`; falls per npm installiert:
     `npm install -g @anthropic-ai/claude-code`; falls per Installer-Skript: den
     offiziellen Installationsbefehl erneut ausführen.
4. Hinweis an den User: Für eine neue Version kann ein Neustart von Claude Code
   nötig sein. Frage, ob fortgefahren werden soll.

---

## Phase 4 — Plugins (dynamische Recherche & Installation)

Ziel: Claude Code mit Plugins/Skills für strukturiertes, professionelles Coding
ausstatten.

1. **Scope klären (einmal, gilt auch für Phase 5 und 7):** Frage den User, ob global
   (alle Projekte, `--scope user`) oder nur für dieses Projekt (`--scope project`)
   installiert werden soll. Merke dir die Antwort.
2. **Recherche zur Laufzeit:** Recherchiere per WebSearch die aktuell besten/
   aktuellsten Claude-Code-Plugins/Marketplaces für strukturiertes, professionelles
   Coding. Verankere die Suche an bekannten, bewährten Optionen und prüfe, ob es
   inzwischen bessere/aktuellere Alternativen gibt:
   - `superpowers` (Workflow-/Engineering-Disziplin: Brainstorming, Plans, TDD,
     Debugging, Reviews)
   - `andrej-karpathy-skills` (Coding-Guidelines gegen typische LLM-Fehler)
   Falls keine Internetverbindung besteht: weise darauf hin und biete die beiden
   bekannten Optionen oben als Fallback an.
3. **Vorschlag präsentieren:** Liste 3–6 Kandidaten mit je einem Satz Nutzen und
   deiner Empfehlung. Lass den User auswählen (Mehrfachauswahl).
4. **Installation selbst durchführen** (pro gewähltem Plugin):
   - Marketplace hinzufügen (falls nötig): `claude plugin marketplace add <github-repo>`
   - Installieren: `claude plugin install <plugin@marketplace> --scope <user|project>`
   - Bereits installierte (aus Phase 2) überspringen; auf Wunsch
     `claude plugin update <plugin>`.
5. **Ergebnis prüfen:** `claude plugin list` und dem User bestätigen, was neu da ist.
   Hinweis: Für manche Plugins greift die Aktivierung erst nach Neustart von Claude Code.

---

## Phase 5 — Context-Tools installieren

Installiere zwei Slash-Commands, die einen Kontext-Reset überstehen.

1. **Zielordner bestimmen** (nach Scope aus Phase 4):
   - global: Windows `~\.claude\commands\`, macOS `~/.claude/commands/`
   - projektlokal: `.claude/commands/` im Projekt
   Lege den Ordner an, falls er nicht existiert.
2. **`context-snapshot.md` schreiben** mit exakt folgendem Inhalt:

````markdown
# /context-snapshot

Du bist ein Coding-Assistent kurz vor einem Kontext-Reset.

Deine Aufgabe ist es, eine **verlustarme Projekt-Zustandszusammenfassung** zu erstellen, die eine nahtlose Weiterarbeit in einem neuen Kontext ermöglicht.

---

## OUTPUT-REGEL (WICHTIG)

Gib die Antwort auf **zwei Arten aus**:

### 1. Chat-Ausgabe
- Schreibe die vollständige Zusammenfassung direkt in den Chat
- Format: strukturiertes Markdown

### 2. Datei-Ausgabe
- Schreibe exakt dieselbe Zusammenfassung in diese Datei: `docs/context-snapshot.md` (projekt-relativ)
- Lege den Ordner `docs/` an, falls er nicht existiert
- Falls die Datei existiert: **komplett überschreiben**
- Falls nicht: **neu erstellen**

---

## INHALT DER ZUSAMMENFASSUNG

### 1. Projektüberblick
- Worum geht das Projekt?
- Aktueller Status in 2–4 Sätzen

### 2. Aktueller Stand
- Fertige Features / Module
- Aktuell laufende Arbeit

### 3. Nächste Schritte (priorisiert)
- Konkrete TODOs
- Klar priorisiert (P0 / P1 / P2)

### 4. Technischer Kontext
- Stack / Frameworks
- Architekturentscheidungen
- Wichtige Patterns / Constraints

### 5. Zentrale Dateien / Module
- Liste der wichtigsten Dateien
- Jeweils 1 Satz Beschreibung

### 6. Offene Probleme / Bugs
- Fehler, technische Schulden, bekannte Issues

### 7. Wichtige Entscheidungen
- Architektur- oder Designentscheidungen, die beibehalten werden müssen
- Implizite Annahmen im System

### 8. Schnittstellen / APIs (falls vorhanden)
- Endpoints, Types, CLI-Kommandos, Contracts

### 9. Git-Zustand
- Aktueller Branch (`git branch --show-current`)
- Uncommittete Änderungen (`git status --short`)
- Letzter Commit (`git log -1 --oneline`)
- Falls kein Git-Repo: explizit "kein Git-Repo" vermerken

### 10. Kritische Kurz-Zusammenfassung (5 Punkte)
- Die 5 wichtigsten Infos für sofortiges Weiterarbeiten

---

## QUALITÄTSREGELN

- Maximale Informationsdichte
- Keine Floskeln, kein Smalltalk
- Keine Wiederholungen
- Priorisiere „was muss ein neues Modell wissen“
- Schreibe konkret, nicht abstrakt
- Lieber stichpunktartig als narrativ
- Keine irrelevanten Details

---

## ZIEL

Ein neues Modell soll dieses Projekt **ohne Kontextverlust sofort weiterführen können**.

Beginne jetzt.
````

3. **`context-restore.md` schreiben** mit exakt folgendem Inhalt:

````markdown
# /context-restore

Du bist ein Coding-Assistent, der gerade einen **Projektkontext aus einem Snapshot wiederherstellt**.

---

## INPUT

Lies eigenständig die Datei `docs/context-snapshot.md` (projekt-relativ) ein.
Diese enthält den letzten bekannten Projektzustand.

- Falls die Datei nicht existiert: sage das klar und frage, ob stattdessen ein
  frischer Überblick aus dem aktuellen Projektstand erstellt werden soll.

---

## AUFGABE

Analysiere den Snapshot und stelle den aktuellen Arbeitskontext wieder her.

Erstelle daraus:

### 1. Aktueller Projektzustand
- kurze Rekonstruktion des Projekts
- was gerade „real“ passiert

### 2. Aktive Arbeit
- woran du jetzt sofort weiterarbeiten würdest

### 3. Nächster sinnvoller Schritt
- konkret und ausführbar

### 4. Gefahren / Unsicherheiten
- fehlende Infos
- potenzielle Inkonsistenzen im Snapshot

### 5. Arbeitsplan (Next Actions)
- klare, priorisierte To-dos (P0 zuerst)

---

## REGELN

- Nutze ausschließlich den Snapshot als Quelle der Wahrheit
- Wenn Informationen fehlen: explizit markieren
- Keine Halluzinationen ergänzen
- Fokus auf „was mache ich jetzt konkret als nächstes“

---

## ZIEL

Sofortige Wiederaufnahme der Entwicklung ohne Kontextverlust.
````

4. **Idempotenz:** Falls die Dateien schon existieren, zeige dem User kurz die
   Unterschiede und frage, ob überschrieben werden soll.
5. Bestätige dem User: aufrufbar via `/context-snapshot` und `/context-restore`.

---

## Phase 6 — Git & GitHub für dieses Projekt (optional)

Biete dem User an, das aktuelle Projekt unter Versionskontrolle zu stellen und ein
GitHub-Repository anzulegen. Nur auf Zustimmung. Mache so viel wie möglich selbst.

1. **Git vorhanden?** (aus Phase 2). Falls nein → plattformpassenden
   Installationshinweis geben (Windows: `winget install Git.Git`; macOS:
   `brew install git` oder Xcode Command Line Tools) und Phase überspringen, bis
   verfügbar.
2. **Repo-Status prüfen:** Ist der Ordner schon ein Git-Repo (`git rev-parse
   --is-inside-work-tree`)? Falls nein und gewünscht:
   - `git init`
   - eine sinnvolle `.gitignore` anlegen (passend zum erkannten Projekttyp; mind.
     OS-/Editor-Artefakte, `node_modules/`, Build-Ordner, `.env`)
   - `git add -A` und ersten Commit `git commit -m "chore: initial commit"`
     (vorher sicherstellen, dass `user.name`/`user.email` gesetzt sind; falls nicht,
     den User nach Name/E-Mail fragen und `git config` setzen).
3. **GitHub-Voraussetzungen:** `gh --version` und `gh auth status`.
   - **`gh` vorhanden + authentifiziert:** Frage Repo-Name und privat/öffentlich,
     dann lege selbst an und pushe:
     `gh repo create <name> --private|--public --source=. --remote=origin --push`
   - **`gh` vorhanden, nicht authentifiziert:** Erkläre dem User Schritt für
     Schritt, dass er `gh auth login` (interaktiv) ausführen muss; warte, bis er
     fertig ist, dann fahre mit `gh repo create ...` fort.
   - **`gh` nicht installiert:** Biete zwei Wege an:
     a) Installation (Windows: `winget install GitHub.cli`; macOS: `brew install gh`),
        danach `gh auth login`, dann `gh repo create ...`.
     b) Fallback ohne `gh`: User legt das Repo manuell auf github.com an; danach
        machst du `git remote add origin <url>` und `git push -u origin <branch>`
        selbst. Erkläre das manuelle Anlegen Schritt für Schritt.
4. **Idempotenz:** Bestehendes Repo/Remote nicht überschreiben; Status berichten.
5. Bestätige dem User abschließend Branch, Remote-URL und Push-Status.

---

## Phase 7 — Kommunikations-Präferenzen (CLAUDE.md)

1. Frage den User, ob er spezielle Wünsche hat, **wie Claude mit ihm kommunizieren**
   soll. Gib konkrete Beispiele, damit er versteht, was gemeint ist:
   - Sprache (z. B. ausschließlich Deutsch)
   - Anrede: „Sie" statt „Du"
   - Tonfall (locker / sachlich / knapp)
   - Antwortlänge (kurz und direkt vs. ausführlich)
   - Sprache von Code-Kommentaren
2. Wenn der User **keine** Wünsche hat → diese Phase überspringen.
3. Andernfalls schreibe die Präferenzen in eine `CLAUDE.md`:
   - Scope wie in Phase 4 gewählt: projektlokal `./CLAUDE.md` oder global
     (Windows `~\.claude\CLAUDE.md`, macOS `~/.claude/CLAUDE.md`).
   - Existiert die Datei bereits: **ergänzen** (einen Abschnitt
     `## Kommunikation` hinzufügen/aktualisieren), **nicht** überschreiben.
   - Formuliere die Präferenzen als klare, knappe Instruktionen, z. B.:
     `- Kommuniziere ausschließlich auf Deutsch.`
     `- Sieze den User (kein „Du").`
4. Zeige dem User den geschriebenen Abschnitt zur Bestätigung.

---

## Phase 8 — Zusammenfassung & Selbstlöschung

1. **Bericht:** Fasse zusammen, was getan wurde: Claude-Version/Update,
   installierte Plugins, geschriebene Context-Commands (mit Pfad), Git/GitHub-Status,
   Kommunikations-Präferenzen. Nenne auch, was übersprungen wurde und warum.
2. **Nächste Schritte** für den User: z. B. Claude Code neu starten, damit Plugins
   aktiv werden; `/context-snapshot` vor langen Sessions nutzen.
3. **Selbstlöschung anbieten:** Frage ausdrücklich, ob `InitialSetup.md` jetzt aus
   dem Projektordner gelöscht werden soll, damit das Setup nicht erneut startet.
   - Nur bei klarer Zustimmung löschen:
     - Windows: `Remove-Item .\InitialSetup.md`
     - macOS: `rm ./InitialSetup.md`
   - Bestätige die Löschung.
4. Falls der User **nicht** löschen will: Datei behalten, Hinweis geben, dass das
   Setup beim nächsten Mal erneut laufen würde.
