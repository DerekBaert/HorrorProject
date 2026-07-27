extends Node3D

@export var character: Node3D
var chara
var canWalk:bool = false
var canSprint:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	chara = character.get_node("AnimationPlayer")
	chara.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if canWalk:
		character.position.z += 1.0 * delta
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		chara.play("Walk")
		canWalk = true
		
		
		#if canWalk && !canSprint:
			#chara.play("Walk")
			#canWalk = false
			#canSprint = true
		#
		#elif canSprint && !canWalk:
			#chara.play("Sprint")
			#canWalk = true
			#canSprint = false
			#
		#else:
			#chara.play("Idle")
