extends Node2D

var suits: Array = ['clubs', 'diamond','hearts','spades']
var cardValues: Array = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']

@export var suit = ""
@export var animationName = ""
@export var suitIndex = -1
@export var valueIndex = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	var deck = get_parent()
	deck.connect("deck_clicked", flip_card)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func flip_card(suitReceived: int, valueReceived: int):
	if(suitIndex == suitReceived and valueIndex == valueReceived):
		print("Card found, playing: "+ animationName)
		global_position = Vector2(650, 500)
		$AnimatedSprite2D.play(animationName)
