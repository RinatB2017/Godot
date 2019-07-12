extends Node2D

var velocity = Vector2()
var speed = 500
var timer = 0;

func _ready():
	randomize()
	velocity.y = 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	timer += delta
	if timer > 0.1:
		timer = 0
		var collision = $Player.move_and_collide(velocity * delta)
		if collision:
			var random_value = randi()%4
			if random_value == 0:	velocity.x=1
			if random_value == 1:	velocity.x=-1
			if random_value == 2:	velocity.y=1
			if random_value == 3:	velocity.y=-1
			velocity = velocity.normalized() * speed
#		$Player.apply_impulse(Vector2(), Vector2(800, 0))
