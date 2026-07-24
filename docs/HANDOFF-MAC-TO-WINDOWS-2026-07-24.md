# HANDOFF Mac → Windows (2026-07-24)

**Zeitstempel:** 2026-07-24, ~11:00 Uhr (Mac-Session)  
**Status:** Mac-Seite vorbereitet, Windows-Setup folgt

---

## 🔄 Was Mac-Claude gerade gemacht hat

### 1. ✅ Speicher-Status auf Mac analysiert
- **Problem:** Container 99.9% voll (nur 505 MB frei)
- **Größte Verbraucher:** DEVONthink (72 GB), Music (75 GB), Library (158 GB)
- **Entscheidung:** Nicht panisch → gradueller Cleanup später (nach Hybrid v0.1)
- **Aktuell:** Mac ist eng aber arbeitsfähig

### 2. ✅ Mac-Backup zu Untitled synchronisiert
```bash
rsync -av ~/dev/projects/RennsteigFINANZ /Volumes/Untitled/RennsteigFINANZ.bak/
→ 405 MB übertragen, erfolgreich
```

### 3. ✅ Backup-Ritual verankert (NEXT-ACTION.md)
Nach jeder Session:
- **Mac:** `git push` → `rsync` zu Untitled
- **Windows:** `git push` → `rsync` zu Untitled + NAS
- **GitHub:** Zentrale Wahrheitsquelle
- **Untitled:** Zentrale Rückversicherung (autonome Backup-Ebene)

### 4. ✅ Arbeitsumgebung Health-Check bestanden
```
✅ Untitled verfügbar  (zentrale Backup-Ebene)
✅ MRT verfügbar       (Windows lesbar vom Mac)
✅ GitHub aktiv        (Mac-Repo synchron)
```

---

## 🎯 Was Windows-Claude jetzt tun soll

### Schritt 1: Remote-Desktop-Session starten
- **Ziel:** `C:\dev\projects\RennsteigFINANZ\`
- **Infrastruktur:** NAS (DiskStation) verfügbar

### Schritt 2: Windows-Git-Setup (nach WINDOWS-TOPOLOGIE-SETUP-CHECKLIST.md)
```powershell
# 1. Git installiert? (Falls nicht: `winget install Git.Git` oder chocolatey)
git --version

# 2. Repository klonen
cd C:\dev\projects
git clone https://github.com/VTgit-hub-tippi/RennsteigFINANZ.git
cd RennsteigFINANZ

# 3. Aktuellen Stand holen (incl. Backup-Ritual + Documentation)
git pull origin main

# 4. Status prüfen
git status
git log --oneline -5
```

### Schritt 3: VBA-Finanzplanung analysieren
**Ziel:** UC-001 (Haushaltsübersicht) verstehen
- Öffne das VBA-Tool (Finanzplanung)
- Dokumentiere: 
  - VBA-Struktur (Funktionen, Module, Klassen)
  - Excel-Datenmodell (Tabellen, Formeln, Schemas)
  - UC-001 Input/Output (was reingehen soll, was rauskommt)
  - Datenquellen (extern? VEMA-Integration? Outlook?)
  - Performance-Anforderungen

**Ausgabe:** Screenshot/Export ins Repo unter `docs/VBA-FINANZPLANUNG-ANALYSE-2026-07-24.md`

### Schritt 4: Zum Abschluss Backup zu Untitled
```bash
# NAS-Verbindung öffnen: "Zu Hause"-Verknüpfung klicken
# Dann rsync zu Untitled (SMB-Pfad):

rsync -av C:\dev\projects\RennsteigFINANZ \\MRT\Untitled\RennsteigFINANZ.bak\

# Oder PowerShell:
Copy-Item -Path "C:\dev\projects\RennsteigFINANZ" -Destination "\\MRT\Untitled\RennsteigFINANZ.bak\" -Recurse -Force

# Am Ende: "Feierabend"-Verknüpfung klicken → NAS trennen
```

### Schritt 5: Git-Commits & Push
```powershell
git add .
git commit -m "Windows-Setup 2026-07-24: Repository klonen, VBA-Analyse gestartet"
git push origin main
```

---

## 📋 Wichtige Dateien zum Lesen (Windows-Claude)

1. **docs/WINDOWS-TOPOLOGIE-SETUP-CHECKLIST.md** ← Step-by-step
2. **docs/HYBRID-IMPLEMENTATION.md** ← Strategie verstehen
3. **NEXT-ACTION.md** ← Prioritäten (P0/P1/P2)
4. **STATUS.md** ← Aktueller Betriebsstatus
5. **CLAUDE.md** ← Spielregeln & Betriebsmodell

---

## 🔗 Infrastruktur (Windows)

| Ziel | Pfad | Status |
|------|------|--------|
| Git Repo | `C:\dev\projects\RennsteigFINANZ` | Noch zu klonen |
| GitHub | `https://github.com/VTgit-hub-tippi/RennsteigFINANZ.git` | ✅ Aktiv |
| NAS (DiskStation) | `\\MRT\backup\` | "Zu Hause" → Verbindung |
| Untitled Backup | `/Volumes/Untitled/RennsteigFINANZ.bak/` | ✅ Zentral |

---

## 🚀 Nächste Schritte (Gesamt-Plan)

**Diese Woche (24-26.07):**
- ✅ Mac: Speicher analysiert, Backup aktualisiert
- → Windows: Git-Setup + VBA-Analyse
- → Mac parallel: Python-Skeleton vorbereiten

**Woche 1+ (29.07+):**
- Windows: VB-Skript UC-001 implementieren
- Mac: Python UC-001 implementieren
- Hybrid-Roadmap startet

---

## 📞 Fragen für Windows-Claude

Wenn du auf Windows losgeht, klär diese Punkte bei der VBA-Analyse:

1. **Datenbasis?** Nur Excel-intern oder externe APIs (VEMA, SQL, etc.)?
2. **Nutzer-Interaktion?** Welche Eingaben macht Nutzer, welche Outputs sieht er?
3. **Tests vorhanden?** VB-Unit-Tests oder Test-Szenarien dokumentiert?
4. **Performance?** Wie schnell muss UC-001 berechnet werden?
5. **Abhängigkeiten?** VEMA-Integration, Outlook, andere Systeme?

---

**Synchronisiert!** ✅ Windows-Claude hat jetzt volle Orientierung.

Viel Erfolg beim Windows-Setup! 🚀
