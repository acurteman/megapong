extends Node

var otherPlayerIds = []

func addPlayer(id):
	otherPlayerIds.append(id)

func getPlayer(index):
	return otherPlayerIds[index]
