extends Area2D

@export var node_to_toggle : CanvasItem

@export var star_animator : AnimationPlayer

var scene_manager

signal player_jumped_in_area

func _ready():
	scene_manager = get_parent().get_node("LevelArea/CanvasLayer/SceneManager")

#func _process(delta):
#	print(has_overlapping_bodies())

func _on_body_entered(body):
	body.on_jump.connect(on_jumped_in_area)

func _on_body_exited(body):
	body.on_jump.disconnect(on_jumped_in_area)

func on_jumped_in_area():
	player_jumped_in_area.emit()
	star_animator.play("Spin")
	if(node_to_toggle != null):
		node_to_toggle.visible = !node_to_toggle.visible
