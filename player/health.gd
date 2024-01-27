extends Node
class_name health

@export var max_hit_points : int
@export var start_hit_points : int
var current_hit_points : int

signal hit_points_depleted
signal hit_points_changed(new_amount : int)

func _ready():
	current_hit_points = start_hit_points

func heal_by_amount(heal_amount : int):
	current_hit_points += heal_amount
	if current_hit_points > max_hit_points:
		current_hit_points = max_hit_points
	hit_points_changed.emit(current_hit_points)

func heal_fully():
	current_hit_points = max_hit_points
	hit_points_changed.emit(current_hit_points)

func take_damage(damage_amount : int):
	if current_hit_points <= 0:
		return
	current_hit_points -= damage_amount
	if current_hit_points <= 0:
		current_hit_points = 0
		hit_points_depleted.emit()
	hit_points_changed.emit(current_hit_points)
