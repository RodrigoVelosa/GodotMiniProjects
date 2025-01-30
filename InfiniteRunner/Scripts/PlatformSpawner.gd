extends Node

var platform_scene: PackedScene = preload("res://InfiniteRunner/Scenes/Platform.tscn")
var pool_size: int = 4
var platform_pool: Array = []

func _ready() -> void:
	for i in range(pool_size):
		var platformTemp: Node2D = platform_scene.instantiate()
		platformTemp.show()
		platformTemp.platform_size = 10
		platformTemp.set_platforms()
		platformTemp.position = Vector2(i * (40 * 3), 500)
		platform_pool.append(platformTemp)
		add_child(platformTemp)
		
func _physics_process(delta: float) -> void:
	if $"../Player".position.x < -100:
		$"../GameOver".game_over()
	
	#check for platforms off screen
	for platform in platform_pool:
		if platform.position.x < -400:
			reset_platform(platform)
			add_platform()
		
func create_platform() -> Node2D:
	for platform in platform_pool:
		if not platform.visible:
			return platform as Node2D
			
	var platformTemp: Node2D = platform_scene.instantiate()
	platformTemp.hide()
	platform_pool.append(platformTemp)
	add_child(platformTemp)
	return platformTemp as Node2D
	
func reset_platform(platform: Node2D) -> void:
	platform.global_position = Vector2(-1000, -1000)
	platform.hide()
	
func add_platform() -> void:
	for platform in platform_pool:
		if not platform.visible:
			var pos: int = platform_pool.find(platform)
			
			platform.platform_size = randi_range(20, 26)
			platform.position.y = randi_range(200, 500)
			
			var spawn_pos_x: float
			if pos > 0:
				spawn_pos_x = platform_pool[pos-1].global_position.x + (platform_pool[pos-1].platform_size * 40)-200
			else:
				spawn_pos_x = platform_pool[pool_size-1].global_position.x + (platform_pool[pool_size-1].platform_size * 40)-200
			
			platform.position.x = spawn_pos_x
			platform.set_platforms()
			platform.add_coins()
			platform.show()
