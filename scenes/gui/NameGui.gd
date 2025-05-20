extends Control

signal start_button_pressed()

@export var horses: Array[Horse] = []
var horseNames: Array[String] = []

@export var submitButton: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	for horse in horses: 
		horseNames.append("")

func _process(delta):
	_validate_inputs()

func _validate_inputs():
	if horseNames.find("") >= 0:
		submitButton.disabled = true
	else:
		submitButton.disabled = false

func _on_submit_button_pressed():
	# Set Horses Names
	var index = 0
	for horse in horses:
		horse.horseName = horseNames[index]
		index += 1
		
	# Start the game
	start_button_pressed.emit()

func _on_skip_button_pressed():
	for horse in horses:
		horse.horseName = horse.suitedTeam.capitalize()
	# Start the game
	start_button_pressed.emit()

# Track Horses Names
func _on_text_input_changed(new_text, index):
	horseNames[index] = new_text.strip_edges()
