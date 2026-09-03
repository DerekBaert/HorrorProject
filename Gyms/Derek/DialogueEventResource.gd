extends EventResource
class_name DialogueEventResource

@export var dialogueResource:DialogueResource

func _ready():
	# Set type to Dialogue
	type = EventTypes.EventType.DIALOGUE
	pass
