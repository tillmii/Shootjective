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


func _physics_process(delta):
	velocity = get_input() * SPEED
	move_and_slide()