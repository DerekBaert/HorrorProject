extends Node3D

@export var dialogueBalloon:PackedScene
@export var dialogueResource:DialogueResource
@export var dialogueCue:String

func _on_interaction_area_body_entered(body: Node3D) -> void:
	print("Entered")
	GlobalSignalAndState.canMove = false
	DialogueManager.show_dialogue_balloon_scene(dialogueBalloon,dialogueResource,dialogueCue)
	pass # Replace with function body.
