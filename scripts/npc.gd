extends npc_mevement

func _ready():
	random_generation()
	
func _on_timer_timeout() -> void:
	random_generation()
	$Timer.start()
