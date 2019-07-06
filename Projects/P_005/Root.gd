extends Area2D

func _ready():
	$size_X.text = "Width  " + str(get_viewport().size.x)
	$size_Y.text = "Height " + str(get_viewport().size.y)
