extends Node

const MAINMENU = "res://scenes/MainMenu/MainMenu.tscn"
var scenes = [MAINMENU]

#func _ready():
#	get_tree().set_auto_accept_quit(false)

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		pop()

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_cancel"):
			pop()

func pop():
	if scenes.size() > 1:
		scenes.pop_back()
		Transition.change_scene(scenes.back())
	else:
		get_tree().quit()

func push(scene):
	scenes.append(scene)
	Transition.change_scene(scene)