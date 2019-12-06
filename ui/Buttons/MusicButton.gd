extends HBoxContainer

onready var song = load("res://songs/" + Transition.actual_song + ".ogg")

var state = "paused"
var total_time = 0.0
var time = 0.0
var new_time = 0.0
func _ready():
	$Button.connect("button_up", self, "button_up")
	$AudioStreamPlayer.stream = song
	total_time = song.get_length()
	$TotalTime.text = seconds2time(total_time)

func button_up():
	match state:
		"paused":
			play(time)
		"playing":
			pause()

func play(t):
	state = "playing"
	$Button.text = "Pausar"
	$AudioStreamPlayer.play(t)

func pause():
	state = "paused"
	$Button.text = "Reproducir"
	$AudioStreamPlayer.stop()

func seconds2time(t):
	var mins = floor(t/60)
	var secs = floor(t - mins*60)
	var result = ""
	if mins < 10:
		result = "0"
	if secs < 10:
		result += str(mins) + ":0" + str(secs)
	else:
		result += str(mins) + ":" + str(secs)
	return result

func update_time():
	var percent = time/total_time * 100
	$ProgressBar.value = percent
	$Time.text = seconds2time(time)

func _physics_process(delta):
	match state:
		"setting_time":
			var bar_x = $ProgressBar.rect_global_position.x
			var bar_width = $ProgressBar.rect_size.x# * $ProgressBar.value/100
			var mouse_x = get_global_mouse_position().x
			time = (mouse_x - bar_x)/bar_width * total_time
			time = clamp(time, 0, total_time)
		"playing":
			time = $AudioStreamPlayer.get_playback_position()
	update_time()

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			var bar_pos = $ProgressBar.rect_global_position
			var bar_size = $ProgressBar.rect_size
			var mouse_pos = get_global_mouse_position()
			if mouse_pos.y > bar_pos.y and mouse_pos.y < bar_pos.y + bar_size.y:
				if mouse_pos.x > bar_pos.x and mouse_pos.x < bar_pos.x + bar_size.x:
						state = "setting_time"
		elif state == "setting_time":
			play(time)
			print("hotdog")