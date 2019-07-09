extends StaticBody2D

var energy = 100

func get_damage(damage):
	energy -= damage
	if energy <= 0:
		print("FAIL")
		queue_free()
