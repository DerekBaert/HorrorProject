extends CharacterBody2D

@export var speed:float = 500
@onready var area2d: Area2D = $Area2D
@onready var icon: Label = $Label

#Interaction-related Variables
#var canMove:bool = true # Decides if player can move when interacting with objects
#var canInteract:bool = false # Decides if player can interact with objects
var interactedItem # A Bridging variable to pass on the interacted object


func _ready() -> void:
	icon.hide()
	area2d.body_entered.connect(_onBodyEntered)
	area2d.body_exited.connect(_onBodyExited)
	GlobalSignalAndState.itemUIHidden.connect(_onItemUIHidden)

# Character movement
func _physics_process(delta: float) -> void:
	position.y += 300 * delta
	move_and_slide()
	if GlobalSignalAndState.canMove:
		walk(delta)
		interact()
		
		
func walk(delta)-> void:
	var direction = Input.get_axis("left","right")
	velocity = Vector2(direction * speed, position.y)
	

# Object interaction

func _onBodyEntered(body) -> void:
	if body.is_in_group("Interactable"):
		icon.show()
		GlobalSignalAndState.canInteract = true
		interactedItem = body
		
		# Sanity check
		print("Object found")
		print(GlobalSignalAndState.canInteract)
	
func _onBodyExited(body) -> void:
	if body.is_in_group("Interactable"):
		icon.hide()
		GlobalSignalAndState.canInteract = false
		
		# Sanity check
		print("Object out of sight")
		print(GlobalSignalAndState.canInteract)


func interact()->void:
	if GlobalSignalAndState.canInteract:
		if Input.is_action_just_pressed("interact"):
			interactedItem.interacted() # Asks interacted object to emit signal
			GlobalSignalAndState.canMove = false
			GlobalSignalAndState.canInteract = false
			
			# Sanity check
			print("Interacted")

func _onItemUIHidden():
	GlobalSignalAndState.canMove = true
