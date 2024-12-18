extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var squat_timer = $"Squat Timer"
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var last_direction = 1
var started_jumping = false
var jump_up_start = false
var jump_down_start = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	print(position)
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	if (direction != 0):
		last_direction = direction
	move_and_slide()

func _process(delta):
	apply_movement_anim()
	apply_jump_anim() # Jump will override movement
	
func apply_movement_anim():
	'''Takes direction moving, and appplies the movement and animation'''
	
	
	if (velocity.x > 0 and velocity.y == 0): # Moving to the right
		animated_sprite.play("walk right")
	elif (velocity.x < 0 and velocity.y == 0): # Moving to the left
		animated_sprite.play("walk left")
	elif (velocity.x == 0 and velocity.y == 0): # Idle
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if (last_direction == 1):
			animated_sprite.play("idle right")
		else:
			animated_sprite.play("idle left")
			
func apply_jump_anim():
	'''Takes velocity, and determines whether to play squat, jump up, or fall down'''

	if (velocity.y < 0): # Moving up
		if (!started_jumping):
			squat_timer.start(0.1) # Start the squat timer
			started_jumping = true
		
		if (squat_timer.is_stopped()): # If squat timer has expired, play regular jump anim
			if (last_direction == 1):
				animated_sprite.play("jump right up")
			else:
				animated_sprite.play("jump left up")
		else: # Squat timer still going on, play the squatting animation
			if (last_direction == 1):
				animated_sprite.play("startup right")
			else:
				animated_sprite.play("startup left")
	elif (velocity.y > 0): # Falling down
			if (last_direction == 1):
				animated_sprite.play("fall right down")
			else:
				animated_sprite.play("fall left down")
	else:
		started_jumping = false # Jump has completed
	
