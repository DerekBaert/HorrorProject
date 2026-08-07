extends RigidBody2D

@onready var area2d: Area2D = $Area2D
@export var itemResource: ItemResource
@export var itemUILayer:ItemUILayer


func interacted() -> void:
	itemUILayer.itemUITriggered.emit(itemResource)



#====================================================
### Dialogue Manager Route

#func _ready() -> void:
	#area2d.body_entered.connect(_onBodyEntered)
	#area2d.body_exited.connect(_onBodyExited)
#
#func _onBodyEntered(body)->void:
	#if body.is_in_group("Player"):
		#DialogueManager.show_dialogue_balloon_scene(
			#dialogueBalloon.resource_path, load(dialogueResource.resource_path), dialogueTitle
			#)
			#
#func _onBodyExited(body)->void:
	#print("exited")
	#if body.is_in_group("Player"):
		#if get_parent().get_node("ItemUI"):
			#get_parent().get_node("ItemUI").queue_free()
