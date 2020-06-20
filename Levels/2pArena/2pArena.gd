extends Node2D

func _ready():
	$quitButton.visible = false
	
	# Loading local player
	var thisPlayer = preload("res://Game_Objects/networkPaddle/networkPaddle.tscn").instance()
	thisPlayer.set_name(str(get_tree().get_network_unique_id()))
	thisPlayer.set_network_master(get_tree().get_network_unique_id())
	add_child(thisPlayer)
	if get_tree().is_network_server():
		thisPlayer.position = $p1Spawn.position
	else:
		thisPlayer.position = $p2Spawn.position
	
	#Loading other player
	var otherPlayer = preload("res://Game_Objects/networkPaddle/networkPaddle.tscn").instance()
	otherPlayer.set_name(str(globals.otherPlayerID))
	otherPlayer.set_network_master(globals.otherPlayerID)
	add_child(otherPlayer)
	if get_tree().is_network_server():
		otherPlayer.position = $p2Spawn
	else:
		otherPlayer.position = $p1Spawn


func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		$quitButton.visible = true
		
func _on_quitButton_pressed():
	get_tree().quit()
