extends Node2D

signal flip

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func flip_card():
	position.x += position.x + 250
	$AnimatedSprite2D.play("clubs2")

func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event.is_action_pressed("mouse_left_click")):
		flip_card()
