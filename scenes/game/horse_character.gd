extends CharacterBody2D


const SPEED = 300.0

@export var travelDistance: float = 100.0
var destination: Vector2 = Vector2()
var rotationDirection: float = 1.0
@export var rotationSpeed: float = 2.5
@export var upperBoundRotation = -12.0
@export var lowerBoundRotation = 2.5

func _ready():
	destination = position

func _physics_process(delta):
	if destination != position:
		var direction = 1 if destination.x > position.x else -1
		velocity.x = direction * SPEED
		oscilate_sprite(delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func oscilate_sprite(delta):
	if $Sprite2D.rotation_degrees < upperBoundRotation: 
		rotationDirection = 1.0
	elif $Sprite2D.rotation_degrees > lowerBoundRotation: 
		rotationDirection = -1.0
	$Sprite2D.rotation += rotationDirection * rotationSpeed * delta

func _on_button_pressed():
	destination = Vector2(destination.x + travelDistance, destination.y)

func _on_back_pressed():
	destination = Vector2(destination.x - travelDistance, destination.y)
