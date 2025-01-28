extends TileMapLayer

var speed: int = 100
var platform_size: int = 1

func _ready() -> void:
	for i in range(platform_size):
		set_cell(Vector2i(i, 0), 0, Vector2i(0, 0), 0)

func _physics_process(delta: float) -> void:
	position.x -= speed * delta
