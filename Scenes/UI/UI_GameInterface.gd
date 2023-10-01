extends Control

var jumping_ui

func _ready():
	jumping_ui = get_node("JumpingUI")

func _on_player_on_jumps_updated(amount):
	jumping_ui._on_player_on_jumps_updated(amount)
