extends Node

func to(scene):
	get_tree().change_scene("res://levels/"+scene+".tscn")