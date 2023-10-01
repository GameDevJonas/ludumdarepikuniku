extends Area2D

@export var next_scene : String
var scene_manager
@onready var my_animation : AnimationPlayer = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_manager = get_parent().get_node("CoreGameStuff/SceneManagerCanvasLayer/SceneManager")

func on_player_enter(body : Node2D):
	my_animation.play("Collect_Hat")
	await(my_animation.animation_finished)
	scene_manager.load_scene(next_scene)
