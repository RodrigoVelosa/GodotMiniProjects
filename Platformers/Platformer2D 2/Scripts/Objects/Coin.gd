extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		$Sprite.hide()
		Platformer2DGame.gold += 1
		$CoinAudio.play()


func _on_coin_audio_finished() -> void:
	queue_free()
