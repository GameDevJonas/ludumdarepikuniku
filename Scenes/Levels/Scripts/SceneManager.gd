extends Node

var scene_transition

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_transition = get_node("SceneTransition/SceneTransitionRect")
	
func load_scene(next_scene: String):
	scene_transition.transition_fade_in()
	await(scene_transition.transition_complete)
	get_tree().change_scene_to_file(next_scene)
	scene_transition.transition_fade_out()
	await(scene_transition.transition_complete)

func reload_scene():
	scene_transition.transition_fade_in()
	await(scene_transition.transition_complete)
	get_tree().reload_current_scene()
	scene_transition.transition_fade_out()
	await(scene_transition.transition_complete)

func quit_game():
	scene_transition.transition_fade_in()
	await(scene_transition.transition_complete)
	get_tree().quit()

func _on_area_2d_body_entered(body):
	pass # Replace with function body.
