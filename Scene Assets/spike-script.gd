extends Node2D

@onready var player = $"../Player"

func _on_area_2d_area_entered(body):
	if Global.spikebutt:
		player.position = Global.last_spawnpoint.global_position
		print('my nuts')
	else:
		pass


func die():
	player.play_animations = false
	player.can_control = false
	
	if (player.last_direction == 1):
		player.animated_sprite.play("death right")
	else:
		player.animated_sprite.play("death left")
	await player.animated_sprite.animation_finished
	
	TransitionScreen.fade_in()
	await TransitionScreen.on_transition_finished
	player.play_animations = true
	player.can_control = true
	player.position = Global.last_spawnpoint.global_position
	
func _process(delta):
	if Global.spikebutt and !self.visible:
		self.visible = true
		for body in $Area2D.get_overlapping_bodies():
			if(body.name == "Player"):   # Check to see that overlap is Player layer
				die()
	elif! Global.spikebutt: #this works smile
		self.visible = false


func _on_area_2d_body_entered(body):
	if Global.spikebutt and body.name == 'Player':
		
		die()
		print('my nuts')
	else:
		pass
