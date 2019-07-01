extends StaticBody2D

func _physics_process(delta):
	if $"../Player".flag_on_floor:
		print("OK")
