extends Button

onready var song = load("res://songs/" + Transition.actual_song + ".ogg")
var state = "stop"
func _ready():
	connect("button_up", self, "button_up")
	$AudioStreamPlayer.stream = song

func button_up():
	if state == "playing":
		$AudioStreamPlayer.stop()
		text = "Reproducir"
		state = "stop"
	else:
		$AudioStreamPlayer.play()
		text = "Detener"
		state = "playing"