extends Control

signal input_changed(new_text: String)

@export var LabelText = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = LabelText


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_line_edit_text_changed(new_text):
	input_changed.emit(new_text)
