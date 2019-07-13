extends KinematicBody2D

var Bullet = preload("res://bullet/Bullet.tscn")
var timer = 0 
const SPEED = 1000

func shoot():
	var bullet_0 = Bullet.instance()
	var bullet_1 = Bullet.instance()
	var bullet_2 = Bullet.instance()
	var bullet_3 = Bullet.instance()
	
	get_node("../").add_child(bullet_0)
	get_node("../").add_child(bullet_1)
	get_node("../").add_child(bullet_2)
	get_node("../").add_child(bullet_3)

	bullet_0.position = position + Vector2(50,  0)
	bullet_1.position = position + Vector2(0,   50)
	bullet_2.position = position + Vector2(-50, 0)
	bullet_3.position = position + Vector2(0,   -50)
	
	bullet_0.apply_impulse(Vector2(), Vector2(SPEED, 0))
	bullet_1.apply_impulse(Vector2(), Vector2(0, SPEED))
	bullet_2.apply_impulse(Vector2(), Vector2(-SPEED, 0))
	bullet_3.apply_impulse(Vector2(), Vector2(0, -SPEED))
	
func _physics_process(delta):
	timer += delta
	if timer > 0.1:
		timer = 0
		shoot()
