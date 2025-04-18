extends Node2D

signal tracker_reached_max_horses()

var trackedHorses: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_area_entered(area):
	# if horse is unique, add it to trackHorses
	var parent = area.get_parent();
	if trackedHorses.find(parent.suitedTeam) < 0:
		trackedHorses.append(parent.suitedTeam)
		if trackedHorses.size() == 4:
			tracker_reached_max_horses.emit()
			print("RACING COLUMN - All Horses tracked. Emit 'max horses reached'")
