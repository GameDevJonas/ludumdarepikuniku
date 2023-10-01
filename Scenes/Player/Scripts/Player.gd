extends CharacterBody2D

var jumping_manager

var trigger_when_grounded : bool = false

# variables
@export var speed: float
@export var jump_velocity: float = -800

signal on_jumps_updated(amount)
signal on_jump
signal on_fail_jump
signal on_velocity(velocity_value)
signal on_landed

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	jumping_manager = get_parent()

func _process(delta):
	if(trigger_when_grounded and is_on_floor()):
		trigger_grounded()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		trigger_when_grounded = true

	# Handle Jump.
	if Input.is_action_just_pressed("space"):
		if(is_on_floor() and get_jump()):
			velocity.y = jump_velocity
			on_jump.emit()
		elif(is_on_floor() and !get_jump()):
			on_fail_jump.emit()	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	on_velocity.emit(velocity)
	move_and_slide()
	
func get_jump() -> bool:
	return jumping_manager.on_jump()

func trigger_grounded():
	trigger_when_grounded = false
	on_landed.emit()


func _on_jumps_updated(amount):
	on_jumps_updated.emit(amount)
