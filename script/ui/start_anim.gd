extends CanvasLayer
#
#@onready var transition_black: TextureRect = $transition_black
#
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	transition_black.visible=false
#	anim_play("res://scenes/start.tscn")
	
# Animation

#func anim_play(next_scene_path: String = "") -> void:
#	transition_black.modulate=Color(1, 1, 1, 1.0)
#	transition_black.visible=true
	
#	var anim_tween = create_tween().set_parallel(false)
#	anim_tween.tween_property(transition_black, "modulate:a", 0.0, 3.0)
	
#	await anim_tween.finished
#	transition_black.visible=false
	
	# old code (for start_anim), not needed anymore
	#if next_scene_path != "":
	#	get_tree().change_scene_to_file(next_scene_path)
