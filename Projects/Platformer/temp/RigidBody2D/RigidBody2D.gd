extends RigidBody2D

var timer = 0
var flag = false

func _on_RigidBody2D_body_entered(body):
	pass # Replace with function body.

# если устаановить Mode в Character - отключится трение и случайные перевороты

func _physics_process(delta):
	timer += delta
	if timer > 1:
		timer = 0
		flag = !flag
		print(str(flag))
		if flag:
			set_axis_velocity(Vector2(200, -500))	
		else:
			set_axis_velocity(Vector2(-200, -500))	

func kill():
	#queue_free()
	pass