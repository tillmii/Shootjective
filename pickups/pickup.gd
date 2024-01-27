extends Area2D
class_name pickup

signal collected

func _on_body_entered(body):
	collected.emit()
	queue_free()
