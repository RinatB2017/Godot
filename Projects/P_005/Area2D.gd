extends Area2D

var angle = 0
var time  = 0

func _physics_process(delta):
	time += delta
	if time > 0.2:
		time = 0
		rotate(deg2rad(angle))
		angle += 1
		if angle >= 360:
			angle = 0
		