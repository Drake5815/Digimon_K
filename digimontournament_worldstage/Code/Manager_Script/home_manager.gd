extends Node


## ONREADY VARIABLES
@onready var Platform = preload("res://tscn/Home/platform.tscn")
@onready var GhostPlatform = preload("res://tscn/Home/GhostPlatform.tscn")

@onready var Base = $"."

## VARIABLES
#POSITION
var posRUp:Vector2 = Vector2(216,-120)
var posRDown:Vector2 = Vector2(216,78)
var posLUp:Vector2 = Vector2(-216,-120)
var posLDown:Vector2 = Vector2(-216,78)
#ARRAY
var platform_array = []

## FUNCTIONS
#ready
func _ready() -> void:
	for child in Base.get_children():
		if child.name.begins_with("Platform"):
			platform_array.append(child)

#BUILD
func _BuildMode()->void:
	## if OBJECT:platform is visible add ghost build for visible areas
	for i in platform_array.size():
		createGhostPlatforms(platform_array[i]) 

func Build()->void:
	pass

func createGhostPlatforms(platform)->void:
	var GhostPlatform01 = GhostPlatform.instantiate()
	var GhostPlatform02 = GhostPlatform.instantiate()
	var GhostPlatform03 = GhostPlatform.instantiate()
	var GhostPlatform04 = GhostPlatform.instantiate()
	GhostPlatform01.global_position = posRUp
	GhostPlatform02.global_position = posRDown
	GhostPlatform03.global_position = posLUp
	GhostPlatform04.global_position = posLDown
	
	GhostPlatform01.set_z_index(-1)
	GhostPlatform02.set_z_index(1)
	GhostPlatform03.set_z_index(-1)
	GhostPlatform04.set_z_index(1)
	
	platform.add_child(GhostPlatform01)
	platform.add_child(GhostPlatform02)
	platform.add_child(GhostPlatform03)
	platform.add_child(GhostPlatform04)

#process
func _process(delta: float) -> void:
	
	#place holder
	if Input.is_action_just_pressed("enter"):
		_BuildMode()
