extends CanvasLayer

@onready var winner_label := $WinnerLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()

func game_over():
	self.show()
	await get_tree().create_timer(.175).timeout
	get_tree().paused = true

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_finish_line_race_finished(raceWinner):
	winner_label.text = raceWinner.capitalize() + " Wins!!!"
	game_over()
