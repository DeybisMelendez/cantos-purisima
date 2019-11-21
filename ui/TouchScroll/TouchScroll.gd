extends VBoxContainer
export var weight = 0.1
export var vertical_scroll = true
export var horizontal_scroll = false
onready var initial_position = rect_position
var distance = 0.0
var extra_distance = 0.0

var position = Vector2.ZERO
var is_pressed = false
var mouse_pressed_pos = Vector2.ZERO


func _input(event):
	if event is InputEventMouseButton:
		print("IS EVENT MOUSE BUTTON")
		if event.is_pressed():
			mouse_pressed_pos = event.position
			position = rect_position
			is_pressed = true
		else:
			is_pressed = false
			extra_distance = distance * 2

func _physics_process(delta):
	if is_pressed:
		distance = get_global_mouse_position().y - mouse_pressed_pos.y
		rect_position.y = position.y + distance
	else:
		rect_position.y = lerp(rect_position.y, position.y + extra_distance, weight)
	rect_position.y = clamp(rect_position.y, -(rect_size.y - get_viewport_rect().size.y), initial_position.y)