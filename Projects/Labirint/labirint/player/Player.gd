extends KinematicBody2D

var SPEED = 10000
var dir = Vector2()

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	elif Input.is_action_pressed("ui_right"):
		dir.x = 1
	else:
		dir.x = 0
		
	if Input.is_action_pressed("ui_up"):
		dir.y = -1
	elif Input.is_action_pressed("ui_down"):
		dir.y = 1
	else:
		dir.y = 0
		
	if dir.x:
		dir.x *= SPEED * delta
		move_and_slide(dir)
		
	if dir.y:
		dir.y *= SPEED * delta
		move_and_slide(dir)