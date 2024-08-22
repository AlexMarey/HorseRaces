extends Area2D

signal race_finished(raceWinner: String)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area: Area2D):
	if (area.is_in_group("Horses")):
		var horse = area.get_parent()
		race_finished.emit(horse.suitedTeam)
