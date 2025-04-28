extends Node2D

func _on_button_pressed() -> void:
	var output = []
	var exit_code = OS.execute("powershell", ["-Command", "gc README.md", "-Tail 1"], output)
	print(output)


func _on_button_2_pressed() -> void:
	var output = []
	var exit_code = OS.execute("powershell", ["-Command", "code ."], output, false, true)
