extends VBoxContainer

export var horizontal_scroll = false
export var vertical_scroll = true
export var force = 10
export var weight = 0.1
onready var origin_position = rect_position
var is_pressed = false
var pressed_position = Vector2.ZERO
var position = Vector2.ZERO
var distance = Vector2.ZERO
var mouse_position = Vector2.ZERO
var last_mouse_speed = Vector2.ZERO

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			is_pressed = true
			pressed_position = event.position
			position = rect_position
			last_mouse_speed = get_local_mouse_position()
		else: 
			is_pressed = false
			last_mouse_speed = (get_local_mouse_position() - last_mouse_speed) * force

func _physics_process(delta):
	if is_pressed:
		var mouse_position = get_global_mouse_position()
		distance = mouse_position - pressed_position
		if horizontal_scroll:
			rect_position.x = position.x + distance.x
		if vertical_scroll:
			rect_position.y = position.y + distance.y
	else:
		if horizontal_scroll:
			rect_position.x = lerp(rect_position.x, position.x + last_mouse_speed.x, weight)
		if vertical_scroll:
			rect_position.y = lerp(rect_position.y, position.y + distance.y + last_mouse_speed.y, weight)
	rect_position.x = clamp(rect_position.x, get_parent().rect_position.x + get_parent().rect_size.x - rect_size.x, origin_position.x)
	rect_position.y = clamp(rect_position.y, get_parent().rect_position.y + get_parent().rect_size.y - rect_size.y, origin_position.y)