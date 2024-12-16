extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var last_direction = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction = Input.get_axis("ui_left", "ui_right")
	apply_movement_anim(direction)
	move_and_slide()

func apply_movement_anim(direction):
	'''Takes direction moving, and appplies the movement and animation'''
	
	if (direction > 0): # Moving to the right
		animated_sprite.play("walk right")
		last_direction = 1
		velocity.x = direction * SPEED
	elif (direction < 0): # Moving to the left
		animated_sprite.play("walk left")
		last_direction = -1
		velocity.x = direction * SPEED
	else: # Idle
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if (last_direction == 1):
			animated_sprite.play("idle right")
		else:
			animated_sprite.play("idle left")
