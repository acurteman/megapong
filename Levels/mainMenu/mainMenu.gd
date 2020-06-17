extends Control

var grow = true
var start_scale = Vector2(1,1)
export var grow_scale = Vector2(1.25,1.25)
export var grow_lerp = .1

func _ready():
	pass

func _process(delta):
	pass

func _on_exitButton_pressed():
	get_tree().quit()


func _on_singlePlayer_pressed():
	get_tree().change_scene("res://Levels/Arena/Arena.tscn")
