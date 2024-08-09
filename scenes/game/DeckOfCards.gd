extends Node2D

signal deck_clicked(suit: String, value: String)

var deck: Array = []
var Card = load("res://scenes/game/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_deck()
	create_cards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup_deck():
	var isDone = false
	var unusedClubs = DeckValues.cardValues.duplicate();
	var unusedHearts = DeckValues.cardValues.duplicate();
	var unusedDiamonds = DeckValues.cardValues.duplicate();
	var unusedSpades = DeckValues.cardValues.duplicate();
	
	while !isDone:
		var suitIndex = randi_range(0,3)
		var choosenSuit = DeckValues.suitLookup.get(suitIndex)
		
		if(choosenSuit == DeckValues.CLUBS && unusedClubs.size() > 0):
			add_card_to_deck(unusedClubs, DeckValues.CLUBS)
		elif(choosenSuit == DeckValues.DIAMONDS && unusedDiamonds.size() > 0):
			add_card_to_deck(unusedDiamonds, DeckValues.DIAMONDS)
		elif(choosenSuit == DeckValues.HEARTS && unusedHearts.size() > 0):
			add_card_to_deck(unusedHearts, DeckValues.HEARTS)
		elif(choosenSuit == DeckValues.SPADES && unusedSpades.size() > 0):
			add_card_to_deck(unusedSpades, DeckValues.SPADES)
		if (unusedClubs.size() <= 0 && unusedDiamonds.size() <= 0 && unusedHearts.size() <= 0 && unusedSpades.size() <= 0):
			isDone = true	

func add_card_to_deck(unusedSuit:Array, suit: String):
	var index = randi_range(0, unusedSuit.size()-1)
	deck.append([DeckValues.suitLookup.find_key(suit),DeckValues.valueLookup.find_key(unusedSuit[index])])
	unusedSuit.remove_at(index)

func create_cards():
	for index in range(0, deck.size() - 1):
		var card = Card.instantiate()
		var suit = DeckValues.suitLookup.get(deck[index][0])
		card.suit = suit
		card.animationName = suit + DeckValues.valueLookup.get(deck[index][1])
		card.position.x = -500
		card.position.y = -500
		card.suitIndex = deck[index][0]
		card.valueIndex = deck[index][1]
		add_child(card)
		print("Card Created")


func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event.is_action_pressed("mouse_left_click") && deck.size() > 0):
		print("Emitting at " + str(deck[0][0])+ ","+str(deck[0][1]))
		deck_clicked.emit(deck[0][0],deck[0][1])
		deck.pop_front()
