# res://spawners/PlyerSpawn.gd

extends StaticBody2D


# Player scene must be explicitly specified in editor.
export(PackedScene) var player_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Spawns a new instance of the player node.
func spawn_player():
	if player_scene:
		var parent = get_parent()
		if parent:
			var node = player_scene.instance()
			node.global_position = $SpawnPoint.global_position
			
			# Notify current camera of new player
			for sibling in parent.get_children():
				if sibling is preload("res://player/TrackingCamera.gd"):
					if sibling.current:
						sibling.target = node
			
			parent.add_child(node)
		else:
			push_error("Failed to spawn; spawner has no parent.")
	else:
		push_error("Player scene not set on spawner.")
