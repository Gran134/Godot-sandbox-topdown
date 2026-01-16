extends npc_mevement

func _ready():
	randomize()
	random_generation()
	
func _on_timer_timeout():
	random_generation()
