extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		var pos = Vector2(900, 500)
		$Obj.set_position(pos)
