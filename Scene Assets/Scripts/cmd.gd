extends Sprite2D

@onready var animation_player = $AnimationPlayer
@onready var animation_player2 = $AnimationPlayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print(animation_player)
	if (anim_name == "appear"):
		animation_player.play("booting")
		animation_player2.play("loading")