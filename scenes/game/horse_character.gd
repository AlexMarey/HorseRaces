class_name Horse
extends CharacterBody2D

@export var suitedTeam: String = ""
@export var horseName: String = ""

@export var travelDistance: float = 100.0

const SPEED = 300.0
var startingPosition: Vector2 = Vector2()
var rotationDirection: float = 1.0
var rotationSpeed: float = 2.5
var upperBoundRotation = -12.0
var lowerBoundRotation = 2.5

var destinationQueue: Array[Vector2] = []

func _ready():
	startingPosition = position

func _process(delta):
	if $Label.text != horseName:
		$Label.text = horseName
	elif $Label.text.length() <= 0:
		horseName = suitedTeam.capitalize()
		$Label.text = suitedTeam.capitalize()

func _physics_process(delta):
	if destinationQueue.size() > 0:
		var nextDestination = destinationQueue[0]
		if nextDestination != position: 
			var direction = 1 if nextDestination.x > position.x else -1
			velocity.x = direction * SPEED
			oscilate_sprite(delta)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			destinationQueue.pop_front()
	move_and_slide()

func oscilate_sprite(delta):
	if $Sprite2D.rotation_degrees < upperBoundRotation: 
		rotationDirection = 1.0
	elif $Sprite2D.rotation_degrees > lowerBoundRotation: 
		rotationDirection = -1.0
	$Sprite2D.rotation += rotationDirection * rotationSpeed * delta

func _on_deck_of_cards_deck_clicked(suit: int, value: int):
	if(DeckValues.suitLookup.get(suit) == suitedTeam):
		var lastSavedPosition := _get_last_saved_position()
		destinationQueue.append(Vector2(lastSavedPosition.x + travelDistance, lastSavedPosition.y))

func _on_deck_of_cards_penalty_card_flipped(suit, value):
	if(DeckValues.suitLookup.get(suit) == suitedTeam):
		var lastSavedPosition := _get_last_saved_position()
		destinationQueue.append(Vector2(lastSavedPosition.x - travelDistance, lastSavedPosition.y))

func _get_last_saved_position() -> Vector2:
	var lastSavedPosition := Vector2()
	if destinationQueue.size() > 0:
		lastSavedPosition = destinationQueue[destinationQueue.size() - 1]
	else: 
		lastSavedPosition = position
	return lastSavedPosition

func _on_new_name(newName: String):
	horseName = newName
