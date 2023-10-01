extends Node2D

@export var footstep_event : EventAsset
var footstep_instance : EventInstance
var is_playing_footsteps : bool = false

@export var jump_event : EventAsset
var jump_instance : EventInstance

@export var landed_event : EventAsset
var landed_instance : EventInstance

@export var fail_jump_event : EventAsset
var fail_jump_instance : EventInstance

func _ready():
	footstep_instance = RuntimeManager.create_instance(footstep_event)
	footstep_instance.start()
	
	jump_instance = RuntimeManager.create_instance(jump_event)
	
	landed_instance = RuntimeManager.create_instance(landed_event)	
	
	fail_jump_instance = RuntimeManager.create_instance(fail_jump_event)		

func _on_player_on_jump():
	jump_instance.stop(0)
	jump_instance.start()

func _on_player_on_fail_jump():
	fail_jump_instance.start()

func _on_player_on_landed():
	landed_instance.start()

func _on_player_on_velocity(velocity_value):
	if(velocity_value.y != 0):
		if(is_playing_footsteps):
			footstep_instance.stop(0)
			is_playing_footsteps = false
		return
	
	var footstep_value = 1
	var standing_still = velocity_value.x == 0
	if(standing_still):
		footstep_instance.set_parameter_by_name("Footstep_Level", 0, false)
		
		if(is_playing_footsteps):
			footstep_instance.stop(0)
			is_playing_footsteps = false
	else:
		if(!is_playing_footsteps):
			footstep_instance.start()
			is_playing_footsteps = true
		
		footstep_instance.set_parameter_by_name("Footstep_Level", 1, false)

