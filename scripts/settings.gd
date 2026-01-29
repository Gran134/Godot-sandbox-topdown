extends Control


func back() -> void:
	get_tree().change_scene_to_file(Global.where_am_i)
	
func _process(_delta: float) -> void:
	if get_tree().current_scene.name == "res://scenes/main_menu.tscn":
		Global.where_am_i = "res://scenes/main_menu.tscn"
	elif get_tree().current_scene.name == "res://scenes/background.tscn":
		Global.where_am_i = "res://scenes/background.tscn"
