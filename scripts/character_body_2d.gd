extends CharacterBody2D

var max_speed = 100
var last_direction := Vector2(1,0)
var base_zoom_speed = 0.1
var zoom_in_mult = 1.8
var zoom_out_mult = 1.6
@onready var camera = $Camera2D

func _ready() -> void:
	camera.zoom = Vector2(4.0,4.0)

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_upp", "move_down")
	
	velocity = direction * max_speed / $Camera2D.zoom * 3
	move_and_slide()
	
	if direction.length() > 0:
		last_direction = direction

func _process(_delta: float) -> void:
	var zoom_factor = 1.0 / camera.zoom.x
	var zoom_speed = Vector2(base_zoom_speed * zoom_factor, base_zoom_speed * zoom_factor)

	if Input.is_action_just_released("scroll_inn"):
		camera.zoom += zoom_speed * zoom_in_mult

	if Input.is_action_just_released("scroll_out"):
		camera.zoom -= zoom_speed * zoom_out_mult
	
	camera.zoom.x = clamp(camera.zoom.x, 1.0,5.0)
	camera.zoom.y = clamp(camera.zoom.y, 1.0,5.0)
