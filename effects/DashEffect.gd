extends Effect
class_name DashEffect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Override
func before_dash(player_status: PlayerStatus):
	pass

func after_dash(player_status: PlayerStatus):
	pass
