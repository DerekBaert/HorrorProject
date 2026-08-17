extends Node2D

# Need to change this to 3D
@onready var audioPlayer: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audioPlayer.finished.connect(_onAudioFinished)
	
func playGlobalAudio(audioToPlay:String)->void:
	if !audioToPlay || audioToPlay == "NA":
		print(audioToPlay)
		audioPlayer.stream = load("res://Gyms/Taq/Asset/Audio/Scoff.wav")
	else:
		audioPlayer.stream = load(audioToPlay)
	audioPlayer.play()
	
func _onAudioFinished()->void:
	print("GlobalAudio Finished")
