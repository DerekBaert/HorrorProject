extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.current_animation = "Anim_AndrewIdle/Animation"
	pass

func _set_animation(animation):
	animation_player.current_animation = animation
	pass


func _on_character_body_3d_character_movement_changed(is_moving: bool) -> void:
	if(is_moving):
		animation_player.current_animation = "Anim_AndrewWalk/Animation"
	else:
		animation_player.current_animation = "Anim_AndrewIdle/Animation"
		pass
	pass # Replace with function body.
