extends Node2D

var selected_unit: CharacterBody2D
var players: Array[CharacterBody2D]
var enemies: Array[CharacterBody2D]

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_try_select_unit()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_try_command_unit()

func _get_selected_unit() -> CharacterBody2D:
	var space = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = get_global_mouse_position()
	var intersection = space.intersect_point(query, 1)
	
	if intersection.is_empty():
		return null
	return intersection[0].collider

func _try_select_unit() -> void:
	var unit = _get_selected_unit()
	
	if unit != null and unit.is_player:
		_select_unit(unit)
	else:
		_unselect_unit()
	
func _select_unit(unit: CharacterBody2D) -> void:
	_unselect_unit()
	selected_unit = unit
	selected_unit.toggle_selection_visual(true)
	
func _unselect_unit() -> void:
	if selected_unit != null:
		selected_unit.toggle_selection_visual(false)
		
	selected_unit = null
	
func _try_command_unit() -> void:
	if selected_unit == null:
		return
	
	var target = _get_selected_unit()
	if target != null and target.is_player == false:
		selected_unit.set_target(target)
	else:
		selected_unit.move_to_location(get_global_mouse_position())
