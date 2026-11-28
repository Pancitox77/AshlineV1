extends Node3D

@onready var door = $Door

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		door.toggle_open()
