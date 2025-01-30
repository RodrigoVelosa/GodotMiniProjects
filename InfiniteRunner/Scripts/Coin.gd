extends Area2D


func _on_audio_stream_player_2d_finished() -> void:
	self.queue_free()


func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		get_node("Sprite").hide()          
		get_node("AudioStreamPlayer2D").play()
		InfiniteRunnerGame.score += 1
