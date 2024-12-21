extends Node

@onready var command = $"../Camera2D/Command Prompt"

var started = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_command_start_body_entered(body: Node2D) -> void:
	if (!started and body.name == "Player"):
		
		started = true
		command.reset_text()
		command.disappear_continue()
		command.text_speed = 1
		command.play_appear()
		await command.appear_finished
		
		command.start_typing("I have installed a jump module into your motherboard. Try it out by pressing [Z] on your keyboard")
		await command.typing_finished
		command.text_speed = 4


func _on_command_end_body_entered(body: Node2D) -> void:
	if (started and body.name == "Player"):
		command.play_disappear()
		
