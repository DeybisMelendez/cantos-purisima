extends Button

var LYRICS = "res://scenes/Lyrics/Lyrics.tscn"

func _ready():
	connect("button_up", self, "button_up")

func button_up():
	Transition.actual_song = text
	Transition.change_scene(LYRICS)