extends RigidBody2D

func _ready():
	print("Test ready")

func _on_Test_body_exited(body):
	if body.has_method("is_player"):
		body.queue_free()
		print("player is die!")
