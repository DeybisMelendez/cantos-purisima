extends Button
export var link = ""
func _ready():
	connect("button_up", self, "button_up")

func button_up():
	OS.shell_open(link)