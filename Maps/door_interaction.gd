extends Area3D

var can_interact: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_onBodyEntered)
	body_exited.connect(_onBodyExited)
	pass # Replace with function body.

func _onBodyEntered(body) -> void:
	can_interact = true
	pass
	
func _onBodyExited(body) -> void:
	can_interact = false
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_interact:
		get_tree().change_scene_to_file("res://Maps/Hallway_BlockoutWithCam.tscn")
		pass
