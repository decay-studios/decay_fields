extends Node

const SAVE_PATH = "user://savegame.cfg"

# Funktion zum Speichern des gesamten Spielstands
func save_game(scene_path: String, player_position: Vector2):
	var config = ConfigFile.new()
	
	# Szene und Position speichern
	config.set_value("World", "current_scene", scene_path)
	config.set_value("World", "player_position", player_position)
	
	var error = config.save(SAVE_PATH)
	if error == OK:
		print("Fortschritt erfolgreich gespeichert!")
	else:
		print("Fehler beim Speichern: ", error)

# Funktion zum Laden des gesamten Spielstands
func load_game() -> Dictionary:
	var config = ConfigFile.new()
	var error = config.load(SAVE_PATH)
	
	# Standardwerte, falls kein Speicherstand existiert (z. B. beim ersten Spielstart)
	var default_data = {
		"current_scene": "res://scenes/world/maps/map_house_start.res",
		"player_position": Vector2(100, 100),       # Startposition im Spiel
	}
	
	if error != OK:
		print("Kein Spielstand gefunden. Lade Standardwerte.")
		return default_data
	
	# Werte auslesen (mit Sicherheits-Standardwerten, falls mal ein Wert in der Datei fehlt)
	var loaded_data = {}
	loaded_data["current_scene"] = config.get_value("World", "current_scene", default_data["current_scene"])
	loaded_data["player_position"] = config.get_value("World", "player_position", default_data["player_position"])
	
	return loaded_data
