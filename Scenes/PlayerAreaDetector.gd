extends Area2D

@export var animation_player : AnimationPlayer
@export var animation_to_play : String

@onready var node_to_toggle : Sprite2D = get_node("Sprite2D")

@onready var star_animator : AnimationPlayer = get_node("PressurePadVisual/AnimationPlayer")

var scene_manager

signal player_jumped_in_area

func _ready():
	scene_manager = get_parent().get_node("CoreGameStuff/SceneManagerCanvasLayer/SceneManager")

#func _process(delta):
#	print(has_overlapping_bodies())

func _on_body_entered(body):
	body.on_jump.connect(on_jumped_in_area)

func _on_body_exited(body):
	body.on_jump.disconnect(on_jumped_in_area)

func on_jumped_in_area():
	player_jumped_in_area.emit()
	star_animator.play("Spin")
	node_to_toggle.visible = !node_to_toggle.visible
	if(!animation_player):
		return;
	animation_player.play(animation_to_play)	
