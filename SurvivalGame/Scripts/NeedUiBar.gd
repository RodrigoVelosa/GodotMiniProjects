extends ProgressBar

@export var need_name: String
@onready var text: Label = $NeedText

func update_value(new_value: float, max: float) -> void:
	max_value = max
	value = new_value
	text.text = str(need_name, ": ", int(value), " / " , int(max_value))
