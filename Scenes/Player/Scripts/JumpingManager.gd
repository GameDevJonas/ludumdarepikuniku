extends Node

@export var starting_jumps: int
@export var current_jumps: int

signal on_jumps_updated(amount)

func _ready():
	set_jumps(starting_jumps)

func get_current_jumps() -> int:
	return current_jumps
	
func on_jump() -> bool:
	if current_jumps > 0:
		set_jumps(current_jumps - 1)
		return true
	else:
		return false
					
func set_jumps(jumps_to_set: int):
	current_jumps = jumps_to_set
	on_jumps_updated.emit(current_jumps)
