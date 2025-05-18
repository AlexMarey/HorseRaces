extends Area2D

signal race_finished(raceWinner: String)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(body):
	race_finished.emit(body.horseName)
