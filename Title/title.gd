extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	TransitionScreen.fade_in()

func _on_transition_screen_on_transition_finished():
	print("test")
	get_tree().change_scene_to_file("res://game.tscn")


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Rooms/room_1.tscn")
