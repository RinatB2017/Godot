extends RigidBody2D

func _on_Danger_body_entered(body):
	if body.has_method("get_damage"):
		body.queue_free()
