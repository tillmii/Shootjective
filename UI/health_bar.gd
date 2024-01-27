extends ProgressBar

@export var initial_values : initial_values

func _ready():
	max_value = initial_values.character_max_hit_points
	value = initial_values.character_start_hit_points

func update_value(new_value : int):
	value = new_value
