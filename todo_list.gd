extends Node3D

@export var checks: Array[Node3D]

func check(index:int):
	checks[index].visible = true
