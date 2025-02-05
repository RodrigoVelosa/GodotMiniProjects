extends TileMapLayer

var speed: int = 250
var platform_size: int = 1
@onready var coin: PackedScene = preload("res://Platformers/InfiniteRunner/Scenes/Coin.tscn")

func set_platforms() -> void:
	for i in range(platform_size):
		set_cell(Vector2i(i, 0), 0, Vector2i(0, 0), 0)

func _physics_process(delta: float) -> void:
	position.x -= speed * delta

func add_coins() -> void:
	for i in platform_size:
		var coinTemp = coin.instantiate()
		coinTemp.position = map_to_local(Vector2i(i, 0)) + Vector2(0, -80)
		add_child(coinTemp)
