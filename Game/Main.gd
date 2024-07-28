extends Node2D

var border_objects = []

func _ready():
	border_objects = get_tree().get_nodes_in_group("border_object")
	border_objects.shuffle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
