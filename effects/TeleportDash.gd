extends DashEffect
class_name TeleportDash

var character_alpha
var character_hittable
#var character_vulnerable
var dash_speed

func before_dash(player_status: PlayerStatus):
	print("Before Woosh")
	character_alpha = player_status.character_alpha
	character_hittable = player_status.character_hittable
	#character_vulnerable = player_status.character_vulnerable
	dash_speed = player_status.dash_speed
	
	player_status.character_alpha = 0
	player_status.character_hittable = false
	# player_status.character_vulnerable = false
	player_status.dash_speed = 2400
	player_status.status_changed.emit()

func after_dash(player_status: PlayerStatus):
	player_status.character_alpha = 1
	player_status.character_hittable = character_hittable
	#player_status.character_vulnerable = character_vulnerable
	player_status.dash_speed = dash_speed
	player_status.status_changed.emit()

func activate(player_status : PlayerStatus):
	var is_stacked = deactivate_if_stacked(player_status, player_status.dash_effects)
	if !is_stacked:
		player_status.dash_effects.append(self)
