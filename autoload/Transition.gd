extends CanvasLayer

var actual_song = "ADIOS, REINA DEL CIELO"
func change_scene(scene):
	$CanvasLayer/AnimationPlayer.play("in")
	yield($CanvasLayer/AnimationPlayer, "animation_finished")
	get_tree().change_scene(scene)
	$CanvasLayer/AnimationPlayer.play("out")
