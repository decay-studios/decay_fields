extends Control

@export var scene_2 : PackedScene
@export var scene_3 : PackedScene
@onready var video_player = $dfintro/AspectRatioContainer/VideoStreamPlayer
@onready var intro_node = $dfintro
@onready var music_player = $AudioStreamPlayer2D

func _ready() -> void:
	if music_player:
		music_player.volume_db = -80.0
	
	if video_player:
		get_tree().create_timer(4.2).timeout.connect(_on_intro_video_finished)
	else:
		push_error("Error: VideoPlayer not found. Please contact the developers.")

func _on_intro_video_finished() -> void:
	var fade_overlay = $dfintro/dfintro_fade
	
	if fade_overlay and intro_node:
		fade_overlay.visible = true
		fade_overlay.modulate.a = 1.0
		
		if video_player:
			video_player.stop()
			video_player.visible = false
		
		var tween = create_tween()
		tween.tween_property(fade_overlay, "modulate:a", 0.0, 1.2)
		
		if music_player:
			var music_tween = create_tween()
			music_tween.tween_property(music_player, "volume_db", 0.0, 1.2)
		
		tween.finished.connect(func():
			intro_node.queue_free()
		)

func _on_npc_test_pressed() -> void:
	if scene_2:
		get_tree().change_scene_to_packed(scene_2)

func _on_house_map_pressed() -> void:
	if scene_3:
		get_tree().change_scene_to_packed(scene_3)

func _on_laden_pressed() -> void:
	var saved_data = SaveSystem.load_game()
	Global.geladene_position = saved_data["player_position"]
	Global.hat_position = true
	get_tree().change_scene_to_file(saved_data["current_scene"])


func _on_quit_pressed() -> void:
	get_tree().quit()
