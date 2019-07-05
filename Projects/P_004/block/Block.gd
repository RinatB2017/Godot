extends StaticBody2D

var energy = 100

func kill():
	energy -= 10
	if energy < 0:
		queue_free()

func _physics_process(delta):
#	if !get_viewport_rect().has_point(position):
#		queue_free()
	pass