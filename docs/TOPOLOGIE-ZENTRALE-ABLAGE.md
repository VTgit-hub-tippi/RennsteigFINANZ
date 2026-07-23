<!-- markdownlint-disable MD007 MD009 MD022 MD029 MD032 MD034 MD060 -->

# TOPOLOGIE-ZENTRALE-ABLAGE.md

> **Die zentrale Struktur für RennsteigFINANZ über Mac, Windows und Untitled.**
> Alle Systeme folgen demselben Muster. Dies ist verbindlich.

---

## 🏗️ Zentrale Struktur

### macOS (Mac-tippi-2)
```
~/dev/projects/RennsteigFINANZ/
├── .git/                              ← GitHub Remote
├── src/                               ← Produktiver Code
├── docs/                              ← Dokumentation
├── data/                              ← Bestandsdaten (lokal)
├── logs/                              ← Protokolle, Chat-Archive
├── tools/                             ← Skripte (setup, sync, archive)
├── tests/                             ← Tests
├── CLAUDE.md                          ← Spielregeln (Kontinent-Wahrheit)
├── STATUS.md                          ← Laufendes Betriebslogbuch
├── README.md
├── NEXT-ACTION.md
├── InitialSetup.md
├── start-checklist.md
└── ...
```

**Lokalität:** Dies ist das operative Arbeitsverzeichnis. Git ist lokal (`.git/`), Remote ist GitHub.  
**Größe:** ~500 MB (inkl. .git history)  
**Backup-Frequenz:** Nach jeder Session (automatisch via `git push` + Snapshot auf Untitled)

---

### Windows (Windows 10/11 Testumgebung)
```
C:\dev\projects\RennsteigFINANZ\
├── .git\
├── src\
├── docs\
├── data\
├── logs\
├── tools\
├── tests\
├── CLAUDE.md
├── STATUS.md
└── ... (identisch mit macOS)
```

**Lokalität:** Analog macOS. Windows arbeitet mit demselben Repository.  
**Sync-Strategie:** `git pull` vor Arbeit, `git push` am Ende.  
**Besonderheit:** Kann auch von Untitled booten (siehe Untitled `active/`).

---

### Untitled (externe Festplatte als „System-Defibrilator" + portable Arbeitsumgebung)

```
/Volumes/Untitled/RennsteigFINANZ/
├── active/                            ← Portable Arbeitsumgebung (optional)
│   └── [vollständiges Projekt, bootfähig von Mac/Windows]
│
├── backups/
│   ├── full/
│   │   └── RennsteigFINANZ-full-2026-07-14/
│   │       └── [Snapshot des kompletten Projekts]
│   │
│   └── tagesstand/
│       └── RennsteigFINANZ-Tagesstand-2026-07-14/
│           └── [Tagesstand-Snapshot von Mac oder Windows]
│
├── git-bundles/
│   └── RennsteigFINANZ-git-bundles/
│       └── [Git-Archive für Recovery]
│
└── storage-offload/
    └── Storage-Offload-2026-07-14/
        └── Library-Containers/
            └── [Nicht-Projekt-Daten: Configurations, Caches, etc.]
```

**Funktion:**
1. **Defibrilator:** Wenn Mac/Windows beschädigt sind → `active/` übernehmen oder Backups restaurieren
2. **Portable Arbeitsumgebung:** `active/` kann direkt von Untitled ausgeführt werden (wenn `git` und Abhängigkeiten vorhanden)
3. **Archiv:** `backups/` und `git-bundles/` sind Read-Only-Sicherungen

**Update-Frequenz:**
- `backups/` — Nach signifikanten Checkpoints (wöchentlich oder nach mayor Updates)
- `git-bundles/` — Nach Release-Kandidaten oder Recovery-Vorbereitungen
- `storage-offload/` — Manuell, nach Bedarf (Caches, alte Configs)

---

## 🔄 Workflow: Zentrale Topologie im Einsatz

### Szenario 1: Normales Arbeiten (Mac oder Windows)
```
Mac/Windows
  ↓
Arbeite lokal in ~/dev/projects/RennsteigFINANZ/
  ↓
git commit + git push (automatisch am Session-Ende via `tools/end-session.sh`)
  ↓
STATUS.md aktualisieren
  ↓
Optional: Snapshot auf Untitled für inkrementelle Sicherung
```

### Szenario 2: Mac beschädigt → Wiederherstellung von Untitled
```
Mac-System instabil
  ↓
Von Untitled booten (falls U-Disk bootfähig) ODER
Neuen Mac aufsetzen + Untitled `/active/` oder `/backups/full/` als Ausgangspunkt nutzen
  ↓
~/dev/projects/RennsteigFINANZ/ lokal rekonstruieren
  ↓
`git pull origin main` um Remote-Stand nachzuziehen
  ↓
Arbeit fortsetzen
```

### Szenario 3: Windows-Sync mit Untitled
```
Windows VM startet (z.B. Boot von Untitled oder lokale Kopie)
  ↓
`git pull origin main`
  ↓
Stelle sicher, dass `C:\dev\projects\RennsteigFINANZ\` mit Untitled/RennsteigFINANZ/active/ oder /backups/ alignt
  ↓
Arbeit, Commits, Push
  ↓
Optional: Aktualisiere Windows-Snapshot auf Untitled für Baseline
```

---

## 📊 Namenskonvention — Zentral

| System | Pfad | Projekt-Name | Status |
|---|---|---|---|
| **macOS** | `~/dev/projects/RennsteigFINANZ/` | `RennsteigFINANZ` ✓ | Korrekt |
| **Windows** | `C:\dev\projects\RennsteigFINANZ\` | `RennsteigFINANZ` ✓ | Korrekt |
| **Untitled** | `/Volumes/Untitled/RennsteigFINANZ/` | `RennsteigFINANZ` ✓ | Korrekt |

**Keine Varianten wie „Projekt Claude" mehr.** Alle Systeme sagen `RennsteigFINANZ`.

---

## 🛠️ Wartungs-Checkliste (monatlich)

- [ ] `git log --oneline` auf Mac/Windows prüfen: Commits aktuell?
- [ ] Untitled-Snapshots altern: Überprüfen auf `/Volumes/Untitled/RennsteigFINANZ/backups/`
- [ ] `storage-offload/` aufräumen: Sind alte Library-Container noch relevant?
- [ ] `active/` auf Untitled aktualisieren: Falls als portable Umgebung genutzt, mit neuesten Änderungen abgleichen
- [ ] Recovery-Test: Kann man von Untitled starten? (Mindestens halbjährlich)

---

## 📝 Datenfluss (Automatisierung)

```
Mac/Windows arbeitet lokal
  ↓ (git push am Session-Ende)
GitHub (Remote = Quelle der Wahrheit)
  ↓ (optional, manuell)
Untitled/backups/ + Untitled/active/ (Sicherung + portable Umgebung)
```

**Regel:** GitHub ist immer aktueller als Untitled. Untitled ist der „Hardware-Defibrilator", nicht der Live-Stand.

---

## ⚙️ Betriebsmodus pro System

| Ebene | Betriebsmodus | Arbeitsweise |
|---|---|---|
| **macOS** | Primär | Operative Entwicklung, Produktivcode |
| **Windows** | Sekundär | Test-, Validierungs-, Demo-Umgebung; Sync mit macOS |
| **Untitled** | Backup + Recovery | Sicherung, Wiederherstellung, portable Fallback-Umgebung |

---

## 🚨 Krisenszenarien

### Szenario A: Mac total beschädigt
1. Neue Mac-Umgebung aufsetzen
2. Untitled anschließen → `/Volumes/Untitled/RennsteigFINANZ/backups/full/` als Ausgangspunkt
3. `git clone origin` durchführen (GitHub ist die Wahrheit)
4. Arbeitsstand ist wiederhergestellt

### Szenario B: GitHub-Remote nicht erreichbar
1. Untitled `/git-bundles/RennsteigFINANZ-git-bundles/` nutzen, um lokales Repo zu rekonstruieren
2. Lokal weiterarbeiten
3. GitHub später resyncen

### Szenario C: Untitled-Volume fehlerhaft
1. Mac/Windows arbeiten unabhängig von Untitled weiter
2. GitHub Remote ist immer noch verfügbar
3. Untitled ist ein Luxus, nicht kritisch (solange GitHub verfügbar ist)

---

## ✅ Checkliste: Zentrale Topologie korrekt?

Nach jeder Umstrukturierung:

- [ ] Mac: `~/dev/projects/RennsteigFINANZ/.git/config` hat Remote `origin` → GitHub
- [ ] Mac: `STATUS.md` existiert und ist aktuell
- [ ] Windows: Identische Struktur vorbereitet (wenn Testumgebung aktiv)
- [ ] Untitled: `/RennsteigFINANZ/backups/full/`, `git-bundles/`, `storage-offload/` existieren
- [ ] Untitled: `/RennsteigFINANZ/active/` leer und bereit (für portable Umgebung)
- [ ] Keine verwaisten Ordner wie `Downloads/Projekt Claude` mehr
- [ ] Namenskonvention konsistent: überall `RennsteigFINANZ`

---

**Letzte Änderung:** 2026-07-23 (Zentrale Reorganisierung)  
**Nächste Review:** Nach Windows-Sync (prüfen, ob Windows-Struktur korrekt angelegt ist)

