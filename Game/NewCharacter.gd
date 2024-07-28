extends Node2D

@onready var Drink = $"../Drink"
@onready var Body = $"Cup/Body"

var collider_name

func _process(delta):
	if Input.is_action_just_pressed("click"):
		var overlaps = Body.get_overlapping_bodies()
		for a in overlaps:
			if a.name == "Ingredient":
				Drink.build_drink(a.get_parent().name)
			elif a.name == "NPC":
				a.get_parent().get_parent().take_drink(Drink.current_drink_ingredients)
				Drink.drink_trashed()

func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	var Cup = $Cup
	rotation_degrees += rad_to_deg(get_angle_to(mouse_position)+PI/2)
	Cup.position.y = -position.distance_to(mouse_position-get_parent().position)
	if Cup.position.y < -400:
		Cup.position.y = -400
