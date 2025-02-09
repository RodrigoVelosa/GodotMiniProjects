extends Node
class_name IdleState

@onready var player: Node = $"../.."

func reset_node() -> void:
	player.jump_count = 0
	player.can_dash = true
	player.anim.play("Idle")
	
func _physics_process(delta: float) -> void:
	if player.current_state == "Idle":
		if Input.is_action_just_pressed("move_right"):
			player.change_state("Move")
		elif Input.is_action_just_pressed("move_left"):
			player.change_state("Move")
		
		if Input.is_action_just_pressed("jump") and player.jump_count < player.max_jumps:
			player.jump_count += 1
			player.velocity.y = -player.jump_height * delta
			player.change_state("Jump")
		
		if Input.is_action_just_pressed("dash") and player.can_dash and player.is_on_floor():
			player.change_state("Dash")
		player.velocity.x = lerp(player.velocity.x, 0.0, player.friction)
