extends Node
class_name DashState

var dash_node: PackedScene = preload("res://Platformers/Platformer2D 2/Scenes/Player/DashNode.tscn")
@onready var player: Node = $"../.."

var pos: bool

func reset_node() -> void:
	pos = player.anim.flip_h
	player.can_dash = false
	if pos:
		player.velocity.x = 300
	else:
		player.velocity.x = -300
	await get_tree().create_timer(0.2).timeout
	
	player.change_state("Idle")
	
func _physics_process(delta: float) -> void:
	if player.current_state == "Dash":
		var dash_temp: Node = dash_node.instantiate()
		if pos:
			dash_temp.direction = -1
		else:
			dash_temp.direction = 1
		dash_temp.global_position = player.global_position
		player.get_parent().add_child(dash_temp)
