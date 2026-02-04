extends Control

func _process(_delta: float) -> void:
	if get_tree().current_scene.scene_file_path == "res://scenes/main_menu.tscn":
		Global.where_am_i = "res://scenes/main_menu.tscn"
	print(Global.where_am_i)



func start() -> void:
	get_tree().change_scene_to_file("res://scenes/background.tscn")

func settings() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func quit() -> void:
	get_tree().quit()
