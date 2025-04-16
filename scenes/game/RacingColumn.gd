extends Node2D
signal tracker_reached_max_horses(index: int)

@export var index = 0
var horsesTracked = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	horsesTracked += 1
	if horsesTracked == 4:
		tracker_reached_max_horses.emit(index)
