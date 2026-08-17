extends AnimationPlayer

@export var target: CharacterBody3D
@export var endpoint: Node3D
var startpoint: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startpoint = target.position
	play("hallway_camera")
	#pause()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var max = startpoint.distance_to(endpoint.position)
	var current = remap(target.position.distance_to(startpoint), 0, max, 0, 1)
	print(current_animation)
	#print(current_animation_length)
	seek(remap(current,0,1,0,current_animation_length))
	
	pass
