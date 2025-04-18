extends Node2D

@export var suitedTeam = ""
@export var horseName = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_deck_of_cards_deck_clicked(suit: int, value: int):
	print('HORSE - Deck Clicked Signal Received. Suit: ' + str(suit) + ', Team ' + suitedTeam)
	if(DeckValues.suitLookup.get(suit) == suitedTeam):
		print("HORSE - Moving Forward: " + DeckValues.suitLookup.get(suit))
		position.x += 100


func _on_deck_of_cards_penalty_card_flipped(suit, value):
	print('HORSE - Penalty Signal Received. Suit: ' + str(suit) + ', Team ' + suitedTeam)
	if(DeckValues.suitLookup.get(suit) == suitedTeam):
		print("HORSE - Moving Back: " + DeckValues.suitLookup.get(suit))
		position.x -= 100
