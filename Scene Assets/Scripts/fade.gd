extends Node

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = false
	
	
func _on_animation_player_animation_finished(anim_name):
	
	if (anim_name == "fade_in"):
		print("fade in finished")
		on_transition_finished.emit()
		animation_player.play("fade_out")
	elif (anim_name == "fade_out"):
		color_rect.visible = false
		print("Faded out")
		

func fade_out():
	'''Fades from black to transparent'''
	color_rect.visible = true
	animation_player.play("fade_out")
	print(animation_player.current_animation)
	
func fade_in():
	'''Fades from transparent to black'''
	color_rect.visible = true
	animation_player.play("fade_in")
	print("WE ARE FADING IN!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_animation_player_animation_started(anim_name):
	print(anim_name)
