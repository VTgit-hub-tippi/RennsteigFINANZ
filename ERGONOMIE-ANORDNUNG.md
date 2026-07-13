# Ergonomische Fensteranordnung in VS Code

Ziel: links Navigation, Mitte Code, rechts Referenz/Chat, unten Terminal.

## Empfohlene Start-Anordnung

1. Explorer links sichtbar lassen.
2. Editor in der Mitte als Hauptflaeche nutzen.
3. Zweite Seitenleiste rechts aktivieren:
   - View -> Appearance -> Secondary Side Bar
4. Terminal unten andocken:
   - Terminal -> New Terminal
   - Falls noetig: View -> Appearance -> Panel Position -> Bottom
5. Fuer Parallelarbeit den Editor teilen:
   - View -> Editor Layout -> Two Columns

## Praktischer Arbeitsfluss

1. Links: Dateien/Struktur (Explorer)
2. Mitte links: aktive Implementierung
3. Mitte rechts: Referenzdatei, Log oder Diff
4. Rechts (Secondary Side Bar): Chat/Ergebnisansicht
5. Unten: Terminal fuer Tests und Skripte

## Schnellbefehle

- Command Palette: Cmd+Shift+P
- Terminal ein/aus: Ctrl+` 
- Editor teilen: Cmd+\\
- Seitenleiste ein/aus: Cmd+B

## Reset bei chaotischem Layout

1. Command Palette oeffnen.
2. "View: Reset View Locations" ausfuehren.
3. Danach die Start-Anordnung oben erneut setzen.
