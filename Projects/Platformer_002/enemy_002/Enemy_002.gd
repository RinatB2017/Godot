extends RigidBody2D

var s_enemy
var dir = 0
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	s_enemy = 0.1

func _physics_process(delta):
	timer += delta
	if timer > 1:
		timer = 0
		dir = !dir
		
	if dir:
		if s_enemy < 2:
			s_enemy += 0.1
	else:
		if s_enemy > 0.1:
			s_enemy -= 0.1
	
	#print(dir)
	#print(s_enemy)
	set_scale(Vector2(1, s_enemy))
	#var sprite = get_node("./Sprite")
	#sprite.set_scale(Vector2(1, s_enemy))


func _on_Enemy_002_body_entered(body):
	if body.get_name() == "Player":
		body.queue_free()
