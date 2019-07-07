extends CanvasLayer

#emit_signal("ui_left")

func _on_left_pressed():
	$Cannon.btn_left()

func _on_right_pressed():
	$Cannon.btn_right()

func _on_up_pressed():
	$Cannon.btn_up()

func _on_down_pressed():
	$Cannon.btn_down()

func _on_btn_fire_pressed():
	$Cannon.btn_fire()
