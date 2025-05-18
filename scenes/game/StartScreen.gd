extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	self.show()

func _on_name_ui_start_button_pressed():
	get_tree().paused = false
	self.hide()
