extends Node2D

func _on_Portal_body_entered(body):
	if body.has_method("is_player"):
		get_tree().change_scene("res://levels/level_001/Level_001.tscn")
