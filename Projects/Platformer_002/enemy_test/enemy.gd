extends RigidBody2D

var timer = 0
var dir = 0
var cnt = 0

var velocity = Vector2()

func _physics_process(delta):
	timer += delta
	if timer > 0.1:
		timer = 0
		cnt += 1

	if cnt > 5:
		cnt = 0
		dir = !dir
	if dir:
		velocity.y = 400
		#move_and_collide(velocity)
		set_axis_velocity(velocity)
	else:
		velocity.y = -400
		#move_and_slide(velocity)
		set_axis_velocity(velocity)

func _on_Enemy_body_entered(body):
	if body.get_name() == "Player":
		body.queue_free()
