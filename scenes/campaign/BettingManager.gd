extends Node

# Sets the betting odds and takes in bets for the user
# Keeps the bank for the user? 
signal odds_given(max_bet_allowed: int, odds: Dictionary)

enum States { BETTING, PLAY, ROUND_OVER, GAME_OVER }

var current_state: States

@onready var deck_of_cards = $"../DeckOfCards"
@onready var ticket_taker = $"../BetTakerCanvas"
@onready var game_over = $"../GameOverCanvas"
@export var horseCount: int = 4

var player_bank: int = 100
var current_round: int = 1
var total_rounds: int = 10
var currentBet: Dictionary = {amount = 0, horse = ''}
var currentOdds: Dictionary = {}
var odd_chart = {
	0: '1/2',
	1: '1/1',
	2: '2/1',
	3: '4/1', 
	4: '6/1',
	5: '8/1', 
	6: '10/1',
}

func _ready():
	set_state(States.BETTING)

func set_state(new_state: int) -> void:
	var previous_state: States = current_state
	current_state = new_state
	
	# Exit State Behavior
	if previous_state == States.BETTING:
		ticket_taker.visible = false
	elif previous_state == States.ROUND_OVER:
		current_round += 1
	
	# Enter State Behavior
	if current_state == States.BETTING:
		set_odds()
		ticket_taker.visible = true
	elif current_state == States.PLAY:
		pass
	elif current_state == States.ROUND_OVER:
		if player_bank <= 0 or current_round + 1 > total_rounds:
			set_state(States.GAME_OVER)
		else:
			payout()
			set_state(States.BETTING)
	elif current_state == States.GAME_OVER:
		game_over.visible = true

func payout():
	pass

func set_odds():
	var horse_one = DeckValues.suitLookup[0]
	var horse_two = DeckValues.suitLookup[1]
	var horse_three = DeckValues.suitLookup[2]
	var horse_four = DeckValues.suitLookup[3]
	
	var penalty_count: Dictionary = {
		horse_one: 0,
		horse_two: 0,
		horse_three: 0,
		horse_four: 0,
	}
	
	for penalty in deck_of_cards.penaltyDeck:
		var penalty_suit_index = penalty[0]
		var suit = DeckValues.suitLookup[penalty_suit_index]	
		penalty_count[suit] += 1
	
	currentOdds[horse_one] = odd_chart[penalty_count[horse_one]]
	currentOdds[horse_two] = odd_chart[penalty_count[horse_two]]
	currentOdds[horse_three] = odd_chart[penalty_count[horse_three]]
	currentOdds[horse_four] = odd_chart[penalty_count[horse_four]]
	print(penalty_count)
	print(currentOdds)

func calc_payout():
	# 10 - 2 -> ((10 / 2)+1) * bet = payout
	pass

func _on_bet_taker_canvas_bet_received(horse, bet_amount):
	player_bank -= bet_amount
	currentBet.amount = bet_amount
	currentBet.horse = horse
	set_state(States.PLAY)
