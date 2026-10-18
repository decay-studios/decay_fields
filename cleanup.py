import os

# Pfad zu deinem Projektordner
project_dir = r"C:\Users\Friedrich\Documents\Portfolio\GitHub\decay_fields"

# Alle Ersetzungen, die wir machen müssen
replacements = {
    "res://Assets/": "res://assets/",
    "res://Scenes/": "res://scenes/",
    "/Sprites/": "/sprites/",
    "/Fonts/": "/fonts/",
    "/Styles/": "/styles/"
}

print("Starte radikale Pfad-Bereinigung...")

for root, dirs, files in os.walk(project_dir):
    # Versteckte Git- und Godot-Ordner überspringen
    if ".git" in root or ".godot" in root:
        continue
        
    for file in files:
        if file.endswith(('.tscn', '.tres', '.gd')):
            file_path = os.path.join(root, file)
            
            # Datei einlesen
            with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
                content = f.read()
            
            # Ersetzungen durchführen
            new_content = content
            changed = False
            for old, new in replacements.items():
                if old in new_content:
                    new_content = new_content.replace(old, new)
                    changed = True
            
            # Wenn sich was geändert hat, hart auf die Festplatte schreiben
            if changed:
                with open(file_path, "w", encoding="utf-8") as f:
                    f.write(new_content)
                print(f"Erfolgreich korrigiert: {file}")

print("Fertig! Jede einzelne Datei wurde auf Festplatten-Ebene bereinigt.")
