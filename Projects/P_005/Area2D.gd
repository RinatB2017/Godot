extends Area2D

var angle = 0

func _physics_process(delta):
	set_rotation(deg2rad(angle))
	angle += 1
	if angle >= 360:
		angle = 0
	