extends Node3D

var eventReady:bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignalAndState.itemUIHidden.connect(_onItemUIHidden)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _onItemUIHidden():
	if eventReady:
		eventReady = false
		print("Event Triggered")
		pass
	pass
