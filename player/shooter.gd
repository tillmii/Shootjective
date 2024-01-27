extends Node

var player: CharacterBody2D
var player_index: String
var _projectile = preload("res://projectile/projectile.tscn")

@onready var _timer = $Timer
var _can_shoot: bool = true

var IMPULSE: int = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent()
	player_index = player.get_player_index()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.get_action_strength(player_index + "_shoot") == 1:
		_fire()

func get_input():
	var input = Vector2.ZERO
	input.x = Input.get_action_strength(player_index + "_aim_right") - Input.get_action_strength(player_index + "_aim_left")
	input.y = Input.get_action_strength(player_index + "_aim_down") - Input.get_action_strength(player_index + "_aim_up")
	return input.normalized()

func _fire():
	var input = get_input()
	if !_can_shoot || input == Vector2.ZERO:
		return
	
	_timer.start()
	_can_shoot = false
	
	var projectile_instance = _projectile.instantiate()
	projectile_instance.position = player.position
	projectile_instance.apply_impulse(input * IMPULSE)
	get_tree().root.add_child(projectile_instance)


func _on_timer_timeout():
	_can_shoot = true
