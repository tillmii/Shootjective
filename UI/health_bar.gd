extends ProgressBar

@export var initial_values : initial_values
@export var player : player_character
@export var player_health : health

func _ready():
	for child in player.get_children():
		if child is health:
			player_health = child
	player_health.hit_points_changed.connect(update_value)
	
	max_value = initial_values.character_max_hit_points
	value = initial_values.character_start_hit_points

func update_value(new_value : int):
	value = new_value
