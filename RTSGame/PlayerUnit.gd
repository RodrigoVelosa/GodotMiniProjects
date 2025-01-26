extends Unit

@onready var selection_visual: Sprite2D = get_node("SelectionVisual")

func toggle_selecion_visual(toggle: bool):
	selection_visual.visible = toggle
