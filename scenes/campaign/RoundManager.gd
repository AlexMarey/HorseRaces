extends Node

@export var currentRound: int = 0
@export var totalRounds: int = 10

func new_round(): 
	currentRound += 1
	# give horses new names?
	# set betting odds?

func round_over():
	# give out winnings?
	new_round()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
