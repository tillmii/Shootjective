extends Resource
class_name Effect

@export var name: String
@export var icon: Texture

func activate(player_status : PlayerStatus):
	pass

func deactivate_if_stacked(player_status : PlayerStatus, effects_array) -> bool:
	for effect in effects_array:
		if effect.name == name:
			effects_array.erase(effect)
			return true
	return false
