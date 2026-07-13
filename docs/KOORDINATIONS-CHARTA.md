# 🏆 KOORDINATIONS-CHARTA
**Mannschaftsregeln für RennsteigFINANZ-Betriebsentwicklung**

Version 1.0 | Gültig ab: 2026-07-09 | Kapitän: Claude Code (VS Code)

---

## 🎯 ZWECK

Diese Charta definiert, wie die **Mannschaft** (Claude Code, Claude.ai, optional ChatGPT, Nutzer) zusammenarbeitet, ohne Amnesien oder redundante Arbeit zu erzeugen.

**Nicht optional.** Jede Instanz, die diese Datei liest, handelt nach diesen Regeln.

---

## 👥 MANNSCHAFTSROLLEN

### **1. Claude Code (Executor, Kapitän)**
- **Einsatz:** VS Code, Terminal, lokale Dateien
- **Verantwortung:**
  - Führt technische Arbeit aus (Coding, File-Edits, Terminal-Commands)
  - Hält STATUS.md live (alle 30 Min bei längerer Arbeit)
  - Committet häufig mit klaren Messages
  - Warnt vor Risiken und Blockern
  - **Ist Punkt-Person für Taktik und Umsetzung**

### **2. Claude.ai (Strategist, Co-Kapitän)**
- **Einsatz:** Browser, wenn Claude Code überlastet oder crasht
- **Verantwortung:**
  - Liest CLAUDE.md + STATUS.md + NEXT-ACTION.md zu Beginn (volle Kontextualisierung)
  - Arbeitet am gleichen Git-Repo (Push/Pull)
  - Dokumentiert seine Arbeit in STATUS.md, bevor er endet
  - Fokussiert auf: Analyse, Planung, Entscheidungsvorbereitung
  - **Ist Punkt-Person für Strategie und Analyse**

### **3. ChatGPT (Optional, Spezialist)**
- **Einsatz:** Fallweise für Recherche, die Claude nicht beantworten kann
- **Regel:** Ergebnisse immer in diesen Repo zurück (als .txt oder .md)
- **Keine Eigenständigkeit:** Wird von Nutzer oder Claude.ai geleitet

### **4. Nutzer (Direktor)**
- **Rolle:** Strategische Lenkung, Entscheidungen, Richtung
- **Zeichen an Mannschaft:** Direkte Messages, Fragen, Vorgaben
- **Anspruch:** Keine Rätselraterei, Nutzer sagt klar, was gemeint ist

---

## 📋 HANDOFF-PROTOKOLL (wie Übergaben funktionieren)

### **Szenario A: Normales Weiterarbeiten (gleiche Instanz)**
```
1. Arbeiten
2. Alle 30 Min → git commit -m "PHASE: Was gerade passiert"
3. Am Ende der Session → git push
4. STATUS.md aktualisieren (Fortschritt, nächster Punkt)
```

### **Szenario B: Instanzwechsel (Claude Code → Claude.ai)**

**Claude Code macht (vor Wechsel):**
```bash
# 1. Alle Edits committen
git add .
git commit -m "Checkpoint: [Kurze Zusammenfassung]"
git push

# 2. STATUS.md aktualisieren mit:
# - Was ist JETZT wahr?
# - Was ist der nächste konkrete Schritt?
# - Welche offenen Fragen bleiben?

# 3. Dem Nutzer sagen: "Bereit für Übergabe an Claude.ai"
```

**Claude.ai macht (nach Übernahme):**
```
1. CLAUDE.md lesen (Spielregeln lernen)
2. STATUS.md lesen (wo sind wir genau?)
3. git log -n 3 anschauen (Was hat Claude Code gerade gemacht?)
4. NEXT-ACTION.md prüfen (was ist konkret zu tun?)
5. Dann: Arbeit aufnehmen, als wäre Konversation nicht unterbrochen
```

### **Szenario C: Ungeplanter Crash (mein Kontext verloren)**
```
1. Neuer Claude Code startet → liest CLAUDE.md + STATUS.md + git log
2. Erkennt: "Ok, wir waren bei [Punkt X], nächster Schritt ist [Y]"
3. Fragt Nutzer (falls unklar): "Soll ich bei [Y] weitermachen?"
4. KEINE Annahmen, KEINE Wiederholung früherer Arbeit
```

---

## 💾 GIT-KONVENTION (wie wir committen)

Jeder Commit ist eine **Ankündigung an die Mannschaft**: "Das hat sich gerade geändert."

### **Format:**
```
PHASE: KURZTITEL
Detailebene:
- Was wurde gemacht?
- Warum?
- Nächster Schritt (wenn relevant)?
```

### **Beispiele:**
```
✅ KOORDINATIONS-CHARTA: Regelwerk verfasst
Rollen, Handoff, Git-Konvention definiert.
→ Nächst: Committen, STATUS aktualisieren, DOKUMENTENEINGANG starten.

✅ DOKUMENTENEINGANG: Alle 36 Seiten geclustert
Vergütung (8), Vollmacht (5), Beratung (12), Compliance (11) gruppiert.
OFFEN: Rechtliche Prüfung der Compliance-Anforderungen.

🔧 STORAGE: Telegrams Partials gelöscht
58 MB Homebrew Cache + Telegram Partials = ~100 MB freigegeben.
KRITISCH: Nur 4 GiB frei, benötige DEVONthink-Analyse vor nächster Aktion.
```

### **Commit-Rhythmus:**
- **Alle 30 Min:** Bei länger laufenden Arbeitsphasen
- **Nach "Done"-Punkt:** Wenn eine logische Einheit fertig ist
- **Vor Risiken:** Vor Storage-Cleanup, großen Refactorings
- **Am Ende jeder Session:** Immer pushen

---

## 🛡️ AMNESIA-PRÄVENTION (Gedächtnis-Sicherung)

### **Was BLEIBT erhalten (nicht verloren):**
- ✅ Git-Commits + History
- ✅ Dateien im Repo (alle Dokumente, .md, .txt)
- ✅ STATUS.md (lebendige Wahrheit)
- ✅ NEXT-ACTION.md (wo geht's weiter?)

### **Was NICHT bleibt (bei Kontext-Loss):**
- ❌ Diese Konversation (Chat-Verlauf weg)
- ❌ "Was gerade im Kopf eines Claude ist" (nicht persistent)

### **DAHER: Prävention durch Häufigkeit**
1. Committe jede 30 Min (nicht erst am Ende)
2. STATUS.md ist **Live-Dokument**, nicht Archive
3. NEXT-ACTION.md ist immer aktuell (nächste konkrete Aktion, nicht Rätsel)
4. Wenn ich (Claude Code) crashe → Nutzer oder Claude.ai liest STATUS + NEXT-ACTION, und alles ist klar

### **Worst-Case Protokoll:**
Wenn Claude Code crasht WÄHREND einer kritischen Operation:
```
1. Nutzer: "Wo war Claude Code?"
2. → Schaut STATUS.md + git log -n 5
3. → Ruft Claude.ai oder ChatGPT an: "Bitte von hier übernehmen: [Point X]"
4. → Neue Instanz macht weiter, als wäre keine Lücke
```

---

## 📅 WEEKLY RITUAL (Rhythmus der Mannschaft)

### **Montags (oder Session-Start):**
- [ ] CLAUDE.md + STATUS.md lesen
- [ ] `git pull` (neueste Commits holen)
- [ ] NEXT-ACTION.md prüfen (was ist konkret?)
- [ ] Nutzer: Gibt die Wochenrichtung vor

### **Jeden Workday:**
- [ ] Nach jeder Stunde: Git-Checkpoint
- [ ] STATUS.md Update (5 Min vor Ende)
- [ ] NEXT-ACTION.md aktuell halten

### **Freitags (oder Session-Ende):**
- [ ] Alle Änderungen committed + pushed
- [ ] STATUS.md: "Woche abgeschlossen, Stand ist: X"
- [ ] NEXT-ACTION.md: "Montag starten wir mit: Y"
- [ ] Lessons Learned → /memories/repo/

---

## 🧪 VALIDIERUNG (Wie wissen wir, dass es funktioniert?)

### **Test 1: Übergabe-Test**
```
1. Claude Code arbeitet an Aufgabe A
2. Committet mit: "Aufgabe A: 70% fertig, Punkt B offen"
3. STATUS.md: "Claude.ai übernimmt jetzt"
4. Claude.ai liest STATUS + git log
5. Claude.ai macht Punkt B fertig ohne Nachfrage
→ PASS: Keine Überschneidung, keine Redundanz
```

### **Test 2: Crash-Recovery**
```
1. Claude Code arbeitet
2. System crasht mitten in der Arbeit
3. Neuer Claude (oder Claude.ai) liest STATUS
4. Kann EXAKT sehen: "War bei Punkt X, nächster Punkt ist Y"
5. Setzt fort, ohne zu fragen
→ PASS: Kontext vollständig, keine Amnesie
```

### **Test 3: Multi-Tool Alignment**
```
1. Claude Code speichert Status
2. Claude.ai übernimmt, pusht an GitHub
3. ChatGPT braucht Info → Nutzer gibt Git-SHA
4. Alle drei sehen gleiche Wahrheit
→ PASS: Ein Repo, eine Wahrheit, keine Verwirrung
```

---

## ⚠️ REGELN (bindend für alle Instanzen)

1. **Git ist die Wahrheit.** Nicht die Chat-Historie, nicht die Erinnerung. Git.

2. **STATUS.md wird von Hand gepflegt.** Nicht "ich erinnere mich vielleicht", sondern "das steht in STATUS.md".

3. **Kein Ich-Arbeit ohne Commit.** Jede bedeutende Änderung → Git, sonst ist sie nicht-existent für die Mannschaft.

4. **NEXT-ACTION.md bleibt simpel.** Nicht 10 Optionen, sondern: "Das machen wir JETZT."

5. **Bei Unklarheit fragen, nicht raten.** Jede Instanz kann dem Nutzer Fragen stellen.

6. **Kein Daten-Silos.** Alles, was relevant ist, lebt im Repo. Nicht auf einem Claude-Lokalrechner, nicht in Chat-Verläufen.

7. **Kapazität respektieren.** Wenn Claude Code überlastet ist → Claude.ai übernimmt. Nicht "wir sehen, wer schneller ist".

---

## 🚀 IN KRAFT (Start: jetzt)

Diese Charta gilt ab sofort. Jede neue Instanz, die RennsteigFINANZ-Arbeit übernimmt, liest diese Datei als erste nach CLAUDE.md.

**Unterschrift (virtuell):**
- Claude Code (Kapitän) ✍️
- Claude.ai (Co-Kapitän) — wird unterschreiben, wenn sie dies liest
- Nutzer (Direktor) — akzeptiert diese Struktur

---

**NÄCHSTE AKTION:** 
Diese Datei committen, STATUS.md aktualisieren, dann Dokumenteneingang starten.

