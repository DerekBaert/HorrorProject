extends Node2D
class_name ItemManager

signal itemUITriggered
@export var itemUI:PackedScene

func _ready() -> void:
	itemUITriggered.connect(_onItemUITriggered)
	
func _onItemUITriggered(resource) -> void:
	
	### BUG: Add child not working???
	
	print("Resource: ", resource)
	var UI = itemUI.instantiate()
	UI.item = resource
	print("UI: ", UI)
	add_child(UI)
	#print("Child count now: ", get_child_count())

###TEST
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("ui_accept"):
		#print(itemUI)
		#add_child(itemUI.instantiate())
