extends Area2D

@export var scene_name : String


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if (body.name == "Player"):
		TransitionScreen.fade_in()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://Rooms/" + scene_name + ".tscn")
