extends CharacterBody3D

var speed = 2.5
var acceleration = 1.0

@export var player: Node3D

@onready var mesh = $Skeleton3D
@onready var nav: NavigationAgent3D = $NavigationAgent3D
var chasing = false

func _physics_process(delta: float) -> void:	
	if not chasing:
		return
	speed += acceleration * delta
	nav.target_position = player.global_position
	var next_position = nav.get_next_path_position()
	var direction = global_position.direction_to(next_position)

	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		mesh.rotation.y = atan2(player.global_position.x-global_position.x,player.global_position.z - global_position.z) + PI / 2.0
		mesh.rotation.y = atan2(direction.x,direction.z) + PI / 2.0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	move_and_slide()


func _on_area_3d_body_entered(_body: Node3D) -> void:
	get_tree().change_scene_to_file("res://end_screen.tscn")
