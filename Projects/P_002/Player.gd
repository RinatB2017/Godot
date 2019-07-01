extends RigidBody2D

var begin_pos

func _ready():
	begin_pos = position
	print(get_viewport().size)

func _process(delta):
	if(Input.is_action_pressed("ui_left")):
		apply_impulse(Vector2(), Vector2(-20, 0))
	if(Input.is_action_pressed("ui_right")):
		apply_impulse(Vector2(), Vector2(20, 0))
	if(Input.is_action_pressed("ui_up")):
		apply_impulse(Vector2(), Vector2(0, -10))
		
	#print(position.y)
		
	if(position.y > get_viewport().size.y):
		position = begin_pos
