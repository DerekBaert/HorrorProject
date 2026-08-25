extends RigidBody3D

@export var dialogueBalloon:PackedScene
@export var dialogueResource:DialogueResource
@export var dialogueTitle:String
@onready var interaction_area: InteractionArea = $InteractionArea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self,"_trigger_interaction")
	pass # 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _trigger_interaction():
	print("Interaction Triggered")
	DialogueManager.show_dialogue_balloon_scene(
			dialogueBalloon.resource_path, load(dialogueResource.resource_path), dialogueTitle
			)
	pass
