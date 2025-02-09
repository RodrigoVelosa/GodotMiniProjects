extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var max_speed: int = 8000
var acceleration: int = 1000
var jump_height: int = 15000
var direction: int = 0

var friction: float = 0.22
var weight: float = 0.35

var current_state: String = ""
var can_dash: bool = true
var max_jumps: int = 3
var jump_count: int = 0

func _ready() -> void:
	change_state("Idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		var target_vel: float = min(velocity.y + acceleration * delta, max_speed * delta)
		velocity.y = lerp(velocity.y, target_vel, 0.6)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")

	if direction < 0:
		anim.flip_h = false
	elif direction > 0:
		anim.flip_h = true
	move_and_slide()
	
func change_state(new_state_name: String) -> void:
	current_state = new_state_name
	for i in get_node("States").get_child_count():
		if new_state_name in get_node("States").get_child(i).name:
			get_node("States").get_child(i).reset_node
