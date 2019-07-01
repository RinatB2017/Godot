extends KinematicBody2D

const SPEED = 100
const GRAVITY = 10
const JUMP = 200
const VTOP = Vector2(0, -1)

var vel = Vector2()

func _physics_process(delta):
#	check_input()
	if Input.is_action_pressed("ui_left"):
		vel.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		vel.x = SPEED
	else:
		vel.x = 0
	
	vel.y += GRAVITY
	
	if is_on_floor() && Input.is_action_pressed("ui_up"):
		vel.y = -JUMP

	vel = move_and_slide(vel, VTOP)
