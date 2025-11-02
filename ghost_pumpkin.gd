extends Node3D

@onready var area = $Area3D
@onready var visibility = $VisibleOnScreenNotifier3D
@onready var model = $Sphere_001

@export var player: Node3D

var could_interact = false
var carried = false
var full = false

func _process(_delta: float) -> void:
	model.visible = player.carrying != null and not full and player.carrying.identifier == "pumpkin"
	if !model.visible:
		return
	var overlapping = area.get_overlapping_bodies() 
	var can_interact = overlapping and visibility.is_on_screen()
	if can_interact and !could_interact:
		ui.show_interact()
	elif !can_interact and could_interact:
		ui.hide_interact()
	could_interact = can_interact
	if can_interact and Input.is_action_just_pressed("interact"):
		var pumpkin = player.carrying
		full = true
		player.carrying = null
		pumpkin.identifier = "dead"
		pumpkin.reparent(self)
		pumpkin.position = Vector3.ZERO
		pumpkin.rotation = Vector3.ZERO
		pumpkin.scale = Vector3.ONE
		ui.hide_interact()
		game_state.pumpkins_placed += 1
		if game_state.pumpkins_placed >= 2:
			get_node("../TodoList").check(0)
		
