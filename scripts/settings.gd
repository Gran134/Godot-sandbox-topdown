extends Control
	
	


func Continue() -> void:
	get_tree().change_scene_to_file(Global.where_am_i)


func Main_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func Quit() -> void:
	get_tree().quit()
