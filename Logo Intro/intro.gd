extends VideoStreamPlayer

@onready var audio = $"../audio"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_timer_timeout():
	'''Plays the video and audio track after a 0.2 second delay'''
	play()
	audio.play()




func _on_finished():
	'''Transition to title/game when video is finished'''
	
	get_tree().change_scene_to_file("res://Rooms/game.tscn")
