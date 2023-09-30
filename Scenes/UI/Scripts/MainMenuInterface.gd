extends Control

signal start_game_signal
signal quit_game_signal

func start_game():
	start_game_signal.emit()
	
func quit_game():
	quit_game_signal.emit()	


func _on_start_button_pressed():
	start_game()# Replace with function body.


func _on_quit_button_pressed():
	quit_game() # Replace with function body.
