extends Control

@onready var notificationLabel:Label =$ColorRect/MarginContainer/Label
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignalAndState.notificationTriggered.connect(_onNotificationTriggered)
	
func _onNotificationTriggered(notificationMessage)->void:
	notificationLabel.text = notificationMessage
	animationPlayer.play("Notify")
