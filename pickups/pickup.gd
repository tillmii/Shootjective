extends Area2D
class_name pickup

signal collected

@export var icon: Texture2D
@export var effect: Effect

@onready var sprite = $Sprite2D

func _ready():
	sprite.texture = icon

func _on_body_entered(body):
	collected.emit()
	body as player_character
	if is_instance_valid(body.status):
		effect.activate(body.status)
	queue_free()

