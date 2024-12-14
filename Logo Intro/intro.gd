extends VideoStreamPlayer

@onready var audio = $"../audio"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_timer_timeout():
	play()
	audio.play()




func _on_finished():
	get_tree().change_scene_to_file("res://game.tscn")
