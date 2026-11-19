
extends Camera3D

@export var move_speed: float = 0.025
@export var min_x: float = -12.0
@export var max_x: float = 12.0
@export var min_z: float = 4.0
@export var max_z: float = 24.0

var touch_active := false
var last_touch_position := Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_active = true
			last_touch_position = event.position
		else:
			touch_active = false

	elif event is InputEventScreenDrag and touch_active:
		var delta := event.position - last_touch_position
		last_touch_position = event.position

		position.x = clampf(
			position.x - delta.x * move_speed,
			min_x,
			max_x
		)

		position.z = clampf(
			position.z - delta.y * move_speed,
			min_z,
			max_z
		)
