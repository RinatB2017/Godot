extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		get_tree().change_scene("res://scene_1/Scene_1.tscn")
