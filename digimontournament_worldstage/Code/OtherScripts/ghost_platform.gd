extends Node2D

class_name Ghost_Platform

## ONREADY FUNC
@onready var Normal = $sprite/Normal
@onready var hover = $sprite/Hover

@onready var sprite = $sprite

@onready var platform = preload("res://tscn/Home/platform.tscn")
@onready var manager = GameManager.window

func _ready() -> void:
	self.name = "Ghost_Platform"
	#print("parent:",self.get_parent())
	hover.visible = false 
	Normal.visible = true

func _on_area_2d_mouse_entered() -> void:
	hover.visible = true
	Normal.visible = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	#print("area:",area.get_parent())
	pass

func _on_area_2d_mouse_exited() -> void:
	hover.visible = false
	Normal.visible = true

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			manager._Build(self.global_position)

func _remove():
	self.queue_free()
