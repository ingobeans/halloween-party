extends Node3D

@onready var animation = $AnimationPlayer
@onready var area = $Area3D

var open = false

func _process(_delta: float) -> void:
	if !animation.is_playing() and Input.is_action_just_pressed("interact") and area.get_overlapping_bodies():
		animation.play("close" if open else "open")
		open = !open
