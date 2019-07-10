extends RigidBody2D

const SPEED = 200
const JUMP = 200

var vel = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shoot():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
#	check_input()
	if Input.is_action_pressed("ui_left"):
		vel.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		vel.x = SPEED
	else:
		vel.x = 0
		
	if Input.is_action_pressed("ui_up"):
		vel.y = -JUMP
	else:
		vel.y = 0
		
	set_axis_velocity(vel)
	