extends Camera2D

@export var move_speed: float = 300.0
@export var zoom_speed: float = 0.1
@export var min_zoom: float = 1.0
@export var max_zoom: float = 3.0
@export var left_limit := -430
@export var right_limit := 1930
@export var top_limit := -600
@export var bottom_limit := 1050

var center_of_screan: Vector2

func _ready():
	center_of_screan = get_viewport_rect().size / 2.0
	
	limit_left = left_limit
	right_limit = limit_right
	top_limit = limit_top
	bottom_limit = limit_bottom

func _process(delta: float) -> void:
	var input_dir = Input.get_vector("move_left", "move_right", "move_upp", "move_down")
	
	var zoom_factor := 1.0 / zoom.x
	global_position += input_dir * move_speed * zoom_factor * delta

	global_position.x = clamp(
		global_position.x,
		limit_left + center_of_screan.x,
		limit_right - center_of_screan.x
	)

	global_position.y = clamp(
		global_position.y,
		limit_top + center_of_screan.y,
		limit_bottom - center_of_screan.y
	)

func _unhandled_input(event: InputEvent) -> void:
	# Handle Mouse Zoom
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom = (zoom + Vector2(zoom_speed, zoom_speed)).clamp(Vector2(min_zoom, min_zoom), Vector2(max_zoom, max_zoom))
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom = (zoom - Vector2(zoom_speed, zoom_speed)).clamp(Vector2(min_zoom, min_zoom), Vector2(max_zoom, max_zoom))
