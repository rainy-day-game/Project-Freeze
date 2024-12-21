extends Node

@onready var audio = $"../../AnimationPlayer"
@onready var timer  = $"../../Timer"

# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScreen.fade_out_slow()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	TransitionScreen.fade_in()

func _on_transition_screen_on_transition_finished():
	print("test")
	get_tree().change_scene_to_file("res://game.tscn")


func _on_pressed() -> void:
	TransitionScreen.fade_in_slow()
	audio.play("fade_out_volume")
	await TransitionScreen.on_transition_finished
	timer.start(1)
	await timer.timeout
	get_tree().change_scene_to_file("res://Rooms/opening room.tscn")
