extends CharacterBody2D
class_name player_character

@export_enum("p1", "p2") var player_index: String
@onready var _held_effect_icon = $AbilityAvailableIcon/AbilityIcon
@onready var _animated_sprite = $AnimationPlayer

@onready var _dash_cooldown = $DashCooldown
@onready var dash_progress_bar = $DashProgressBar
var _other_player : player_character
var can_dash = true
var is_dashing = false
var dash_dir: Vector2
var dash_origin

var held_effect : Effect

@export var status : PlayerStatus

func _ready():
	status.connect("status_changed", _on_player_status_changed)
	status = status.duplicate()
	_animated_sprite.play("walk")
	_animated_sprite.sprite_frames.set_animation_loop("dash", false)
	
	var tree = get_tree()
	for node in get_tree().current_scene.get_children():
		if node is player_character && node != self:
			_other_player = node

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
		activate_held_effect(_other_player)
		var add_ability_activation
	if Input.is_action_just_pressed(player_index + "_ability_self"):
		activate_held_effect(self)

func dash():
	dash_dir = get_input().normalized()
	if dash_dir == Vector2.ZERO || !can_dash:
		return
	for dash_effect in status.dash_effects:
		dash_effect.before_dash(status)
	is_dashing = true
	dash_origin = position
	$Dash.play()
	_animated_sprite.play("dash", -1, 3.0)
	_animated_sprite.queue("idle")

func _physics_process(delta):
	dash_progress_bar.value = _dash_cooldown.time_left
	velocity = get_input() * status.character_speed
	if is_dashing:
		velocity = dash_dir * status.dash_speed
		if position.distance_to(dash_origin) >= status.dash_distance || get_slide_collision_count() > 0:
			is_dashing = false
			can_dash = false
			_dash_cooldown.start(status.dash_cooldown)
			for dash_effect in status.dash_effects:
				dash_effect.after_dash(status)
	elif velocity == Vector2.ZERO:
		if _animated_sprite.current_animation == "walk":
			_animated_sprite.play("idle")
		return
	else:
		if _animated_sprite.current_animation == "idle":
			_animated_sprite.play("walk")
	move_and_slide()

func activate_held_effect(target_player : player_character):
	held_effect.activate(target_player.status)
	_held_effect_icon.visible = false

func pickup(effect : Effect):
	held_effect = effect
	_held_effect_icon.texture = effect.icon
	_held_effect_icon.visible = true
	

func _on_player_status_changed():
	# shader related changes?
	scale = status.character_stretch

func _on_dash_cooldown_timeout():
	can_dash = true

func _on_health_hit_points_depleted():
	queue_free()

func _on_health_hit_points_changed(new_amount):
	if _animated_sprite:
		_animated_sprite.play("damage")
		_animated_sprite.queue("idle")

