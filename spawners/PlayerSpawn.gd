# res://spawners/PlyerSpawn.gd

extends StaticBody2D


# Player scene must be explicitly specified in editor.
export(PackedScene) var player_scene

onready var spawn_point = find_node('SpawnPoint')


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Spawns a new instance of the player node.
func spawn_player():
	if player_scene:
		var parent = get_parent()
		if parent:
			# player_scene.instance
			var node = player_scene.instance()
			node.global_position = spawn_point.global_position
			parent.add_child(node)
		else:
			push_error("Failed to spawn; spawner has no parent.")
	else:
		push_error("Player scene not set on spawner.")
