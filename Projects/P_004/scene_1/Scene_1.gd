extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		get_tree().change_scene("res://scene_2/Scene_2.tscn")
