extends KinematicBody2D

const SPEED = 200
const GRAVITY = 20
const JUMP = 700
const VTOP = Vector2(0, -1)

var energy = 100
var dir = 1

var Bullet = preload("res://bullet/bullet.tscn" )

var velocity = Vector2()
var speed = 1000

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
		
func is_player():
	pass
		
func get_damage(damage):
	energy -= damage
	if energy <= 0:
		print("FAIL")
		queue_free()
		
func move_left():
	#print("left")
	dir = -1
	velocity.x = -SPEED
		
func move_right():
	#print("right")
	dir = 1
	velocity.x = SPEED
	
func move_stop():
	velocity.x = 0
	
func jump():
	if is_on_floor():
		#print("jump")
		velocity.y = -JUMP

func _input(event):
	if event.is_action_pressed("ui_left"):
		#print("down")
		move_left()

	elif event.is_action_released("ui_left"):
		#print("release")
		velocity.x = 0

	if event.is_action_pressed("ui_right"):
		#print("down")
		move_right()

	elif event.is_action_released("ui_right"):
		#print("release")
		velocity.x = 0
		
func _physics_process(delta):
	
#	for body in $Area2D.get_overlapping_bodies():
#		if body.get_name() != "Player":
#			print(body.get_name())
	
	#get_node("../CanvasLayer/EnergyBar").set_value(energy)
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
#	check_input()
#	if Input.is_action_pressed("ui_left"):
#		move_left()
#	elif Input.is_action_pressed("ui_right"):
#		move_right()
#	else:
#		velocity.x = 0

	
	velocity.y += GRAVITY
	
	if is_on_floor() && Input.is_action_pressed("ui_up"):
		jump()

	velocity = move_and_slide(velocity, VTOP)
	#velocity = velocity.normalized() * speed
	#var collision = move_and_collide(velocity * delta)
