extends Node2D

var speed = Vector2(50, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func keyboard():
	if(Input.is_action_pressed("ui_left")):
		$player.position.x = $player.position.x - 1

	if(Input.is_action_pressed("ui_right")):
		$player.position.x = $player.position.x + 1

	if(Input.is_action_pressed("ui_up")):
		$player.position.y = $player.position.y - 1

	if(Input.is_action_pressed("ui_down")):
		$player.position.y = $player.position.y + 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	keyboard()
	$player.look_at($alien.position)
	$player.position += speed.rotated($player.rotation) * delta
