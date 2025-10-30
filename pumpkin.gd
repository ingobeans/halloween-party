extends Node3D

@onready var area = $Area3D
@onready var visibility = $VisibleOnScreenNotifier3D

var could_interact = false
var carried = false

func _process(_delta: float) -> void:
	var overlapping = area.get_overlapping_bodies() 
	var can_interact = overlapping and visibility.is_on_screen()
	if can_interact and !could_interact:
		ui.show_interact()
	elif !can_interact and could_interact:
		ui.hide_interact()
	could_interact = can_interact
	if can_interact and Input.is_action_just_pressed("interact"):
		overlapping[0].carry(self)
