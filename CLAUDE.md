# CLAUDE.md — Spielregeln für diesen Betrieb

> **Dies ist die zentrale Konventionsdatei.** Jede KI-Instanz (Claude Code, Claude.ai, Claude in anderen Tools) liest diese Datei zu Beginn einer Session. Sie definiert, wie wir gemeinsam als "Betrieb" arbeiten.

---

## 🏛️ Betriebsmodell

**Maklerbetrieb für Finanzmakler** — entwickelt nach dem Modell einer Polyklinik:
- Verschiedene Kompetenzen unter einem Dach (IT, Finanz, Admin, Produktentwicklung)
- Arbeitsteilig, gegenseitig unterstützend
- Interdisziplinarität als Standard, nicht Ausnahme
- "Einer für alle, alle für einen"

### Drei Betriebsebenen

1. **Administrativ** — Governance, Spielregeln, Schnittstellen
2. **Buchhaltung** — Ressourcen, Budget, Effizienz, Token-Management
3. **Produktiv** — Coding, Design, Testing, Dokumentation

---

## 🤝 Grundregeln

### Infrastruktur vor Inhalt
Bevor Code geschrieben wird: Struktur, Konventionen, Schnittstellen stehen fest.

### Idempotent & Reversibel
- Jede Aktion kann rückgängig gemacht werden
- Vor jeder Änderung: Status prüfen, nicht zweimal machen
- Git ist die Wahrheit, nicht der Chat-Verlauf

### Kontextbudget respektieren
- Token sind eine Ressource wie Geld in echtem Betrieb
- Mindestens Sonnet, bevorzugt Opus für komplexe Coding-Aufgaben
- Bei ~60-70% Kontext-Auslastung: `/context-snapshot` → Neustart → `/context-restore`
- Monitoring: regelmäßig `https://claude.ai/new#settings/usage` prüfen

### Quellen der Wahrheit
- **STATUS.md** — Laufender Stand, wer macht was, nächste Schritte
- **CLAUDE.md** (diese Datei) — Spielregeln, Konventionen
- **Git-History** — Jede Änderung ist nachvollziehbar
- **GitHub Issues/Projects** — Abstraktion, nicht das Repo selbst

### Gegenseitige Hilfe als Standard
- Jeder kann jeden um Unterstützung bitten
- "Nein" ist außer bei technischen Unmöglichkeiten nicht akzeptabel
- Kontinuierliches Lernen durch Zusammenarbeit

### Transparenz über Ebenen hinweg
- Alle Betriebsebenen haben Zugang zu Planung, Status, Entscheidungen
- Kein isoliertes Silodenken

### Konstruktive Selbstkritik — Prämisse für alle Abteilungen
- Jede Abteilung (IT, Produktiv, Admin) prüft ihre eigene Arbeit kritisch nach jeder Session.
- Fehler, Fehleinschätzungen und Prozesslücken werden offen benannt — keine Beschönigung.
- Erkenntnisse fließen sofort in Werkzeuge, Checklisten oder Dokumentation ein.
- Dies ist kein optionaler Schritt, sondern fester Bestandteil jedes Arbeitsabschlusses.
- Ziel: Der Betrieb lernt systematisch und wird mit jeder Session besser.

---

## 📋 Session-Ritual

### Vor der Arbeit
1. Diese Datei (`CLAUDE.md`) lesen
2. `STATUS.md` lesen — wo sind wir, wer macht was
3. Git-Status prüfen: `git status`, evtl. `git pull`

### Während der Arbeit
- Arbeitsfolge sichtbar halten: Anforderungen → Spezifikation → Plan → Umsetzung → Tests
- Rückfragen aktiv einfordern
- Sub-Agents für Parallelisierung nutzen (nicht Sequenzialisierung)
- Kontextbudget im Blick

### Nach der Arbeit
1. Code/Dateien committen: `git add .` → `git commit -m "..."` → `git push`
2. `STATUS.md` aktualisieren
3. Offene Fragen/Blockers notieren
4. `/context-snapshot` vor Session-Ende (falls Kontext über 70%)

---

## 🛠️ Werkzeuge & Zugriff

| Werkzeug | Zugriff | Rolle | Git-Integration |
|----------|--------|-------|-----------------|
| VSCode (lokal) | ✓ | Editor | Native (CLI) |
| Claude Code | ✓ | Pair-Programming | Liest/schreibt Dateien |
| Claude.ai | ~ | Strategisches Denken, Protokolle | Upload nötig, STATUS.md per Hand |
| ChatGPT | ? | Optional (fallweise) | Extern, via export |
| GitHub | ✓ | Single Source of Truth | Primary |
| Homebrew | ✓ | Umgebung | Konfigurationsdateien im Repo |

---

## 📍 Projektstruktur (WIRD AUFGEBAUT)

```
/
├── CLAUDE.md              ← Diese Datei (Spielregeln)
├── STATUS.md              ← Laufendes Logbuch (wöchentlich)
├── README.md              ← Überblick, Was ist dieses Projekt
├── InitialSetup.md        ← Onboarding für neue Instanzen
├── BETRIEB.md             ← Betriebsmodell detailliert (kommt)
├── RESOURCE-POLICY.md     ← Token/Budget-Management (kommt)
├── src/                   ← Produktiver Code
│   ├── maklerbetrieb/     ← Kern-Domäne
│   └── ...
├── docs/                  ← Dokumentation, Architektur, Entscheidungen
│   ├── ARCHITEKTUR.md
│   ├── context-snapshot.md
│   └── ...
├── tests/                 ← Automatisierte Tests
├── .github/               ← GitHub Actions, Workflows
└── .git/                  ← Version Control
```

---

## 🎯 Sprache & Stil

- **Sprache:** Deutsch (fachlich präzise, kein Kauderwelsch)
- **Anrede:** Sie (verbindlich)
- **Fehler:** Tipp- und Rechtschreibfehler korrigieren vor dem Speichern
- **Protokolle:** Wörtliche Chats in STATUS.md nur nach Bereinigung

---

## 📞 Eskalation & Entscheidungen

- **Unklar?** Fragen, nicht raten. Rückfragen sind kein Zeichen von Schwäche.
- **Blockiert?** Sofort notieren in STATUS.md, nicht warten.
- **Ressourcen-Engpass?** Administrator (Nutzer) informieren, nicht verschweigen.

---

## ✅ Checkliste für neue Sessions

- [ ] Diese Datei (`CLAUDE.md`) gelesen
- [ ] `STATUS.md` gelesen
- [ ] `git pull` (um neueste Änderungen zu holen)
- [ ] Kontextbudget gecheckt (Sonnet/Opus-Modell?)
- [ ] Erste Aufgabe ist klar (was konkret tue ich in dieser Session?)

---

**Letzte Änderung:** 2026-07-13 (Domain-Analyse abgeschlossen)  
**Nächste Review:** Nach Use-Case-Definition

---

## 🔄 Kontinuitätsprinzip (gilt für ALLE Plattformen)

**GitHub ist das einzige Gehirn, das alle kennen.** Claude Code, Claude.ai, ChatGPT, DeepSeek — alle lesen beim Einstieg diese Datei + STATUS.md. Dann ist der Stand sofort klar, ohne Rückfragen.

Verbindliches Betriebsmodell fuer Mac, Windows und Untitled:
- Siehe `docs/DREISYSTEM-BETRIEBSMODELL.md`.
- Kurzregel: Mac und Windows sind jeweils voll arbeitsfaehige Hauptsysteme, Untitled ist die portable Sicherungs- und Wiederanlaufkopie, GitHub bleibt die priorisierte Wahrheitsinstanz.

**Pflichtablauf am Session-Ende — automatisch, ohne Aufforderung:**
1. Protokoll unter `logs/Protokoll_YYYY-MM-DD_[Thema].md` ablegen
2. STATUS.md aktualisieren
3. Chat-Verlauf als TXT unter `logs/chats/Chat_YYYY-MM-DD_[Thema].txt` sichern
	- Standardbefehl: `bash tools/archive-chat.sh <TRANSCRIPT_JSONL> <THEMA>`
   - Ein-Klick-Endroutine: `bash tools/end-session.sh --topic "<THEMA>"`
4. `git add -A && git commit -m "Session YYYY-MM-DD: [Thema]" && git push`

Kein "Soll ich speichern?". Kein "Wo waren wir?". Immer. Automatisch.

---

## 🏢 Domain-Wissen: RennsteigFINANZ (Stand 13.07.2026)

### Kernsysteme im Betrieb

| System | Funktion | Besonderheit |
|---|---|---|
| VEMA Office | Eigenbestand Kunden/Verträge, BiPro-Abgleich | Primärsystem |
| VEMA Pool | Poolverträge | VEMA = formaler Bestandsmakler; Direktzugriff auf Versicherer eingeschränkt |
| Outlook | Zentraler Eingangskanal | GDV-Daten + Pool-Informationen; Schnittstelle zu VEMA in Vorbereitung |
| Eigene Ablage | Lokale Pfadstruktur | Vollständigste Kundenakte; enthält Nicht-Versicherungssparten |
| Abrechnungs-Excel | Provisionsdaten | CSV-Einzelpositionsdaten von Gesellschaften vorhanden |
| Finanzplanungs-Tool | Beratungsinstrument (VBA/Excel, Eigenentwicklung) | **Haushalt als aggregierende Entität** — zentralstes Datenmodell-Konzept |

### Rollen im Betrieb

| Rolle | Funktion |
|---|---|
| Betriebsleiter / Generalist | Herr Tippmann — Finanzplanung, Bausparen, Finanzieren, alle Sparten |
| Fachspezialisten (3) | Kfz, Gewerbliche Risiken, Krankenversicherung + Biometrische Risiken |
| Investment-Spezialist | Kapitalanlagen, Fondssparen, Depotführung, Erben/Schenken |
| Assistenz | Vor-/Nachbereitung Beratungen, Dokumentenverwaltung |
| Administrator (IT) | EDV, Infrastruktur, portable Arbeitsumgebung |

### Zentrale fachliche Konzepte

- **Haushalt als aggregierende Entität:** Verträge verschiedener Sparten werden im Haushaltskontext verknüpft (dynamisch auflösbar).
- **Bedarf vor Produkt:** Kein Bedarf = kein Produkt. Bedarfsermittlung ist dem Produkt fachlich vorgelagert.
- **Vermögensaufbau ≠ Altersvorsorge:** Altersvorsorge erfordert biometrische Risikoabsicherung (z.B. BU-Beitragsfreistellung).
- **Altersvorsorgedepot** (Riester-Nachfolger): Inkrafttreten 01.01.2027. Vorbereitungszeit läuft.

### Identifizierte Nutzen-Kandidaten (noch keine Use-Cases)

1. Ertragsauswertung pro Kunde aus CSV-Positionsdaten
2. Automatisierter Bestandslisten-Abgleich (Vertragsnummer als Schlüssel)
3. KI-Assistenz: Vor-/Nachbereitung von Beratungen
4. Automatisierte Zusammenfassung der wöchentlichen Arbeitsbesprechung
5. Investment-Spezialist: plattformübergreifende Entscheidungsschicht
6. Beratungsgespräch-Mitschnitt/-Protokollierung (inkl. Überlegungszeit-Nachweis § 61 VVG)
7. Administrator: portable, stabile, redundante Arbeitsumgebung
