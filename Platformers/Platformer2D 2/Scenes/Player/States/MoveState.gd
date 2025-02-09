extends Node
class_name MoveState

@onready var player: Node = $"../.."

func reset_node() -> void:
	player.anim.play("Move")

func _physics_process(delta: float) -> void:
	if player.current_state == "Move":
		if Input.is_action_pressed("move_right"):
			var target_vel: float = min(player.velocity.x + player.acceleration * delta, player.max_speed * delta)
			player.velocity.x = lerp(player.velocity.x, target_vel, player.weight)
		elif Input.is_action_pressed("move_left"):
			var target_vel: float = max(player.velocity.x - player.acceleration * delta, -player.max_speed * delta)
			player.velocity.x = lerp(player.velocity.x, target_vel, player.weight)
		else:
			player.change_state("Idle")
			
		if Input.is_action_just_pressed("jump") and player.jump_count < player.max_jumps:
			player.jump_count += 1
			player.velocity.y = -player.jump_height * delta
			player.change_state("Jump")
			
		if Input.is_action_just_pressed("dash") and player.can_dash and player.is_on_floor():
			player.change_state("Dash")
