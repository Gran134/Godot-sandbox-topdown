extends Camera2D

var base_zoom_speed = 0.1
var zoom_in_mult = 1.8
var zoom_out_mult = 1.6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	zoom = Vector2(4.0,4.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(_delta: float) -> void:
	var zoom_factor = 1.0 / zoom.x
	var zoom_speed = Vector2(base_zoom_speed * zoom_factor, base_zoom_speed * zoom_factor)

	
	if Input.is_action_just_released("scroll_inn"):
		zoom += zoom_speed * zoom_in_mult

	if Input.is_action_just_released("scroll_out"):
		zoom -= zoom_speed * zoom_out_mult
	
	zoom.x = clamp(zoom.x, 1.0,5.0)
	zoom.y = clamp(zoom.y, 1.0,5.0)
