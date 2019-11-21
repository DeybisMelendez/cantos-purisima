extends Control

func _ready():
	$VBoxContainer/Title.text = Transition.actual_song
	var file = File.new()
	file.open("res://lyrics/" + Transition.actual_song + ".txt", File.READ)
	$VBoxContainer/Lyrics.text = file.get_as_text()
	file.close()