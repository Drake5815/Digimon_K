extends Node2D

## ONREADY FUNC
@onready var Normal = $Normal
@onready var hover = $Hover

@onready var area = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hover.visible = false 
	Normal.visble = true

func _process(delta: float) -> void:
	# mouse position
	var mousePos = get_viewport().get_mouse_position()
	#Space physics object / area
	#var space = get_world_2d().direct_space_state
	# on mouse hover
	#if space.intersect_point(mousePos, 1):
		#print("touching")
	#else:
		#print("none")
	if area.area_entered(mousePos):
		print("somehting")
