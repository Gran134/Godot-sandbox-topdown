extends CharacterBody2D
class_name npc_mevement

var current_states: npc_states = npc_states.MOVERIGHT
enum npc_states{MOVERIGHT, MOVELEFT, MOVEUP, MOVEDOWN}

@export var speed = 10
var dir

func _physics_process(_delta: float) -> void:
	
	match current_states:
		npc_states.MOVERIGHT:
			move_right()
		npc_states.MOVELEFT:
			move_left()
		npc_states.MOVEUP:
			move_up()
		npc_states.MOVEDOWN:
			move_down()
	move_and_slide()

func random_generation():
	dir = randi() % 4
	random_direction()

func random_direction():
	match dir:
		0:
			current_states = npc_states.MOVERIGHT
		1:
			current_states = npc_states.MOVELEFT
		2:
			current_states = npc_states.MOVEUP
		3:
			current_states = npc_states.MOVEDOWN


func move_right():
	velocity = Vector2.RIGHT * speed
	if $anim.animation != "walk_right" && !is_on_wall():
		$anim.play("walk_right")
	if is_on_wall():
		velocity = Vector2.ZERO
		$anim.play("idle_right")
	
	
func move_left():
	velocity = Vector2.LEFT * speed
	if $anim.animation != "walk_left" && !is_on_wall():
		$anim.play("walk_left")
	if is_on_wall():
		velocity = Vector2.ZERO
		$anim.play("idle_left")

func move_down():
	velocity = Vector2.DOWN * speed
	if $anim.animation != "walk_down" && !is_on_wall():
		$anim.play("walk_down")
	if is_on_wall():
		velocity = Vector2.ZERO
		$anim.play("idle_down")

func move_up():
	velocity = Vector2.UP * speed
	if $anim.animation != "walk_up" && !is_on_wall():
		$anim.play("walk_up")
	if is_on_wall():
		velocity = Vector2.ZERO
		$anim.play("idle_up")
