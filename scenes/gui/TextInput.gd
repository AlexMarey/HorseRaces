extends Control

signal input_changed(new_text: String)

@export var LabelText = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = LabelText

func _on_line_edit_text_changed(new_text):
	input_changed.emit(new_text)
