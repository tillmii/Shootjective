extends Node2D

@export var bounds_X : float = 400
@export var Bounds_up : float = -250
@export var bounds_down : float = 250

@export var pickup_scene : PackedScene

func _ready():
	spawn_pickup()

func spawn_pickup():
	randomize()
	var spawn_x = randf_range(-bounds_X, bounds_X)
	var spawn_y = randf_range(Bounds_up, bounds_down)
	var spawn_position = Vector2(spawn_x, spawn_y)
	
	var pickup_instance = pickup_scene.instantiate()
	pickup_instance as pickup
	pickup_instance.connect("collected", on_pickup_collected)
	get_tree().current_scene.add_child.call_deferred(pickup_instance)
	pickup_instance.global_position = spawn_position
	

func on_pickup_collected():
	spawn_pickup()
