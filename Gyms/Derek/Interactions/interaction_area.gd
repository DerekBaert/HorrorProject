extends Area3D
class_name InteractionArea

@export var action_name: String = "interact"

var interact: Callable = func():
	print("Hello")
	pass

# When a body enters, it notifies the interaction manager to add it to the queue.
func _on_body_entered(body: Node3D) -> void:
	InteractionManager.register_area(self)	
	pass 

# When a body exits, it notifies the interaction manager to remove it from the queue.
func _on_body_exited(body: Node3D) -> void:
	InteractionManager.unregister_area(self)
	pass 
