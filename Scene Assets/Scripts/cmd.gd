extends Sprite2D

@onready var animation_player = $AnimationPlayer
@onready var animation_player2 = $AnimationPlayer2
@onready var speech_text = $Speech/RichTextLabel
@onready var appear_sound = $Appear
@onready var type_sound = $Type
@onready var cont = $Speech/RichTextLabel2


@onready var loading_components = $Loading
@onready var speech_components = $Speech
@onready var timer = $Timer
signal loading_finished
signal typing_finished
signal appear_finished

var playing_text = false
var allow_skip = true
var text_speed = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loading_components.visible = true
	speech_components.visible = false

func play_appear():
	self.visible = true
	animation_player.play("appear")
	appear_sound.play()
	await animation_player.animation_finished
	appear_finished.emit()

func play_disappear():
	animation_player.play("disappear")
	appear_sound.play()
	await animation_player.animation_finished
	self.visible = false
	
func start_typing(text):
	loading_components.visible = false
	speech_components.visible = true
		
	speech_text.text = text
	speech_text.visible_characters = 0
	playing_text = true
	type_sound.play()

func disappear_continue():
	cont.visible = false

func appear_continue():
	cont.visible = true
	
func reset_text():
	speech_text.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (playing_text):
		speech_text.visible_ratio += 1.0/speech_text.text.length()/text_speed
		if (speech_text.visible_ratio >= 1):
			type_sound.stop()
		if (Input.is_action_just_pressed("continue") and speech_text.visible_ratio >= 1 and timer.is_stopped()):
			typing_finished.emit()
		elif Input.is_action_just_pressed("continue"):
			speech_text.visible_ratio = 1
			timer.start(0.2)
		
		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print(animation_player)
	if (anim_name == "appear"):
		animation_player.play("booting")
		animation_player2.play("loading")
	

func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "loading"):
		animation_player.stop()
		loading_finished.emit()
