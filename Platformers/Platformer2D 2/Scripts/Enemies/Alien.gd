extends CharacterBody2D


const SPEED = 50.0

var change_dir: bool = true

@onready var ray_cliffcheck: RayCast2D = $CliffCheck
@onready var ray_wallcheck: RayCast2D = $WallCheck

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if (not ray_cliffcheck.is_colliding()) or (ray_wallcheck.is_colliding()):
		change_dir = !change_dir
		
	if change_dir:
		velocity.x = -SPEED
		$AnimatedSprite2D.flip_h = false
		ray_cliffcheck.position = Vector2(-9,0)
		ray_wallcheck.set_target_position(Vector2(-12, 0))
	else:
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = true
		ray_cliffcheck.position = Vector2(9,0)
		ray_wallcheck.set_target_position(Vector2(12, 0))

	move_and_slide()


func _on_head_damage_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		death()


func _on_player_damage_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		Platformer2DGame.health -= 1
		body.get_node("HitAudio").play()


func _on_death_finished() -> void:
	queue_free()

func death():
	position = Vector2(10000, 10000)
	$death.play()
