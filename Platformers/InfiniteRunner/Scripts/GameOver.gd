extends CanvasLayer

func game_over() -> void:
	get_tree().paused = true
	self.show()
	get_node("../GUI").hide()
	$FinalScore.text = "Final Score: " + str(InfiniteRunnerGame.score)


func _on_retry_pressed() -> void:
	InfiniteRunnerGame.score = 0
	get_tree().paused = false
	get_tree().reload_current_scene()
