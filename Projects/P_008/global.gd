extends Node

func get_name():
	return "XXX"

func to(scene):
	get_tree().change_scene("res://levels/"+scene+".tscn")