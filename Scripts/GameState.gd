extends Node

var last_positions := {}  # { "Centro.tscn": Vector2(100, 200) }

var diary_entries: Array = []

func add_diary_entry(entry: String):
	if not entry in diary_entries:
		diary_entries.append(entry)

func save_player_position(scene_name: String, position: Vector2):
	last_positions[scene_name] = position

func get_saved_position(scene_name: String) -> Vector2:
	return last_positions.get(scene_name, Vector2.ZERO)
