extends Node3D
# Manager for events triggered by item interactions. Not made global as it will only exist in the apartment.
var eventTriggers:bool
var event:EventResource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignalAndState.itemUITriggered.connect(_onItemUITriggered)
	GlobalSignalAndState.itemUIHidden.connect(_onItemUIHidden)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
# When item is triggered, store the Item Resource. 
# This will be used to check if it triggers an event when it closes, and the event it triggers.
func _onItemUITriggered(resource:ItemResource):
	if(resource.triggersEvent):
		eventTriggers = resource.triggersEvent
		event = resource.event
		pass
	pass
	
func _onItemUIHidden():
	# If event is triggered, chceck what type of event it is, and trigger it's respective event.
	# Currently only dialogue is working.
	if eventTriggers:
		if event.type == EventTypes.EventType.DIALOGUE:
			var dialogueEvent:DialogueEventResource = event
			dialogueEvent.dialogueResource
			DialogueManager.show_dialogue_balloon_scene("res://Gyms/Taq/Dialogue/DialogueBalloon.tscn",dialogueEvent.dialogueResource,"start")
			eventTriggers = false
			pass
		pass
	pass
