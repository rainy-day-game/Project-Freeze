extends Node2D

@onready var player = $"../Player"

func _on_area_2d_area_entered(body):
	if Global.spikebutt:
		player.position = Global.last_spawnpoint.global_position
		print(player.position)
	else:
		pass

func _process(delta):
	if Global.spikebutt:
		self.visible = true
	else:
		self.visible = false
