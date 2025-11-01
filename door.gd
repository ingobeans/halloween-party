extends Node3D

@onready var animation = $AnimationPlayer
@onready var area = $Area3D
@onready var visibility = $door/VisibleOnScreenNotifier3D

var open = false
var locked = false
var could_interact = false

func _process(_delta: float) -> void:
	if locked:
		return
	var can_interact = !animation.is_playing() and area.get_overlapping_bodies() and visibility.is_on_screen()
	if can_interact and !could_interact:
		ui.show_interact()
	elif !can_interact and could_interact:
		ui.hide_interact()
	could_interact = can_interact
	if can_interact and Input.is_action_just_pressed("interact"):
		animation.play("close" if open else "open")
		open = !open
