extends Node2D

@export var suitedTeam: String = ""
@export var horseName: String = ""

@export var travelDistance: int = 100

var destination: Vector2 = Vector2()
var currentMovementPositionX: int = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	if horseName.length() == 0:
		horseName = suitedTeam.capitalize()
	$Label.text = horseName
	currentMovementPositionX = position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Label.text != horseName:
		$Label.text = horseName

func _physics_process(delta):
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

# Used by NameInput Node to give the horse a name
func _on_new_name(newName: String):
	horseName = newName
