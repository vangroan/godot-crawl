# res://player/Faovi.gd

extends KinematicBody2D

# Movement speed per second
export(float) var speed = 200.0
export(Vector2) var velocity = Vector2(0.0, 0.0)


func _ready():
	pass


func _process(_delta: float):
	pass


func _physics_process(_delta: float):
	
	if Input.is_action_pressed('player_move_up'):
		velocity.y = -speed
	elif Input.is_action_pressed('player_move_down'):
		velocity.y = speed
	else:
		velocity.y = 0.0
	
	if Input.is_action_pressed('player_move_left'):
		velocity.x = -speed
	elif Input.is_action_pressed('player_move_right'):
		velocity.x = speed
	else:
		velocity.x = 0.0
	
	if velocity == Vector2.ZERO:
		$AnimationPlayer.play("idle-right")
	else:
		$AnimationPlayer.play("walk-right")
	
	# Don't flip on standing still
	if velocity.x < 0.0:
		$Sprite.flip_h = true
	elif velocity.x > 0.0:
		$Sprite.flip_h = false
	
	# Move already takes delta time into account
	var _new_velocity = move_and_slide(velocity)

