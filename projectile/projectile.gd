extends Area2D

var DIRECTION: Vector2 = Vector2.ZERO
var SPEED = 1000
var _active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move
	var delta_pos = DIRECTION * SPEED
	position += delta_pos * delta
	
	# Detect collision
	if !_active:
		return
	if has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.get_collision_layer() == 2:
				print("player")
				apply_player_hit(body)
			if body.get_collision_layer() == 1:
				print("wall")
		queue_free()

func apply_impulse(dir: Vector2, speed = SPEED):
	DIRECTION = dir.normalized()
	SPEED = speed

func apply_player_hit(body : PhysicsBody2D):
	if !is_instance_valid(body):
		return
	for child in body.get_children():
		if child.has_method("apply_hit"):
			child.apply_hit()

func _on_body_exited(body):
	_active = true

