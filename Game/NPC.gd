extends Node2D

class_name NPC

#@onready var sprite = $Sprite
#@onready var timer = $Timer
#@onready var text_box = $TextBox
signal timed_out

var order_given:bool = false
var requested_drink:Array[String] = []

const ingredients_per_drink:int = 3
var ingredients = []

var drink_text:String = ""

@onready var cup_colors = [
	$"Cup/One",
	$"Cup/Two",
	$"Cup/Three"
]

func _ready():
	initiate()
#	text_box.text = drink_text

func initiate():
	Global.add_border_object(self)
	ingredients.clear()
	for a in get_tree().get_nodes_in_group("color"):
		ingredients.append(a.name)
	look_at(Vector2(960,540))
	$Cup.position.y = -800
	request_random_drink()
	set_sprite()
	var tween = get_tree().create_tween()
	tween.tween_property($Cup, "position", Vector2(0,-400), 1)

func request_random_drink() -> Array[String]:
	#Creates an array of int to determine unique drink
	requested_drink.clear()
	for ingredient in ingredients_per_drink:
		requested_drink.append(ingredients.pick_random())
	requested_drink.sort()
	
	print(requested_drink)
	#returns the array to the NPC that requested it
	return requested_drink

func set_sprite() -> void:
	for ingredient in requested_drink.size():
		cup_colors[ingredient].modulate = Color(requested_drink[ingredient])

func set_drink_text(text:String) -> void:
	pass
#	if text == "init":
#		set_drink_text("I'd like a drink with %s, %s, and %s, please." %[requested_drink[0], requested_drink[1], requested_drink[2]])
#	else:
#		text_box.text = text

#func start_timer(seconds:int) -> void:
#	timer.wait_time = seconds
#	timer.start()
	
func take_drink(given_drink:Array[String]):
	print("taking")
	if given_drink == requested_drink:
		initiate()
	else:
		pass

func _on_timer_timeout() -> void:
	set_drink_text("You're too slow...")
	timed_out.emit()
