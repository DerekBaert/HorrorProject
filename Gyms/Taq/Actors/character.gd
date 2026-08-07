extends CharacterBody2D

@export var speed:float = 500
@onready var area2d: Area2D = $Area2D
@onready var icon: Label = $Label

#Interaction Variables
var canMove:bool = true
var canInteract:bool = false
var interactedItem
@export var itemUILayer:ItemUILayer

func _ready() -> void:
	icon.hide()
	area2d.body_entered.connect(_onBodyEntered)
	area2d.body_exited.connect(_onBodyExited)
	itemUILayer.itemUIHidden.connect(_onItemUIHidden)

# Character movement
func _physics_process(delta: float) -> void:
	position.y += 300 * delta
	move_and_slide()
	if canMove:
		walk(delta)
		interact()
		
		
func walk(delta)-> void:
	var direction = Input.get_axis("left","right")
	velocity = Vector2(direction * speed, position.y)
	

# Object interaction

func _onBodyEntered(body) -> void:
	if body.is_in_group("Interactable"):
		icon.show()
		canInteract = true
		interactedItem = body
		# Sanity check
		print("Object found")
		print(canInteract)
	
	
func _onBodyExited(body) -> void:
	if body.is_in_group("Interactable"):
		icon.hide()
		canInteract = false
		
		# Sanity check
		print("Object out of sight")
		print(canInteract)

# Emits signal upon Interacting
func interact()->void:
	if canInteract:
		if Input.is_action_just_pressed("interact"):
			canMove = false
			interactedItem.interacted()
			canInteract = false
			
			# Sanity check
			print("Interacted")

func _onItemUIHidden():
	canMove = true
