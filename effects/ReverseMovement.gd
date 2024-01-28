extends Effect
class_name ReverseMovement

func activate(player_status : PlayerStatus):
	if player_status.character_reverse_movement == -1:
		player_status.character_reverse_movement = 1
	else:
		player_status.character_reverse_movement = -1
