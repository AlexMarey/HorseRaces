extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()

func game_over():
	get_tree().paused = true
	self.show()

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_finish_line_race_finished(raceWinner):
	var label = find_child("WinnerLabel")
	label.text = raceWinner.capitalize() + " Wins!!!"
	game_over()
