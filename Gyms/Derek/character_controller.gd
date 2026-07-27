extends CharacterBody3D

@export var forward_speed: float = 300.0
@export var backward_speed: float = 100.0
@export var turn_speed: float = 1.0
@export var tank_controls: bool = false
@onready var camera = $"../Camera3D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input(delta)
	move_and_slide()
	pass
	
func get_input(delta):
	if tank_controls:		
		var vy: float = velocity.y
		velocity = Vector3.ZERO
		var move: float = Input.get_axis("back", "forward")
		var turn: float = Input.get_axis("right", "left")
		if move < 0:
			velocity += -transform.basis.z * move * backward_speed  * delta
			pass
		elif move > 0:
			velocity += -transform.basis.z * move * forward_speed * delta
			pass
		rotate_y(turn_speed * turn * delta)
		velocity.y = vy
		pass
	else:
		camera.get_global_transform().basis.z 
		var vy: float = velocity.y
		velocity = Vector3.ZERO
		var raw_input := Input.get_vector("left", "right", "forward", "back")
		var forward = camera.global_basis.z
		var right = camera.global_basis.x		
		var move_direction = forward * raw_input.y + right * raw_input.x		
		move_direction.y = 0.0
		move_direction = move_direction.normalized()
		velocity = move_direction * forward_speed * delta
		pass
	pass
