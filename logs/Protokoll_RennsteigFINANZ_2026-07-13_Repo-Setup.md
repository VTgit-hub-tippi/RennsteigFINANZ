# Protokoll — RennsteigFINANZ: Repository-Setup & Kontinuitätsstrategie
**Datum:** 13.07.2026
**Teilnehmer:** Herr Tippmann (Betriebsleiter), GitHub Copilot (VS Code)
**Plattform:** VS Code / GitHub Copilot Chat

---

## Anlass

Nach Domain-Analyse-Session (auf Claude.ai, Gerät: iPhone + iPad) Rückkehr zu VS Code auf dem Mac. Ziel: Session-Ergebnisse ins Repository überführen und dauerhaft funktionierende Kontinuitätsstrategie einrichten.

## Festgestelltes Problem

- Workspace `/Documents/Claude Code Projekte/NEUES PROJEKT VERZEICHNIS/` war für Terminal und VS Code durch macOS Full-Disk-Access-Beschränkung nicht zugänglich.
- Kein bestehendes GitHub-Repository vorhanden.
- Keine automatische Session-Dokumentation etabliert.
- Ergebnis: Bei jedem Plattformwechsel musste der Stand mühsam rekonstruiert werden.

## Beschlossene Lösung

**GitHub als zentrales Gehirn:** Alle Beteiligten (Claude Code, Claude.ai, ChatGPT, DeepSeek usw.) lesen beim Einstieg CLAUDE.md und STATUS.md aus dem Repository — damit ist der Stand sofort klar, ohne Rückfragen.

**Neuer Projektpfad:** `~/dev/projects/RennsteigFINANZ/` — außerhalb von Documents, Terminal und VS Code haben dort Zugriff.

## Durchgeführte Schritte

1. `~/dev/projects/RennsteigFINANZ/` mit Git initialisiert
2. `CLAUDE.md` als zentrales Kontextdokument angelegt (vollständiger Projektstand, Rollen, Systeme, Nutzen-Kandidaten, Blocker)
3. `STATUS.md` mit aktuellem Stand angelegt
4. Protokolldateien aus iCloud-Downloads in `/logs/` übertragen:
   - `Protokoll_RennsteigFINANZ_2026-07-13_Domain-Analyse.md`
   - `Protokoll_RennsteigFINANZ_2026-07-13_Domain-Analyse-Teil2.md`
5. `/logs/chats/` Ordner für Chat-TXT-Exporte angelegt
6. GitHub-Repository angelegt und initial gepusht

## Verbindliche Session-Endregel (ab sofort für jede KI)

Am Ende jeder Session IMMER automatisch:
1. Protokoll unter `/logs/Protokoll_YYYY-MM-DD_[Thema].md`
2. STATUS.md aktualisieren
3. Chat-Verlauf als TXT unter `/logs/chats/Chat_YYYY-MM-DD_[Thema].txt`
4. `git add -A && git commit && git push`

Kein manuelles Nachfragen. Immer.

## Nächste Schritte

1. VS Code-Workspace auf neuen Pfad zeigen lassen
2. Domain-Themen fortsetzen oder direkt Use-Cases ableiten
3. Tech-Stack-Entscheidung angehen
