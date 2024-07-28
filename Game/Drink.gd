extends Node2D

class_name drink

const ingredients_per_drink = 3
var ingredients = ["Red", "Blue", "Green", "Yellow", "Orange"]

var current_drink_ingredients:Array[String] = []
var current_ingredients_in_drink:int = 0

@onready var cup_colors = [
	$"../Character/Cup/One",
	$"../Character/Cup/Two",
	$"../Character/Cup/Three"
]


func build_drink(ingredient:String) -> void:
	#if ingredients exceeds 3, dump the contents
	if current_ingredients_in_drink >= ingredients_per_drink:
		drink_trashed()
		
	#Adds an ingredient to the drink array
	current_drink_ingredients.append(ingredient)
	current_ingredients_in_drink += 1
	current_drink_ingredients.sort()
	change_cup_colors()
	print(str(ingredient) + " added to drink")

func change_cup_colors():
	for ingredient in current_drink_ingredients.size():
		cup_colors[ingredient].modulate = Color(current_drink_ingredients[ingredient])

func give_drink() -> Array[String]:
	#create temp drink then empty cup
	var verify_drink = current_drink_ingredients.duplicate()
	drink_trashed()
	return verify_drink

	
func drink_trashed() -> void:
	#empties drink and resets counter to 0
	current_ingredients_in_drink = 0
	current_drink_ingredients.clear()
	cup_colors[0].modulate = Color("white")
	cup_colors[1].modulate = Color("white")
	cup_colors[2].modulate = Color("white")
	change_cup_colors()

func print_drink() -> void:
	print(current_drink_ingredients)
