extends Node2D

@export var suitedTeam = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_deck_of_cards_deck_clicked(suit: int, value: int):
	print('HORSE - Signal Received. Suit: ' + str(suit) + ', Team ' + suitedTeam)
	if(DeckValues.suitLookup.get(suit) == suitedTeam):
		print("Moving: " + DeckValues.suitLookup.get(suit))
		position.x += 100
