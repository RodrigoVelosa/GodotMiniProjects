extends AnimatedSprite2D

var direction

func _physics_process(delta: float) -> void:
	flip_h = direction < 0

	position.x -= direction
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.2)
	if modulate.a < 0.05:
		queue_free()
