extends Control

var where_am_i = "res://scenes/mane_menu.tscn"

func back() -> void:
	get_tree().change_scene_to_file(where_am_i)
