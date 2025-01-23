extends Node2D

@export var color: Color
@export var frame_buffer: float = 5
@export var frame_width: float = 5.0

@onready var _frame: float = frame_buffer + frame_width
@onready var _parent: Node = get_parent()
@onready var _size = _parent.texture.get_size()


func _draw() -> void:
	draw_rect(
		Rect2(
		Vector2(-_size.x + -_frame, -_size.y + -_frame) / 2,
		Vector2(_size.x + _frame, _size.y +_frame)
		),
		color,
		false,
		frame_width,
		true)

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if get_parent().get_rect().has_point(to_local(event.position)):
			self.show()
		else:
			self.hide()
