extends Button
export var scene = ""
func _ready():
	connect("button_up", self, "button_up")

func button_up():
	Back.push(scene)