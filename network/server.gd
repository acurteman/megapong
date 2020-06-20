extends Node

var SERVER_PORT = 1234
var MAX_PLAYERS = 2

func start_server(port,max_players):
	SERVER_PORT = port
	MAX_PLAYERS = max_players
	
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().network_peer = peer
