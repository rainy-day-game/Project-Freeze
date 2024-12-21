extends Node2D

@onready var player = $"../Player"

func _on_area_2d_area_entered(body):
	if! Global.spikebutt:
		player.position = Global.last_spawnpoint.global_position
		print('my nuts')
	else:
		pass


func _process(delta):
	if Global.spikebutt:
		self.visible = false
	elif! Global.spikebutt: #this works smile
		self.visible = true
		for body in $Area2D.get_overlapping_bodies():
			if(body.name == "Player"):   # Check to see that overlap is Player layer
				player.position = Global.last_spawnpoint.global_position



func _on_area_2d_body_entered(body):
	if! Global.spikebutt and body.name == 'Player':
		player.position = Global.last_spawnpoint.global_position
		print('my nuts')
	else:
		pass
