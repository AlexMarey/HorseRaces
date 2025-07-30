extends Node2D

signal deck_clicked(suit: int, value: int)
signal penalty_card_flipped(suit: int, value: int)

var deck: Array = [] # Array of tuples [x, y] where x is suit and y is card value index
var penaltyDeck: Array = [] # Array of tuples [x, y] where x is suit and y is card value index
var Card = preload("res://scenes/game/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_deck()
	create_cards()

func _draw():
	draw_rect(Rect2(-38.5, -51, 152, 102), Color.FOREST_GREEN, false, 2.0)

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
		add_child(card)
		var suit = DeckValues.suitLookup.get(deck[index][0])
		card.suit = suit
		card.animationName = suit + DeckValues.valueLookup.get(deck[index][1])
		card.suitIndex = deck[index][0]
		card.valueIndex = deck[index][1]
		
		# Create penalty cards
		if index <= 8: 
			var positionX = (index * 100) + 222.5
			var positionY = self.position.y
			card.set_global_position(Vector2(positionX, positionY))
			card.playPositionX = positionX
			card.playPositionY = positionY
			penaltyDeck.append([deck[index][0], deck[index][1]])
		# Create normal deck
		else:
			card.position.x = -500
			card.position.y = -500
			card.playPositionX = self.position.x + 75
			card.playPositionY = self.position.y
		print("DECK - Card Created")
	
	for index in 9:
		deck.pop_front()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event.is_action_pressed("mouse_left_click") && deck.size() > 0):
		print("DECK - Emitting deck clicked " + str(deck[0][0])+ ","+str(deck[0][1]))
		deck_clicked.emit(deck[0][0],deck[0][1])
		deck.pop_front()

func _on_invisible_trackers_max_horses_in_column():
	penalty_card_flipped.emit(penaltyDeck[0][0], penaltyDeck[0][1])
	penaltyDeck.pop_front()
