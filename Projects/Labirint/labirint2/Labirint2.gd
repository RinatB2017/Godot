extends Node2D

var velocity = Vector2()
var speed = 1000
var timer = 0;
var dir

func move_up():
	dir = "up"
	velocity.x = 0
	velocity.y = -1

func move_down():
	dir = "down"
	velocity.x = 0
	velocity.y = 1

func move_left():
	dir = "left"
	velocity.x = -1
	velocity.y = 0
	
func move_right():
	dir = "right"
	velocity.x = 1
	velocity.y = 0

func _ready():
	randomize()
	move_down()
	velocity = velocity.normalized() * speed
	
func new_dir():
	velocity.x = rand_range(-1, 1)
	velocity.y = rand_range(-1, 1)
	velocity = velocity.normalized() * speed

func new_dir2():
	var random_value = randi()%4
	if random_value == 0:	velocity.x=1
	if random_value == 1:	velocity.x=-1
	if random_value == 2:	velocity.y=1
	if random_value == 3:	velocity.y=-1
	velocity = velocity.normalized() * speed
	
func check_collision():
	#randomize()
	var random_value = randi()%4
	#print(random_value)
	#print(dir)
	if random_value == 0:
		move_left()
		velocity = velocity.normalized() * speed
		return
	if random_value == 1:
		move_right()
		velocity = velocity.normalized() * speed
		return
	if random_value == 2:
		move_up()
		velocity = velocity.normalized() * speed
		return
	if random_value == 3:
		move_down()
		velocity = velocity.normalized() * speed
		return
	return;
	if dir == "up":
		move_right()
		velocity = velocity.normalized() * speed
		return
	if dir == "right":
		move_down()
		velocity = velocity.normalized() * speed
		return
	if dir == "down":
		move_left()
		velocity = velocity.normalized() * speed
		return
	if dir == "left":
		move_up()
		velocity = velocity.normalized() * speed
		return

func _physics_process(delta):
#	timer += delta
#	if timer > 0.1:
#		timer = 0
	var collision = $Player.move_and_collide(velocity * delta)
	if collision:
		check_collision()
#			if dir == "up":		move_right()
#			if dir == "right":	move_down()
#			if dir == "down":	move_left()
#			if dir == "left":	move_up()
			#new_dir()
			#new_dir2()
	#$Player.apply_impulse(Vector2(), Vector2(800, 0))
