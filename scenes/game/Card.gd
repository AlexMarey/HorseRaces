extends Node2D

signal flip

var suits: Array = ['clubs', 'diamond','hearts','spades']
var cardValues: Array = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func flip_card():
	position.x += position.x + 250
	var suitIndex = randi_range(0,3)
	var cardIndex = randi_range(0,12)
	var animationName = suits[suitIndex]+cardValues[cardIndex]
	print(animationName)
	$AnimatedSprite2D.play(animationName)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event.is_action_pressed("mouse_left_click")):
		flip_card()
