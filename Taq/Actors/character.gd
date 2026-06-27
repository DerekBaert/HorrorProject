extends CharacterBody2D

func _physics_process(delta: float) -> void:
	position.y += 300 * delta
	move_and_slide()
