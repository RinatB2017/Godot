extends RigidBody2D

var tm = 0

func _physics_process(delta):
	tm += delta
	if !get_viewport_rect().has_point(position) || tm > 1:
		queue_free()
