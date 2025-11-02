extends Button

func _pressed() -> void:
	get_parent().queue_free()
	get_node("../../../World/Player").capture_mouse()
	game_state.started = true
