extends StaticBody3D

const DOOR_WIDTH := 1.2

@export var animation_duration := 0.5 # segundos

var is_open : bool = false
var is_animating : bool = false


func toggle_open():
	if is_animating: return
	
	if is_open:
		_close()
	else:
		_open()


func _open():
	is_animating = true
	var final_position = position - Vector3(DOOR_WIDTH, 0, 0)
	
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position", final_position, animation_duration)
	tween.tween_callback(
		func():
			is_animating = false
			is_open = true
	)


func _close():
	is_animating = true
	var final_position = position + Vector3(DOOR_WIDTH, 0, 0)
	
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position", final_position, animation_duration)
	tween.tween_callback(
		func():
			is_animating = false
			is_open = false
	)
