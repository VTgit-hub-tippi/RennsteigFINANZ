<!-- markdownlint-disable MD007 MD009 MD022 MD029 MD032 MD034 MD060 -->

# Windows-Topologie-Setup-Checklist

> **Für Remote-Desktop am Arbeitsplatz (Firma), 2026-07-24**
> 
> Schritt-für-Schritt-Anleitung zur Aufbau von RennsteigFINANZ auf Windows, analog macOS.

---

## ✅ Vorbereitung (vor der Session)

- [ ] Remote-Desktop-Verbindung funktioniert?
- [ ] Git für Windows installiert? (`git --version` testen)
- [ ] VS Code vorhanden? (optional, aber empfohlen)
- [ ] Internet-Zugang auf Windows verfügbar?
- [ ] Admin-Zugriff vorhanden (falls nötig)?

---

## 📁 Schritt 1: Verzeichnisstruktur aufbauen

```powershell
# PowerShell öffnen (Admin-Modus nicht nötig)
cd C:\
mkdir dev\projects
cd dev\projects
```

**Status:** ✅ Verzeichnis `C:\dev\projects\` existiert

---

## 🔗 Schritt 2: Repository klonen

```powershell
cd C:\dev\projects
git clone https://github.com/VTgit-hub-tippi/RennsteigFINANZ.git
cd RennsteigFINANZ
```

**Erwartung:**
- `.git/` Ordner existiert
- `CLAUDE.md`, `STATUS.md`, `README.md` sichtbar
- `docs/`, `logs/`, `tools/`, `src/`, `data/` vorhanden

**Status:** ✅ Repository geklont

---

## 📍 Schritt 3: Remote prüfen

```powershell
git remote -v
```

**Erwartung:**
```
origin  https://github.com/VTgit-hub-tippi/RennsteigFINANZ.git (fetch)
origin  https://github.com/VTgit-hub-tippi/RennsteigFINANZ.git (push)
```

**Status:** ✅ Remote `origin` zeigt auf GitHub

---

## 📥 Schritt 4: Aktuellen Stand holen

```powershell
git pull origin main
```

**Erwartung:**
- Alle aktuellen Dateien von Mac (Topologie-Doku, Archive, etc.) sind lokal vorhanden
- `docs/TOPOLOGIE-ZENTRALE-ABLAGE.md` existiert
- `docs/ENTWICKLUNGSHISTORIE.md` existiert

**Status:** ✅ Pull erfolgreich

---

## 📝 Schritt 5: Git-Status prüfen

```powershell
git status
```

**Erwartung:**
```
On branch main
Your branch is up to date with 'origin/main'.
nothing to commit, working tree clean
```

**Status:** ✅ Alles sauber

---

## 🎯 Schritt 6: Testdatei erstellen (Beweis für Windows-Setup)

```powershell
# Testdatei erstellen
echo "Windows online - $(Get-Date)" > WINDOWS-READY.txt

# Inhalt prüfen
cat WINDOWS-READY.txt
```

**Erwartung:**
```
Windows online - 07/24/2026 14:30:00
```

**Status:** ✅ Testdatei erstellt

---

## 📤 Schritt 7: Committen & Pushen

```powershell
# Datei zum Staging hinzufügen
git add WINDOWS-READY.txt

# Status prüfen
git status

# Committen
git commit -m "Windows-Setup abgeschlossen - 2026-07-24"

# Pushen zu GitHub
git push origin main
```

**Erwartung:**
```
[main <commit-id>] Windows-Setup abgeschlossen - 2026-07-24
 1 file changed, 1 insertion(+)
```

**Status:** ✅ Gepusht zu GitHub

---

## 🔄 Schritt 8: Finale Verifikation

```powershell
# Log anzeigen (letzte 3 Commits)
git log --oneline -3

# Branch-Status
git branch -a

# Lokale Struktur prüfen
ls -la
dir
```

**Erwartung:**
```
Neuester Commit: Windows-Setup abgeschlossen - 2026-07-24
Branch: main (in Sync mit origin/main)
Ordner: src/, docs/, logs/, tools/, data/, .git/ vorhanden
```

**Status:** ✅ Verifikation erfolgreich

---

## 🎨 Optional: VS Code Integration

Falls VS Code vorhanden:

```powershell
# Im RennsteigFINANZ-Verzeichnis:
code .

# Oder später:
cd C:\dev\projects\RennsteigFINANZ
code .
```

**Dann in VS Code:**
- [ ] Extension installieren: `mechatroner.rainbow-csv` (für CSV-Dateien)
- [ ] Terminal öffnen: PowerShell oder Git Bash
- [ ] `docs/TOPOLOGIE-ZENTRALE-ABLAGE.md` öffnen und lesen

**Status:** ✅ Optional

---

## 📋 Post-Setup-Dokumentation

Nach Abschluss bitte ausfüllen:

**Datum:** _______________  
**Benutzer:** _______________  
**Hostname/Computername:** _______________  
**Windows-Version:** _______________  
**Git-Version:** _______________  
**Probleme/Besonderheiten:** 
```
(hier notieren, falls etwas abweicht)
```

**Commit-ID (Windows-Setup):** _______________  

**Status:** ✅ Abgeschlossen / ❌ Mit Fehlern (beschreiben)

---

## 🆘 Troubleshooting

### Problem: `git clone` schlägt fehl (Authentifizierung)
**Lösung:**
- GitHub-Personal-Access-Token verwenden (falls 2FA aktiv)
- Oder SSH-Key hinterlegen
- Alternative: `https://` URLs mit Credentials cachen

### Problem: PowerShell verweigert Git-Befehle
**Lösung:**
```powershell
# Git Bash starten (wird mit Git installiert)
# Oder: Execution Policy temporär ändern
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
```

### Problem: `git push` schlägt fehl (Permission denied)
**Lösung:**
- SSH-Key prüfen (`ssh -T git@github.com`)
- Personal-Access-Token verwenden (Settings → Developer → Tokens)

---

## ✅ Erfolgskriterien (Definition of Done)

- [ ] `C:\dev\projects\RennsteigFINANZ\` existiert mit Git
- [ ] `git pull origin main` erfolgreich
- [ ] Lokale Struktur (src/, docs/, logs/, tools/, data/) vorhanden
- [ ] `git log` zeigt neue Windows-Setup-Commits
- [ ] GitHub hat die Commits erhalten (`git push` erfolgreich)
- [ ] Checkliste ausgefüllt & dokumentiert
- [ ] Keine lokalen Änderungen mehr (`git status` = clean)

---

## 🎓 Nächste Schritte nach Windows-Setup

1. **Mac-Seite:** `git pull origin main` um Windows-Commits zu holen
2. **Untitled (falls gebraucht):** Backup aktualisieren mit neuem Windows-Stand
3. **Fachkonkretisierung:** Rollen- und Zugriffsrechte v0.1 abhängig von Windows-Bestätigung

---

**Anleitung erstellt:** 2026-07-23  
**Gültig für Session:** 2026-07-24  
**Status:** Bereit zum Einsatz

