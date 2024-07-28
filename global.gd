extends Node

var border_objects = []

func add_border_object(node):
	if border_objects.has(node):
		border_objects.erase(node)
	var border_objects_size = border_objects.size()
	border_objects.insert(randi_range(0, border_objects_size), node)
	var tween = create_tween().set_parallel()
	for a in border_objects:
		tween.tween_property(a, "rotation_degrees", border_objects.find(a)*360/border_objects.size(), 1)

