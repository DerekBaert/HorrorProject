extends RigidBody3D

@export var dialogueBalloon:PackedScene
@export var dialogueResource:DialogueResource
@export var dialogueTitle:String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _trigger_interaction():
	print("Interaction Triggered")
	DialogueManager.show_dialogue_balloon_scene(
			dialogueBalloon.resource_path, load(dialogueResource.resource_path), dialogueTitle
			)
	pass
