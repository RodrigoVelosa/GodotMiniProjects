extends Node
class_name FallState

@onready var player: Node = $"../.."

func reset_node() -> void:
	pass

func _physics_process(delta: float) -> void:
	if player.current_state == "Fall":
		if Input.is_action_just_pressed("move_right"):
			var target_vel: float = min(player.velocity.x + player.acceleration * delta, player.max_speed * delta)
			player.velocity.x = lerp(player.velocity.x, target_vel, player.weight)
		elif Input.is_action_just_pressed("move_left"):
			var target_vel: float = min(player.velocity.x - player.acceleration * delta, -player.max_speed * delta)
			player.velocity.x = lerp(player.velocity.x, target_vel, player.weight)
				
		if Input.is_action_just_pressed("jump") and player.jump_count < player.max_jumps:
			player.jump_count += 1
			player.velocity.y = -player.jump_height * delta
			player.change_state("Jump")

		if player.is_on_floor():
			player.change_state("Idle")
