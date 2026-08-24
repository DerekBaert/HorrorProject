extends Node3D

@onready var player = get_tree().get_first_node_in_group('Player')
@onready var camera = get_tree().get_first_node_in_group('Camera')
@onready var icon = $Icon

const base_text: String = "E to "

var active_areas = []
var can_interact = true

# Called by interaction areas when player enters them, adding themselves to queue of areas.
func register_area(area: InteractionArea):
	active_areas.push_back(area)
	pass

# Called by interaction areas when player exits, removing themselves from list.
func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	if(index == -1):
		active_areas.remove_at(index)
		pass
	pass
	
# Sorts nearest areas based on distance
func _process(delta):
	if(active_areas.size() > 0 and can_interact):
		active_areas.sort_custom(_sort_by_distance)
		if is_instance_valid(active_areas[0]):
			icon.global_position = active_areas[0].global_position
			icon.look_at(camera.global_position)
			icon.show()
			pass
	else:
		icon.hide()
	pass
pass

# Sorts areas based on their distance to the player.
func _sort_by_distance(area1,area2):
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player

# When player hits interact button, checks if they can interact and makes sure there 
# are interactable areas nearby before calling the interact function of nearest area.
func _input(event):
	if event.is_action_pressed("interact") and can_interact:
		if active_areas.size() > 0:
			can_interact = false
			icon.hide()
			
			await active_areas[0].interact.call()
			
			can_interact = true
			pass
		pass
	pass
	
