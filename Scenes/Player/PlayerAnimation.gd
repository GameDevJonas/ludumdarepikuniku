extends Sprite2D

var animation_tree: AnimationTree
var state_machine: AnimationNodeStateMachinePlayback

var sprite_2d: Sprite2D

func _ready():
	animation_tree = get_node("AnimationTree")
	state_machine = animation_tree["parameters/playback"]
	sprite_2d = get_parent().get_node("Sprite2D")


func _on_player_on_velocity(velocity_value):
	var going_right = velocity_value.x < 0
	if(velocity_value.x != 0):
		sprite_2d.flip_h = going_right
	
	# Falling
	if(velocity_value.y > 0):
		state_machine.travel("Player_Falling")
	# Jumping	
	elif(velocity_value.y < 0):
		state_machine.travel("Player_Jump")
	# Standing Still	
	elif(velocity_value.y == 0 && velocity_value.x == 0):
		state_machine.travel("Player_Idle")
	elif(velocity_value.x != 0):
		state_machine.travel("Player_Walk")	
