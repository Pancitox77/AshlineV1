extends RayCast3D

signal collided(collider)

var _last_collider: Object = null

func _physics_process(delta: float) -> void:
	var current = get_collider() if is_colliding() else null
	if current != _last_collider:
		current = _last_collider
		if current:
			collided.emit(current)
