extends Control




func start() -> void:
	get_tree().change_scene_to_file("res://scenes/background.tscn")

func settings() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
func quit() -> void:
	get_tree().quit()
