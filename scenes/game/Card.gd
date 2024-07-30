extends Node2D

signal flip

var suit="clubs"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func flip_card():
	$AnimatedSprite2D.play("clubs2")
	flip.emit(suit)

func _on_timer_timeout():
	flip_card()
