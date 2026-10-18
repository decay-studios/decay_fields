extends SceneTree

func _init() -> void:
	var paths := [
		"res://scenes/world/maps/map_world_monpok.res",
		"res://scenes/world/maps/map_house_start.res",
		"res://scenes/ui/start.tscn",
	]
	for p in paths:
		var id := ResourceLoader.get_resource_uid(p)
		var txt := ResourceUID.id_to_text(id) if id != -1 else "(no uid)"
		print(p, " -> ", txt, "  (id=", id, ")")
	quit(0)
