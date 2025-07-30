extends Node

@export var money: int = 10

func increase_score(winnings: int): 
	money += winnings

func place_bet(bet: int):
	money -= bet
