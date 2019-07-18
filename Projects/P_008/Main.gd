extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		#var pos = Vector2(900, 500)
		#$Obj.set_position(pos)
		#$Obj.move_and_slide(pos)
		var pos0 = $Sprite_0.position
		var pos1 = $Sprite_1.position
		var dist = pos0.distance_to(pos1)
		print("dist " + str(dist))
