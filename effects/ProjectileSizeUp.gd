extends Effect
class_name ProjectileSizeChange

@export var multiplier : float = 0.5

func activate(player_status : PlayerStatus):
	player_status.projectile_size = player_status.projectile_size * multiplier
