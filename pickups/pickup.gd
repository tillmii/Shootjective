extends Area2D
class_name pickup

signal collected

@export var icon: Texture2D

@onready var sprite = $Sprite2D

func _ready():
	sprite.texture = icon

func _on_body_entered(body):
	collected.emit()
	queue_free()

