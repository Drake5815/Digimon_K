extends Node2D

## ONREADY FUNC
@onready var Normal = $sprite/Normal
@onready var hover = $sprite/Hover

@onready var sprite = $sprite

func _ready() -> void:
	hover.visible = false 
	Normal.visible = true

func _on_area_2d_mouse_entered() -> void:
	hover.visible = true
	Normal.visible = false

func _on_area_2d_mouse_exited() -> void:
	hover.visible = false
	Normal.visible = true
