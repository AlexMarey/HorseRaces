extends Node2D

var CLUBS = 'clubs'
var DIAMONDS = 'diamond'
var HEARTS = 'hearts'
var SPADES = 'spades'
var TWO = '2'
var THREE = '3'
var FOUR = '4'
var FIVE = '5'
var SIX = '6'
var SEVEN = '7'
var EIGHT = '8'
var NINE = '9'
var TEN = '10'
var JACK = 'Jack'
var QUEEN = 'Queen'
var KING = 'King'
var ACE = 'Ace'
var cardValues: Array = [TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING,ACE]

var suitLookup = {0:CLUBS, 1:DIAMONDS, 2: HEARTS, 3: SPADES}
var valueLookup = {0:TWO,1:THREE,2:FOUR,3:FIVE,4:SIX,5:SEVEN,6:EIGHT,7:NINE,8:TEN,9:JACK,10:QUEEN,11:KING,12:ACE}

var deck: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var isDone = false
	var unusedClubs = cardValues.duplicate();
	var unusedHearts = cardValues.duplicate();
	var unusedDiamonds = cardValues.duplicate();
	var unusedSpades = cardValues.duplicate();
	
	while !isDone:
		var suitIndex = randi_range(0,3)
		var choosenSuit = suitLookup.get(suitIndex)
		
		if(choosenSuit == CLUBS && unusedClubs.size() > 0):
			add_card_to_deck(unusedClubs, CLUBS)
		elif(choosenSuit == DIAMONDS && unusedDiamonds.size() > 0):
			add_card_to_deck(unusedDiamonds, DIAMONDS)
		elif(choosenSuit == HEARTS && unusedHearts.size() > 0):
			add_card_to_deck(unusedHearts, HEARTS)
		elif(choosenSuit == SPADES && unusedSpades.size() > 0):
			add_card_to_deck(unusedSpades, SPADES)
		if (unusedClubs.size() <= 0 && unusedDiamonds.size() <= 0 && unusedHearts.size() <= 0 && unusedSpades.size() <= 0):
			isDone = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_card_to_deck(unusedSuit:Array, suit: String):
	var index = randi_range(0, unusedSuit.size()-1)
	deck.append([suitLookup.find_key(suit),valueLookup.find_key(unusedSuit[index])])
	unusedSuit.remove_at(index)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event.is_action_pressed("mouse_left_click") && deck.size() > 0):
		print(suitLookup.get(deck[0][0]) + valueLookup.get(deck[0][1]))
		deck.pop_front()
