extends Control

signal start_button_pressed()

@export var horses: Array[Node2D] = []
var horseNames: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for horse in horses: 
		horseNames.append(horse.horseName)

func _on_button_pressed():
	# Set Horses Names
	var index = 0
	for horse in horses:
		horse.horseName = horseNames[index]
		index += 1
		
	# Start the game
	start_button_pressed.emit()

# Track Horses Names
func _on_text_input_lane_1_input_changed(new_text):
	horseNames[0] = new_text

func _on_text_input_lane_2_input_changed(new_text):
	horseNames[1] = new_text

func _on_text_input_lane_3_input_changed(new_text):
	horseNames[2] = new_text

func _on_text_input_lane_4_input_changed(new_text):
	horseNames[3] = new_text
