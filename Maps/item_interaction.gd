extends Node3D

@onready var interaction_area: InteractionArea = $InteractionArea
@export var itemResource: ItemResource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self,"_on_interact")
	pass # Replace with function body.

func _on_interact():	
	GlobalSignalAndState.itemUITriggered.emit(itemResource)
	pass
