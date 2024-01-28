extends Resource
class_name PlayerStatus

signal status_changed

# Character
@export var character_speed: float
@export_enum("Invisible:0", "Default:1") var character_alpha: int
@export var character_stretch: Vector2
@export var character_color: Vector3
@export var character_hittable: bool
@export var character_vulnerable: bool
@export_enum("Inverse:-1", "Default:1") var character_reverse_movement: int
@export_enum("Inverse:-1", "Default:1") var character_inverse_shoot_direction: int
#var character_current_health

# Projectile
@export var projectile_speed: float
@export var projectile_size: Vector2
@export var projectile_cooldown: float
@export var projectile_effects: Array[ProjectileEffect]
#var sinus_projectile
#var split_projectile
#var arc_projectile
#var bouncing_projectile
#var red_shell_projectile

# Dash
@export var dash_distance: float
@export var dash_speed: float
@export var dash_cooldown: float
@export_enum("Invisible:0", "Default:1") var dash_visibility: int
@export var dash_effects: Array[DashEffect]
#var teleport_dash
#var invincable_dash
#var yoyo_dash

# General
#var freeze
#var swap_position
#var swap_abalities
