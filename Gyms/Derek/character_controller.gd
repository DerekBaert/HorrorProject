extends CharacterBody3D

signal characterMovementChanged(is_moving:bool)

@export var forward_speed: float = 50.0
@export var backward_speed: float = forward_speed * 0.5
@export var turn_speed: float = 1.0
@export var auto_turn_speed: float = 5.0
@export var tank_controls: bool = false
@onready var camera = get_tree().get_first_node_in_group('Camera')
@onready var interactionCheck = $ShapeCast3D
var dir

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	get_input(delta)
	move_and_slide()
	characterMovementChanged.emit(velocity != Vector3.ZERO)
	pass
	
func get_input(delta):
	if GlobalSignalAndState.canMove:
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
			# Reference: https://kidscancode.org/godot_recipes/4.x/3d/assets/character_controller/index.html
			#var vy: float = velocity.y
			# Zero out velocity at start
			velocity = Vector3.ZERO
			
			# Getting input
			var input := Input.get_vector("left", "right", "forward", "back")
			
			# Make sure input is not zero before setting direction, etc.
			if(input != Vector2.ZERO):
				## Check if the input button was just pressed, 
				# then set direction based on camera angle. This prevents player changing
				# direction as camera angle changes.
				if(Input.is_action_just_pressed("left") 
					or Input.is_action_just_pressed("right") 
					or Input.is_action_just_pressed("forward") 
					or Input.is_action_just_pressed("back")):
					dir = Vector3(input.x, 0, input.y).rotated(Vector3.UP, camera.rotation.y)
					pass
				# Rotate model in direction that the player is moving
				rotation.y = rotate_toward(rotation.y, Vector2(-dir.z, -dir.x).angle(), auto_turn_speed * delta)
				# Set velocity based on direction
				velocity = lerp(velocity, dir * forward_speed, delta)
				#velocity.y = vy
				pass			
			pass
		pass
	if Input.is_action_just_pressed("interact"):
		interactionCheck.interact()
		pass
	pass
