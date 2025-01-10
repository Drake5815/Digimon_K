extends Node2D

## ONREADY FUNC
@onready var Normal = $sprite/Normal
@onready var hover = $sprite/Hover

@onready var sprite = $sprite

@onready var platform = preload("res://tscn/Home/platform.tscn")
@onready var home = HomeManager

func _ready() -> void:
	hover.visible = false 
	Normal.visible = true

func _on_area_2d_mouse_entered() -> void:
	hover.visible = true
	Normal.visible = false

func _on_area_2d_mouse_exited() -> void:
	hover.visible = false
	Normal.visible = true

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			_changeObj()

func _changeObj()->void:
	print("Object")
	#var inst_platform = platform.instantiate()
	#inst_platform.global_position = self.global_position
	#home.add_child(inst_platform)
