extends Button

var combat_action : CombatAction

# called when we press the button
# cast the stored combat action
func _on_pressed():
	get_node("/root/BattleScene").cur_char.cast_combat_action(combat_action)
