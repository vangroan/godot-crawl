# res://player/TrackingCamera.gd
#
# Camera that chases the player.
extends Camera2D


# Node to chase after
export(NodePath) var target = null


func _physics_process(_delta: float):
	if target:
		if target is Node2D:
			# TODO: replace snap with LERP follow
			global_position = target.global_position
