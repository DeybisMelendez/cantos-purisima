extends Control

func _ready():
	$VBoxContainer/Paypal.connect("button_up", self ,"paypal")

func paypal():
	OS.shell_open("")