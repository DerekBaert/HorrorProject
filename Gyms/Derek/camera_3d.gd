extends Camera3D

@export var target: CharacterBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# var new_rot = lerp(transform.basis, transform.basis.looking_at(target.position), 1)
	# transform.basis.looking_at(target.position)
	look_at(target.position)
	pass
