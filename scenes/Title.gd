extends Node

@onready var htp_panel = $HowToPlayPanel

func _on_htp_close_button_pressed():
	htp_panel.visible = false

func _on_how_to_play_button_pressed():
	htp_panel.visible = true

func _on_exit_button_pressed():
	get_tree().quit()

func _on_start_game_button_pressed():
	# Scene Manager call to go to start game
	pass
