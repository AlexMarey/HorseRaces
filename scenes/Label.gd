extends Label


func _on_finish_line_race_finished(raceWinner: String):
	self.text = raceWinner + " Wins!!!"
	self.visible = true

