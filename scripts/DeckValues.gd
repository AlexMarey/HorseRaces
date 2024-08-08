extends Node

const CLUBS = 'clubs'
const DIAMONDS = 'diamond'
const HEARTS = 'hearts'
const SPADES = 'spades'
const TWO = '2'
const THREE = '3'
const FOUR = '4'
const FIVE = '5'
const SIX = '6'
const SEVEN = '7'
const EIGHT = '8'
const NINE = '9'
const TEN = '10'
const JACK = 'Jack'
const QUEEN = 'Queen'
const KING = 'King'
const ACE = 'Ace'
const cardValues: Array = [TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE]
const suitLookup = {0:CLUBS, 1:DIAMONDS, 2: HEARTS, 3: SPADES}
const valueLookup = {0:TWO, 1:THREE, 2:FOUR, 3:FIVE, 4:SIX, 5:SEVEN, 6:EIGHT, 7:NINE, 8:TEN, 9:JACK, 10:QUEEN, 11:KING, 12:ACE}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
