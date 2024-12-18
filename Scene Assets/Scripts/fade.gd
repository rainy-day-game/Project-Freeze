extends Node

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = false
	
	
func _on_animation_player_animation_finished(anim_name):
	
	if (anim_name == "fade_in"):
		on_transition_finished.emit()
		animation_player.play("fade_out")
	elif (anim_name == "fade_in_slow"):
		on_transition_finished.emit()
		animation_player.play("fade_out_slow")
	else:
		color_rect.visible = false
		

func fade_out():
	'''Fades from black to transparent for 0.2 sec'''
	color_rect.visible = true
	animation_player.play("fade_out")
	
func fade_out_slow():
	'''Fades from black to transparent for 1 sec'''
	color_rect.visible = true
	animation_player.play("fade_out_slow")
	
func fade_in():
	'''Fades from transparent to black for 0.2 sec'''
	color_rect.visible = true
	animation_player.play("fade_in")

func fade_in_slow():
	'''Fades from transparent to black for 1 sec'''
	color_rect.visible = true
	animation_player.play("fade_in_slow")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_animation_player_animation_started(anim_name):
	print(anim_name)
