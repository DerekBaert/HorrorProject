extends Camera3D
var child_look_at
@export var speed = 5.0
@export var target: CharacterBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	child_look_at = Node3D.new()
	add_child(child_look_at)
	look_at(target.position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#look_at(target.position)
	pass
