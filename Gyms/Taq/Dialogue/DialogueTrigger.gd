extends RigidBody2D

@onready var area2d: Area2D = $Area2D
@export var dialogueBalloon:PackedScene
@export var dialogueResource:DialogueResource
@export var dialogueCue:String

func _ready() -> void:
	area2d.body_entered.connect(_onBodyEntered)
	
func _onBodyEntered(body)->void:
	if body.is_in_group("Player"):
		GlobalSignalAndState.canMove = false
		DialogueManager.show_dialogue_balloon_scene(dialogueBalloon,dialogueResource,dialogueCue)
