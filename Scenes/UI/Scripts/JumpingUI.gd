extends Control

func _on_player_on_jumps_updated(amount):
	var textField = get_node("JumpAmountText")
	var stringToSet = "Jumps Left: " + str(amount)
	textField.set_text(stringToSet)
