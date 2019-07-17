extends Area2D

func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
    print("Click")

#func _input(event):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		print("click")
#    if event.is_key_pressed():
#        if event.pressed:
#			print("click")
#			pass

#func _physics_process(delta):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		print("click")