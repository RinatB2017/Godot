extends CanvasLayer

func _ready():
	#$Sprite.set_opacity(0.5)
	#$btn_fire.set_opacity(0.5)
	pass

func _on_btn_left_button_up():
	get_node("../Player").move_stop()

func _on_btn_left_button_down():
	get_node("../Player").move_left()

func _on_btn_right_button_up():
	get_node("../Player").move_stop()

func _on_btn_right_button_down():
	get_node("../Player").move_right()


func _on_btn_up_pressed():
	get_node("../Player").jump()


func _on_btn_fire_pressed():
	get_node("../Player").shoot()
