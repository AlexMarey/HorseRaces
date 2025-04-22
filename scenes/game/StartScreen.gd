extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	self.show()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_race_button_pressed():
	get_tree().paused = false
	self.hide()


func _on_horse_1_input_text_changed(new_text):
	$"../HorseSpades".horseName = new_text
	pass # Replace with function body.
