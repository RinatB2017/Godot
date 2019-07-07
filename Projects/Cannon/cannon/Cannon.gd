extends KinematicBody2D

const SPEED = 100
var dir = Vector2()

var Bullet = preload("res://bullet/Bullet.tscn")
var timer = 0 
var dir_bullet = 1
var angle = 0

func push():
	var bullet = Bullet.instance()
	get_node("../").add_child(bullet)

	bullet.position = position
	bullet.apply_impulse(Vector2(), Vector2(800, 0))
	
func btn_up():
	print("btn_up")

func btn_down():
	print("btn_down")

func btn_left():
	angle -= 1

func btn_right():
	angle += 1

func btn_fire():
	push()
	
func _physics_process(delta):
	if angle > 90:
		angle = 90
	if angle < 0:
		angle = 0
		
	$Beam.set_rotation(deg2rad(angle))
