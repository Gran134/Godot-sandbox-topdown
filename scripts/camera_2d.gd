extends Camera2D

@export var move_speed: float = 100.0
@export var zoom_speed: float = 0.1
@export var min_zoom: float = 1.0
@export var max_zoom: float = 3.0
@export var left_limit := -430
@export var right_limit := 1930

func _ready():
	limit_left = left_limit
	right_limit = limit_right

func _process(delta: float) -> void:
	var input_dir = Input.get_vector("move_left", "move_right", "move_upp", "move_down")
	
	if global_position.x <= limit_left:
		print("YIPPIE")
	
	var zoom_factor := zoom.x
	global_position += input_dir * move_speed * zoom_factor * delta

	
func _unhandled_input(event: InputEvent) -> void:
	# Handle Mouse Zoom
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom = (zoom + Vector2(zoom_speed, zoom_speed)).clamp(Vector2(min_zoom, min_zoom), Vector2(max_zoom, max_zoom))
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom = (zoom - Vector2(zoom_speed, zoom_speed)).clamp(Vector2(min_zoom, min_zoom), Vector2(max_zoom, max_zoom))
