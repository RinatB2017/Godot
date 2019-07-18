extends Area2D

# https://www.reddit.com/r/godot/comments/7xwr22/guide_how_to_click_a_sprite/

#func _input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton \
#	and event.button_index == BUTTON_LEFT \
#	and event.is_pressed():
#		self.on_click()
#	else:
#		self.on_released()

var status = "none"
var l_pos
var off

func process(delta):
	if status == "clicked":
		set_global_position(l_pos + off)

func _input_event(viewport, event, shape_idx):
	if !event is InputEventMouseButton:
		return

	if event.button_index != BUTTON_LEFT:
		return

#	if event.type == InputEvent.MOUSEMOTION:
#		print("motion")

	if event.is_pressed():
		self.on_click()
		l_pos = event.get_global_position()
		off = get_global_position() - l_pos
	else:
		self.on_released()
		off = get_global_position() - l_pos

func on_click():
	print("Click")
	status = "clicked"

func on_released():
	print("Released")
	status = "released"
