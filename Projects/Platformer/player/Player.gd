extends KinematicBody2D

const SPEED = 200
const GRAVITY = 10
const JUMP = 500
const VTOP = Vector2(0, -1)

var dir = 1

var Bullet = preload("res://bullet/Bullet.tscn" )

var vel = Vector2()
var flag_on_floor = false

func is_player():
	pass

func shoot():
	var bul = Bullet.instance()
	get_node("../").add_child(bul)

	if dir > 0:
		bul.position = position + Vector2(50, 0)
		bul.apply_impulse(Vector2(), Vector2(800, 0))
	else:
		bul.position = position + Vector2(-50, 0)
		bul.apply_impulse(Vector2(), Vector2(-800, 0))
		

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
#	check_input()
	if Input.is_action_pressed("ui_left"):
		dir = -1
		vel.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		dir = 1
		vel.x = SPEED
	else:
		vel.x = 0
	
	vel.y += GRAVITY
	
	flag_on_floor = is_on_floor()
	
	if is_on_floor() && Input.is_action_pressed("ui_up"):
		vel.y = -JUMP

	vel = move_and_slide(vel, VTOP)
