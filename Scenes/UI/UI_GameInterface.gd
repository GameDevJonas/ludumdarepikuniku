extends Control

var jumping_ui
@export var scene_manager : Node

func _ready():
	jumping_ui = get_node("JumpingUI")

func _on_player_on_jumps_updated(amount):
	jumping_ui._on_player_on_jumps_updated(amount)
	
func reload_level():
	scene_manager.reload_scene()
