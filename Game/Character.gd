extends Sprite2D

var speed_of_player = 1000
var speed_of_player_against_bar = 500
var minimum_distance_before_player_moves = 10
var radius_of_bar = 400
var center_of_bar = Vector2(960,540)

func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	#proposed_movement is a Vector2 in the direction of the player's mouse, multiplied by how far away the mouse is
	var proposed_movement = position.direction_to(mouse_position)*delta*speed_of_player*position.distance_to(mouse_position)/radius_of_bar
	#if statement prevents the player making millions of tiny movements
	if position.distance_to(mouse_position) > minimum_distance_before_player_moves:
		position += proposed_movement
		#After moving, if it is over the edge of the bar, undo the movement
	if position.distance_to(center_of_bar) > radius_of_bar:
		position -= proposed_movement


func _on_player_body_entered(body):
		match body.name:
			"Red": pass
			"Blue": pass
			"Green": pass
			"Yellow": pass
			"Orange": pass
