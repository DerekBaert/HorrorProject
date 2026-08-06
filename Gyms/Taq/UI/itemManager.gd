extends Node

signal itemUITriggered
@export var itemUI:PackedScene

func _ready() -> void:
	itemUITriggered.connect(_itemUITriggered)
	
	
func _itemUITriggered(resourcePath:String) -> void:
	var UI = itemUI.instantiate()
	add_child(UI)
	
#TEST
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_itemUITriggered("res://Gyms/Taq/UI/Items/Cat.tres")
	
