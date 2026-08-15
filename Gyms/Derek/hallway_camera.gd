extends PathFollow3D

@export var target: CharacterBody3D
@export var endpoint: Node3D
var startpoint: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startpoint = target.position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var max = startpoint.distance_to(endpoint.position)
	var current = remap(target.position.distance_to(startpoint), 0, max, 0, 1)
	progress_ratio = current
	pass
