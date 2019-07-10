extends KinematicBody2D

const SPEED = 200
const GRAVITY = 20
const JUMP = 700
const VTOP = Vector2(0, -1)

var energy = 100
var dir = 1

var Bullet = preload("res://bullet/Bullet.tscn" )

var vel = Vector2()

func shoot():
	var bul = Bullet.instance()
	get_node("../").add_child(bul)
	
	#bul.set_damage(150)

	if dir > 0:
		bul.position = position + Vector2(50, 0)
		bul.apply_impulse(Vector2(), Vector2(800, 0))
	else:
		bul.position = position + Vector2(-50, 0)
		bul.apply_impulse(Vector2(), Vector2(-800, 0))
		
func get_damage(damage):
	energy -= damage
	if energy <= 0:
		print("FAIL")
		queue_free()

func _physics_process(delta):
	get_node("../CanvasLayer/EnergyBar").set_value(energy)
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
	
	if is_on_floor() && Input.is_action_pressed("ui_up"):
		vel.y = -JUMP

	vel = move_and_slide(vel, VTOP)
	#move_and_collide(vel)
