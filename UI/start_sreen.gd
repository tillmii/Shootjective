extends Control





func _on_start_pressed():
	get_tree().change_scene_to_file("res://main/main.tscn")



func _on_close_pressed():
	get_tree().quit()
