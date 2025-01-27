extends Unit

@onready var selection_visual: Sprite2D = $SelecionVisual

func toggle_selection_visual(toggle: bool):
	selection_visual.visible = toggle
