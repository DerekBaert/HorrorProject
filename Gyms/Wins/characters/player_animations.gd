extends Node3D

enum {IDLE,WALK}
var current_anim = IDLE
@onready var anim_tree: AnimationTree = $AnimationTree

func _process(delta: float) -> void:
	_handle_animations(delta)
	pass

func _handle_animations(delta):
	match current_anim:
		IDLE:
			anim_tree.set("parameters/Movement/transition_request","Idle")
			#walk_val = lerp(walk_val,0.0,blend_speed * delta)
		WALK:
			#walk_val = lerp(walk_val,1.0,blend_speed * delta)
			anim_tree.set("parameters/Movement/transition_request","Walk")
	pass

func _set_animation(animation):
	current_anim = animation
	pass
	
func _on_character_body_3d_character_movement_changed(is_moving: bool) -> void:
	if(is_moving):
		#animation_player.current_animation = "Anim_AndrewWalk/Animation"
		current_anim = WALK
	else:
		#animation_player.current_animation = "Anim_AndrewIdle/Animation"
		current_anim = IDLE
		pass
	pass # Replace with function body.
