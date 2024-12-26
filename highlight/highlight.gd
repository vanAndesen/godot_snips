extends Node2D

@export var color: Color
@export var frame_buffer: float = 5
@export var frame_width: float = 5.0

@onready var _frame: float = frame_buffer + frame_width
@onready var _parent: Node = get_parent()
@onready var _size_x: float = _parent.texture.get_width()
@onready var _size_y: float = _parent.texture.get_height()


func _draw() -> void:
	var position_x = (_size_x /2) + (_frame /2)
	var position_y = (_size_y /2) + (_frame /2)
	draw_rect(
		Rect2(
		Vector2(-position_x, -position_y),
		Vector2(_size_x + _frame, _size_y + _frame)
		),
		color,
		false,
		frame_width)

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if get_parent().get_rect().has_point(to_local(event.position)):
			self.show()
		else:
			self.hide()
