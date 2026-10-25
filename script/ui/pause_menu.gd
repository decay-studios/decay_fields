extends Control

@onready var visibilty = $PauseMenu/Visibility
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ESC"):
		if visibilty.is_visible_in_tree():
			visibilty.hide()
		else:
			visibilty.show()


func _on_continue_pressed() -> void:
	visibilty.hide()


func _on_quit_pressed() -> void:
	save()
	get_tree().quit()


func _on_game_menu_pressed() -> void:
	save()
	get_tree().change_scene_to_file("res://scenes/ui/start.tscn")
	
func save() -> void:
	var scene_path = get_tree().current_scene.scene_file_path
	var player_pos = %Player.global_position
	SaveSystem.save_game(scene_path, player_pos)
