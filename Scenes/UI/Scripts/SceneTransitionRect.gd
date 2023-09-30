extends ColorRect

@export var next_scene_path: PackedScene

@onready var _anim_player := $AnimationPlayer

signal transition_complete

# Called when the node enters the scene tree for the first time.
func _ready():
	_anim_player.play_backwards("Fade")

func transition_fade_in():
	_anim_player.play("Fade")
	await (_anim_player.animation_finished)
	transition_complete.emit()
	
func transition_fade_out():
	_anim_player.play_backwards("Fade")
	await (_anim_player.animation_finished)
	transition_complete.emit()
