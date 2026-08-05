extends CharacterBody2D

@export var speed:float = 500

func _physics_process(delta: float) -> void:
	position.y += 300 * delta
	walk(delta)
	move_and_slide()


func walk(delta)-> void:
	var direction = Input.get_axis("left","right")
	velocity = Vector2(direction * speed, position.y)
	
	
