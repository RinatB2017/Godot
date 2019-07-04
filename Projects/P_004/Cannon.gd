extends KinematicBody2D

const SPEED = 100
var dir = Vector2()

var Bullet = preload("res://Bullet.tscn")
var timer = 0 
var dir_bullet = 1

func push():
	var bul = Bullet.instance()
	get_node("../").add_child(bul)

	bul.position = position + Vector2(50, 0)
	bul.apply_impulse(Vector2(), Vector2(800, 0))
	
	#смена напраления
#	dir_bullet *= -1
#	if dir_bullet > 0:
#		bul.position = position + Vector2(50, 0)
#		bul.apply_impulse(Vector2(), Vector2(800, 0))
#	else:
#		bul.position = position + Vector2(-50, 0)
#		bul.apply_impulse(Vector2(), Vector2(-800, 0))
	
func auto_gun(delta):
	timer += delta
	if timer > 1:
		timer = 0
		push()

func _physics_process(delta):
	# mouse push
	if Input.is_action_just_pressed("push"):
		push()
#	auto_gun(delta)

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
		dir.x *= SPEED
		move_and_slide(dir)

	if dir.y:
		dir.y *= SPEED
		move_and_slide(dir)
