extends CanvasLayer

@onready var horse_option_button = $Panel/HorseOptionButton
@onready var bet_amount_box = $Panel/BetAmountBox
@onready var submit_button = $Panel/SubmitButton

signal bet_received(horse: String, bet_amount: int)

func _on_bet_taker_opened(max_bet: int, horseNames: Array[String]):
	bet_amount_box.max_value = max_bet
	for i in horseNames.size():
		horse_option_button.set_item_text(i, horseNames[i])

func _on_submit():
	var selectedIndex = horse_option_button.get_selected_id()
	var selectedText = horse_option_button.get_item_text(selectedIndex)
	bet_received.emit(selectedText ,bet_amount_box.value)
