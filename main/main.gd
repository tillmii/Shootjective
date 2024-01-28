extends Node2D

@export var lose_screen : PackedScene


func _on_player_tree_exited():
	var lose_screen_instance = lose_screen.instantiate()
	if not is_instance_valid(get_tree()):
		return
	else:
		get_tree().get_root().get_node("Main/HUD").add_child(lose_screen_instance)
		lose_screen_instance.find_child("Label").text = "Player 2 wins!"


func _on_player_2_tree_exited():
	var lose_screen_instance = lose_screen.instantiate()
	if not is_instance_valid(get_tree()):
		return
	else:
		get_tree().get_root().get_node("Main/HUD").add_child(lose_screen_instance)
		lose_screen_instance.find_child("Label").text = "Player 1 wins!"
