extends Node2D

var suits: Array = ['clubs', 'diamond','hearts','spades']
var cardValues: Array = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']

@export var suit = ""
@export var animationName = ""
@export var suitIndex = -1
@export var valueIndex = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	var deck = get_node("./scenes/game/DeckOfCards")
	deck.connect("deck_clicked", flip_card)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func flip_card(suit: String, value: String):
	#position.x += position.x + 250
	#var suitIndex = randi_range(0,3)
	#var cardIndex = randi_range(0,12)
	#var animationName = suits[suitIndex]+cardValues[cardIndex]
	#print(animationName)
	if(suitIndex == suit and valueIndex == value):
		$AnimatedSprite2D.play(animationName)

