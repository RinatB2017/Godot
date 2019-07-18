extends Area2D

# https://www.reddit.com/r/godot/comments/7xwr22/guide_how_to_click_a_sprite/
var n_bone = "bone_2"

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	print("Click " + str(n_bone))
