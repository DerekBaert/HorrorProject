extends Node3D

@export var scene_path: String 
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var door_sound # = preload("sound path here")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self,"_on_interact")
	pass 

func _on_interact():
	get_tree().change_scene_to_file(scene_path)
	pass
