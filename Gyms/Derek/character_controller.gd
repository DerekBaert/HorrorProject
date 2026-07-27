extends CharacterBody3D

@export var forward_speed = 3.0
@export var backward_speed = 1.0
@export var turn_speed = 0.8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input(delta)
	move_and_slide()
	pass
	
func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	var move = Input.get_axis("back", "forward")
	var turn = Input.get_axis("right", "left")
	if move < 0:
		velocity += -transform.basis.z * move * backward_speed
		pass
	elif move > 0:
		velocity += -transform.basis.z * move * forward_speed
		pass
	# velocity += -transform.basis.z * move * speed
	rotate_y(turn_speed * turn * delta)
	velocity.y = vy
	pass
