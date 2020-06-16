extends Node2D

func _ready():
	$quitButton.visible = false

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		$quitButton.visible = true
		
func _on_quitButton_pressed():
	get_tree().quit()
