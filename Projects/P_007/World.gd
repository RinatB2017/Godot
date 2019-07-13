extends Node2D

const SPEED = 200
var vel = Vector2()

func _physics_process(delta):
	

	if !$Cannon.get_viewport_rect().has_point($Cannon.position):
		print("Die")
		get_tree().change_scene("res://World.tscn")
	
	if Input.is_action_pressed("ui_left"):
		vel.x = -SPEED * delta
	elif Input.is_action_pressed("ui_right"):
		vel.x = SPEED * delta
	else:
		vel.x = 0
		
	if Input.is_action_pressed("ui_up"):
		vel.y = -SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		vel.y = SPEED * delta
	else:
		vel.y = 0
		
	$Cannon.move_and_collide(vel)