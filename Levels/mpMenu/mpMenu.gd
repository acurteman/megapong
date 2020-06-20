extends Control

var SERVER_IP = "127.0.0.1"
var PORT = 6666
var MAX_PLAYERS = 2


func _ready():
	$title.visible = true
	$status.visible = false
	$connectButton.visible = false
	$serverIPLabel.visible = false
	$serverIPInput.visible = false
	$serverPortLabel.visible = false
	$serverPortInput.visible = false
	$hostPortLabel.visible = false
	$hostPortInput.visible = false
	$hostStartButton.visible = false
	
	get_tree().connect("network_peer_connected",self,"_player_connected")


func _player_connected(id):
	update_status("Player connected to server!")
	globals.otherPlayerId = id
	var game = preload("res://Levels/2pArena/2pArena.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()


func _on_hostButton_pressed():
	$title.visible = false
	$status.visible = true
	$hostPortLabel.visible = true
	$hostPortInput.visible = true
	$hostStartButton.visible = true
	


func _on_hostStartButton_pressed():
	var host = NetworkedMultiplayerENet.new()
	PORT = int($hostPortInput.text)
	var res = host.create_server(PORT, MAX_PLAYERS)
	if res != OK:
		update_status("Error creating server")
		return
	
	update_status("Hosting network on port: " + str(PORT))
	$joinButton.disabled = true
	$hostButton.disabled = true
	$hostStartButton.disabled = true
	get_tree().set_network_peer(host)


func _on_joinButton_pressed():
	$title.visible = false
	$status.visible = true
	$hostButton.disabled = true
	$joinButton.disabled = true
	
	$connectButton.visible = true
	$serverIPLabel.visible = true
	$serverIPInput.visible = true
	$serverPortLabel.visible = true
	$serverPortInput.visible = true


func _on_backButton_pressed():
	get_tree().change_scene("res://Levels/mainMenu/mainMenu.tscn")


func update_status(new_text):
	$status.text += str(new_text)


func _on_connectButton_pressed():
	update_status("joining network")
	var host = NetworkedMultiplayerENet.new()
	SERVER_IP = $serverIPInput.text
	PORT = int($serverPortInput.text)
	host.create_client(SERVER_IP, PORT)
	get_tree().set_network_peer(host)


