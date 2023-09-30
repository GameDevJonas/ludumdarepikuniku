extends Node

var scene_transition

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_transition = get_node("SceneTransition/SceneTransitionRect")
	
func load_scene(next_scene: PackedScene):
	scene_transition.transition_fade_in()
	await(scene_transition.transition_complete)
	get_tree().change_scene_to_packed(next_scene)
	scene_transition.transition_fade_out()
	await(scene_transition.transition_complete)

func quit_game():
	scene_transition.transition_fade_in()
	await(scene_transition.transition_complete)
	get_tree().quit()
