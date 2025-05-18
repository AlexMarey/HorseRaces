extends Node2D

signal tracker_reached_max_horses()

var trackedHorses: Array[String] = []

func _ready():
	pass 

func _draw():
	draw_line(Vector2(-50,-200), Vector2(-50, 200),Color.PERU, 5.0)

func _on_area_2d_body_entered(body):
	if trackedHorses.find(body.suitedTeam) < 0:
		trackedHorses.append(body.suitedTeam)
		if trackedHorses.size() == 4:
			tracker_reached_max_horses.emit()
			print("RACING COLUMN - All Horses tracked. Emit 'max horses reached'")
