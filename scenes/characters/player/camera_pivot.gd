extends Node3D

@export_range(0.02, 0.40, 0.01) var mouse_sensitivity := 0.18  # grados por píxel

# límite de rotación en vertical, en radianes
const MIN_Y_ANGLE = -80 # grados
const MAX_Y_ANGLE = 75 # grados


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_handle_camera(event as InputEventMouseMotion)


func _handle_camera(ev: InputEventMouseMotion):
	# rotación horizontal
	var x_angle = -ev.relative.x * deg_to_rad(mouse_sensitivity)
	rotate_y(x_angle)
	
	# rotación vertical
	var y_angle = -ev.relative.y * deg_to_rad(mouse_sensitivity)
	rotate_object_local(Vector3.RIGHT, y_angle)
	
	# límite rotación vertical (en radianes)
	rotation.x = clamp(
		rotation.x,
		deg_to_rad(MIN_Y_ANGLE),
		deg_to_rad(MAX_Y_ANGLE)
	)
