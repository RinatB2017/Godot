extends RigidBody2D

var tm = 0

func _physics_process(delta):
	tm += delta
	if !get_viewport_rect().has_point(position) || tm >= 1:
		queue_free()

# не забудь установить для Bullet:
# Contact Monitor
# Contacts Reported
func _on_Bullet_body_entered(body):
	tm = 1
	if body.has_method("kill"):
		body.call("kill")
