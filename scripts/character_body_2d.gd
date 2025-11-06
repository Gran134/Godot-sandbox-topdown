extends CharacterBody2D

var max_speed = 250
var last_direction := Vector2(1,0)

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_upp", "move_down")
	velocity = direction * max_speed
	move_and_slide()
	
	if direction.length() > 0:
		last_direction = direction
