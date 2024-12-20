extends Node
@onready var cutscene_timer = $"Cutscene Timer"
@onready var command =$"../Camera2D/Command Prompt"
@onready var player = $"../Player"
@onready var target = $Target
@onready var camera_anim = $AnimationPlayer
@onready var vessel = $Sprite2D/body

signal stopped_moving

var cutscene_speed = 200
var move_player = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.can_control = false
	player.play_animations = false
	player.animated_sprite.play("shut off")
	TransitionScreen.fade_out_really_slow()
	cutscene_timer.start(6)
	await cutscene_timer.timeout
	command.play_appear()
	#command.visible = true
	await command.loading_finished
	command.start_typing("Hey! You there! I hope to god that worked... You there dude?")
	vessel.play()
	await command.typing_finished
	vessel.stop()
	command.visible = false
	cutscene_timer.start(0.2)
	await cutscene_timer.timeout
	player.animated_sprite.stop()
	player.animated_sprite.play("get up")
	await player.animated_sprite.animation_finished
	cutscene_timer.start(0.2)
	await cutscene_timer.timeout
	player.play_animations = true
	move_player = true
	
	await stopped_moving
	player.last_direction = -1
	camera_anim.play("camera")
	
	await camera_anim.animation_finished
	
	
	command.visible = true
	command.start_typing("I dont know what I should be saying I think Lucas could be saying what I need to say")
	vessel.play()
	await command.typing_finished
	cutscene_timer.start(0.1)
	await cutscene_timer.timeout
	command.start_typing("Anyway I think you should go on your quest now it would be really awesome now GO my beautiful baby boy!")
	await command.typing_finished
	vessel.stop()
	command.visible = false
	
	
	camera_anim.play("camera_rev")
	await camera_anim.animation_finished
	player.can_control = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (move_player):

		var direction = player.global_position.direction_to(target.position)
		player.velocity = direction * cutscene_speed
		player.move_and_slide()
		print("Target: " + str(target.position.x) + " Player: " + str(player.position.x))
		if (target.position.x - player.position.x <= 1):
			player.last_direction = -1
			player.velocity = direction * 0
			move_player = false
			print(player.last_direction)
			stopped_moving.emit()


func _on_room_transition_trigger_on_transition() -> void:
	print("hiii")
	camera_anim.play("audio_fade_out")
