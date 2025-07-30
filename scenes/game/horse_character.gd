class_name Horse
extends CharacterBody2D

@onready var label = $Label
@onready var sprite = $Sprite2D

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
	_set_suited_sprite(suitedTeam)
	startingPosition = position

func _set_suited_sprite(suit: String):
	if suit == DeckValues.HEARTS:
		sprite.texture = load("res://assets/horses/character_horse-hearts.png")
	elif suit == DeckValues.DIAMONDS:
		sprite.texture = load("res://assets/horses/character_horse-diamonds.png")
	elif suit == DeckValues.CLUBS:
		sprite.texture = load("res://assets/horses/character_horse-clubs.png")
	elif suit == DeckValues.SPADES:
		sprite.texture = load("res://assets/horses/character_horse-spades.png")

func _process(delta):
	if label.text != horseName:
		label.text = horseName
	elif label.text.length() <= 0:
		horseName = suitedTeam.capitalize()
		label.text = suitedTeam.capitalize()

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
	if sprite.rotation_degrees < upperBoundRotation: 
		rotationDirection = 1.0
	elif sprite.rotation_degrees > lowerBoundRotation: 
		rotationDirection = -1.0
	sprite.rotation += rotationDirection * rotationSpeed * delta

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
