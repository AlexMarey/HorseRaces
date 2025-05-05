extends Node

signal horse_name_change(horseName: String)

@export var index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if index >= 1:
		$Label.text = "Horse " + str(index) + " Name:"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_changed(new_text):
	horse_name_change.emit(new_text)
