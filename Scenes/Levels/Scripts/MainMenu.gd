extends Node

@onready var scene_manager = $SceneManager

@export var first_level_scene : PackedScene

func _on_main_menu_interface_quit_game_signal():
	scene_manager.quit_game()


func _on_main_menu_interface_start_game_signal():
	scene_manager.load_scene(first_level_scene)
