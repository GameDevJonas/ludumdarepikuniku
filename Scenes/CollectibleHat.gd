extends Area2D

var scene_manager
@onready var my_animation : AnimationPlayer = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_manager = get_parent().get_node("CoreGameStuff/CanvasLayer2/SceneManager")

func on_player_enter(body : Node2D):
	my_animation.play("Collect")
	await(my_animation.current_animation_length)
