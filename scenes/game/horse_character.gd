extends CharacterBody2D

@export var suitedTeam: String = ""
@export var horseName: String = ""

@export var travelDistance: float = 100.0

const SPEED = 300.0
var destination: Vector2 = Vector2()
var rotationDirection: float = 1.0
var rotationSpeed: float = 2.5
var upperBoundRotation = -12.0
var lowerBoundRotation = 2.5

func _ready():
	destination = position

func _process(delta):
	if $Label.text != horseName:
		$Label.text = horseName
	elif $Label.text.length() <= 0:
		horseName = suitedTeam.capitalize()
		$Label.text = suitedTeam.capitalize()

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

func _on_deck_of_cards_deck_clicked(suit: int, value: int):
	print('HORSE - Deck Clicked Signal Received. Suit: ' + str(suit) + ', Team ' + suitedTeam)
	if(DeckValues.suitLookup.get(suit) == suitedTeam):
		print("HORSE - Moving Forward: " + DeckValues.suitLookup.get(suit))
		destination = Vector2(destination.x + travelDistance, destination.y)

func _on_deck_of_cards_penalty_card_flipped(suit, value):
	print('HORSE - Penalty Signal Received. Suit: ' + str(suit) + ', Team ' + suitedTeam)
	if(DeckValues.suitLookup.get(suit) == suitedTeam):
		print("HORSE - Moving Back: " + DeckValues.suitLookup.get(suit))
		destination = Vector2(destination.x - travelDistance, destination.y)

func _on_new_name(newName: String):
	horseName = newName
