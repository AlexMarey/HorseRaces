extends Node2D

var suits: Array[String] = ['clubs', 'diamond','hearts','spades']
var cardValues: Array[String] = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']

@export var suit = ""
@export var animationName = ""
@export var suitIndex = -1
@export var valueIndex = -1
@export var playPositionX = 650
@export var playPositionY = 500
@onready var audio_player = $AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.
func _ready():
	var deck = get_parent()
	deck.connect("deck_clicked", flip_card)
	deck.connect("penalty_card_flipped", flip_card)
	pass # Replace with function body.

func flip_card(suitReceived: int, valueReceived: int):
	if(suitIndex == suitReceived and valueIndex == valueReceived):
		print("CARD - Card found, playing: "+ animationName)
		global_position = Vector2(self.playPositionX, self.playPositionY)
		audio_player.play()
		$AnimatedSprite2D.play(animationName)

func flip_penalty_card():
	pass
