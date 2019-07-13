extends RigidBody2D

var timer = 0

func _physics_process(delta):
	timer += delta
	if !get_viewport_rect().has_point(position) || timer >= 1:
		queue_free()

# не забудь установить для Bullet:
# Contact Monitor
# Contacts Reported
func _on_Bullet_body_entered(body):
	timer = 1
	if body.has_method("is_target"):
		print("target destroed")
