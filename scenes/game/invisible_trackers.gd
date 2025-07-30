extends Node2D

signal max_horses_in_column()

func _ready():
	var children = get_children()
	for child in children:
		child.tracker_reached_max_horses.connect(_on_announce_max)
	# Connect to each child component's max tracker signal and
	

func _on_announce_max():
	max_horses_in_column.emit()
