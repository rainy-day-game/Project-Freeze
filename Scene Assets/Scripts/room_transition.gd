extends Area2D

@export var next_room : Sprite2D
@export var spawn_point : Node2D

@onready var camera = $"../../Camera2D"
@onready var player = $"../../Player"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	if (body.name == "Player"):
		print("transition")
		camera.position = next_room.position
		player.position.x = spawn_point.global_position.x
		print(camera.get_child(0).preprocess)
