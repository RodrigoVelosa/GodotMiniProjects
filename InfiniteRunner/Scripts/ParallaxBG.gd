extends ParallaxBackground

@onready var speed: int = 50

func _process(delta: float) -> void:
	scroll_offset.x -= speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		$"../GameOver".game_over()
