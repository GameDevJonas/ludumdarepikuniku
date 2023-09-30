extends Control

func _on_player_on_jumps_updated(amount):
	var textField = get_node("JumpAmountText")
	var stringToSet = "Current Jumps: " + str(amount)
	textField.set_text(stringToSet)
