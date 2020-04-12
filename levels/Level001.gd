# res://levels/Level001.gd

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Spawn Player
	var spawner = find_node("PlayerSpawn")
	if spawner:
		spawner.spawn_player()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
