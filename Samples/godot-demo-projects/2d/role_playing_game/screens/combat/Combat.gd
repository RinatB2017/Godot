extends Node

signal combat_finished(winner, loser)
const Combatant = preload("res://turn_combat/combatants/Combatant.gd")

func initialize(combat_combatants):
	for combatant in combat_combatants:
		combatant = combatant.instance()
		if combatant is Combatant:
			$Combatants.add_combatant(combatant)
			combatant.get_node("Health").connect("dead", self, "_on_combatant_death", [combatant])
		else:
			combatant.queue_free()
	$UI.initialize()
	$TurnQueue.initialize()

func _on_combatant_death(combatant):
	var winner
	if not combatant.name == "Player":
		winner = $Combatants/Player
	else:
		for n in $Combatants.get_children():
			if not n.name == "Player":
				winner = n
				break
	finish_combat(winner, combatant)

func clear_combat():
	for n in $Combatants.get_children():
		n.queue_free()
	for n in $UI/Combatants.get_children():
		n.queue_free()

func finish_combat(winner, loser):
	emit_signal("combat_finished", winner, loser)
	
