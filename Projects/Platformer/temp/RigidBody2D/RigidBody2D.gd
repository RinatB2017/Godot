extends RigidBody2D

var timer = 0

func _on_RigidBody2D_body_entered(body):
	pass # Replace with function body.

func _physics_process(delta):
	timer += delta
	if timer > 1:
		timer = 0

func kill():
	queue_free()
