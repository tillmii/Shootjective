extends Node
class_name health

@export var max_hit_points : int
@export var start_hit_points : int
var current_hit_points : int

signal depleted

func _ready():
	current_hit_points = start_hit_points

func take_damage(damage_amount : int):
	if current_hit_points <= 0:
		return
	current_hit_points -= damage_amount
	if current_hit_points <= 0:
		depleted.emit()
