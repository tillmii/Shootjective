extends CharacterBody2D
class_name player_character

@export_enum("p1", "p2") var player_index: String
@onready var _animated_sprite = $AnimatedSprite2D

@onready var _dash_cooldown = $DashCooldown
var can_dash = true
var is_dashing = false
var dash_dir: Vector2
var dash_origin

@export var status : PlayerStatus

func _ready():
	_animated_sprite.play("walk")
	_animated_sprite.sprite_frames.set_animation_loop("dash", false)	

func get_player_index():
	return player_index

func get_input():
	var input = Vector2.ZERO
	input.x = Input.get_action_strength(player_index + "_move_right") - Input.get_action_strength(player_index + "_move_left")
	input.y = Input.get_action_strength(player_index + "_move_down") - Input.get_action_strength(player_index + "_move_up")
	return input.normalized()

func _input(event):
	if Input.is_action_just_pressed(player_index + "_dash"):
		dash()
	if Input.is_action_just_pressed(player_index + "_shoot"):
		var trigger_shooting
	if Input.is_action_just_pressed(player_index + "_ability_enemy"):
		#placeholder
		var add_ability_activation
	if Input.is_action_just_pressed(player_index + "_ability_self"):
		#placeholder
		var add_ability_activation

func dash():
	dash_dir = get_input().normalized()
	if dash_dir == Vector2.ZERO || !can_dash:
		return
	is_dashing = true
	dash_origin = position
	$Dash.play()
	_animated_sprite.play("dash")

func _physics_process(delta):
	velocity = get_input() * status.character_speed
	if is_dashing:
		velocity = dash_dir * status.dash_speed
		if position.distance_to(dash_origin) >= status.dash_distance || get_slide_collision_count() > 0:
			is_dashing = false
			can_dash = false
			_dash_cooldown.start(status.dash_cooldown)
	elif velocity == Vector2.ZERO:
		_animated_sprite.play("idle")
		return
	else:
		_animated_sprite.play("walk")
	move_and_slide()

func _on_dash_cooldown_timeout():
	can_dash = true

func _on_health_hit_points_depleted():
	queue_free()
