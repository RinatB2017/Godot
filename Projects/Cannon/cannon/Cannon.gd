extends KinematicBody2D

const SPEED = 100
const POWER_INC = 1
var power = 0
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
	
func show_power():
	if power < 0:
		power = 0
	if power > 100:
		power = 100
	get_node("../Energy").set_value(power)
	
func btn_up():
	power += POWER_INC

func btn_down():
	power -= POWER_INC

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
		
	get_node("../Beam").set_rotation(deg2rad(angle))
	show_power()
