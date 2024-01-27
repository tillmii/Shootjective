extends CharacterBody2D

@export_enum("p1", "p2") var player: String
const SPEED = 300.0
@onready var _animated_sprite = $AnimatedSprite2D

func _ready():
	_animated_sprite.play("default")

func get_input():
	var input = Vector2.ZERO
	input.x = Input.get_action_strength(player + "_move_right") - Input.get_action_strength(player + "_move_left")
	input.y = Input.get_action_strength(player + "_move_down") - Input.get_action_strength(player + "_move_up")
	return input.normalized()

func _input(event):
	if Input.is_action_just_pressed(player + "_dash"):
		dash()
	if Input.is_action_just_pressed(player + "_shoot"):
		var trigger_shooting
	if Input.is_action_just_pressed(player + "_ability_enemy"):
		#placeholder
		var add_ability_activation
	if Input.is_action_just_pressed(player + "ability_self"):
		#placeholder
		var add_ability_activation

func dash():
	#placeholder
	var add_dash_function_pls

func _physics_process(delta):
	velocity = get_input() * SPEED
	move_and_slide()
