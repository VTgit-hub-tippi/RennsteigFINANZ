# GeneralClaudeSetup

Ein **portabler, geführter Installer für Claude Code**. Kernstück ist die Datei
[`InitialSetup.md`](./InitialSetup.md): eine selbstcontainte Anleitung, die du in
ein beliebiges Projekt (auch auf einem fremden Rechner) kopierst. Claude liest sie
und richtet daraufhin in einem interaktiven, geführten Prozess eine bewährte
Arbeitsumgebung für strukturiertes, professionelles Coding ein.

## Was das Setup tut

Beim Ausführen läuft `InitialSetup.md` acht Phasen durch — jede mit kurzer
Erklärung und Freigabe, bevor etwas verändert wird:

1. **Begrüßung & Überblick**
2. **Umgebungs-Check** – OS, Claude-Version, vorhandene Tools/Plugins
3. **Claude-Update** – prüft und aktualisiert Claude Code
4. **Plugins** – recherchiert zur Laufzeit die aktuell besten Plugins und
   installiert die ausgewählten selbst
5. **Context-Tools** – installiert die Slash-Commands `/context-snapshot` und
   `/context-restore`
6. **Git & GitHub** – legt auf Wunsch Versionskontrolle und ein GitHub-Repo an
7. **Kommunikations-Präferenzen** – schreibt deine Wünsche (z. B. Sprache, Anrede)
   in eine `CLAUDE.md`
8. **Zusammenfassung & Selbstlöschung** – berichtet das Ergebnis und entfernt sich
   nach deiner Freigabe selbst

Claude erledigt so viel wie möglich selbst und bindet dich nur bei
Entscheidungen oder unvermeidbaren manuellen Schritten ein. Unterstützt
**Windows und macOS** gleichermaßen.

## So nutzt du `InitialSetup.md`

1. **Kopieren:** Lege `InitialSetup.md` in das Wurzelverzeichnis des Projekts, das
   du einrichten möchtest.
2. **Claude Code starten** in diesem Projektordner.
3. **Setup auslösen:** Sage zu Claude:

   > Folge InitialSetup.md

   (oder gib `@InitialSetup.md` ein und bitte Claude, der Datei zu folgen).
4. **Durch den Prozess gehen:** Beantworte die Rückfragen. Du kannst jederzeit
   abbrechen; ohne deine Freigabe wird nichts installiert oder verändert.
5. **Abschluss:** Am Ende fragt Claude, ob `InitialSetup.md` gelöscht werden soll,
   damit das Setup beim nächsten Start nicht erneut läuft. Bestätige, wenn du
   fertig bist.

> **Tipp:** Die Datei ist vollständig selbstcontaint – sie enthält die beiden
> Context-Commands eingebettet und braucht keine weiteren Dateien aus diesem Repo.
> Es genügt, allein `InitialSetup.md` zu kopieren.

## Die Context-Commands

Nach dem Setup stehen zwei Slash-Commands zur Verfügung, die einen Kontext-Reset
überstehen:

- **`/context-snapshot`** – schreibt eine dichte Projekt-Zustandszusammenfassung
  (inkl. Git-Zustand) nach `docs/context-snapshot.md`.
- **`/context-restore`** – liest diesen Snapshot wieder ein und stellt den
  Arbeitskontext her.

Die kanonischen Quellen liegen als [`docs/context-snapshot.md`](./docs/context-snapshot.md)
und [`docs/context-restore.md`](./docs/context-restore.md) im Repo.

## Projektstruktur

```
InitialSetup.md          # Der portable Installer (Kernartefakt)
CLAUDE.md                # Kommunikationspräferenzen für Claude
.docs/
  context-snapshot.md    # Kanonische Quelle des Snapshot-Commands
  context-restore.md     # Kanonische Quelle des Restore-Commands
.claude/
  commands/              # Slash-Commands für Snapshot/Restore
  skills/                # Lokale Skills für Superpowers und Review-Guidelines
marketplace/             # Lokale Marketplace-Pakete (Entwurf)
evals/                  # Eval-Suite für die lokalen Skills
skills-README.md        # Kurze Nutzungshilfe für die Skills
start-checklist.md      # Schneller Einstieg für den ersten Start
```

## Aktueller Status

- Claude Code ist installiert und funktionsfähig.
- Lokale Skills sind im Projekt verfügbar.
- Context-Commands und Kommunikationspräferenzen sind angelegt.
- Evals und Start-Checkliste sind ergänzt.

## Schnellstart

1. Claude Code starten.
2. Falls Skills nicht automatisch sichtbar sind: Claude neu starten oder `/reload-plugins` ausführen.
3. Einen Testprompt senden, z. B.:
   - „Fasse dieses Projekt in 6 Bulletpoints zusammen.“
   - „Prüfe diesen Codeabschnitt mit dem lokalen Review-Skill.“
4. Optional: `/context-snapshot` oder `/context-restore` verwenden.
