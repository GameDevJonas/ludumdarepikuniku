extends CharacterBody2D

var jumping_manager

# variables
@export var speed: float = 300.0
@export var jump_velocity: float = -400.0

signal on_jumps_updated(amount)

signal on_velocity(velocity_value)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	jumping_manager = get_node("JumpingManager")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("space") and is_on_floor() and get_jump():
		velocity.y = jump_velocity

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


func _on_jumping_manager_on_jumps_updated(amount):
	on_jumps_updated.emit(amount)
