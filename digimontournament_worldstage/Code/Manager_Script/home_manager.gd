extends Node


## ONREADY VARIABLES
@onready var platform = preload("res://tscn/Home/platform.tscn")
@onready var GhostPlatform = preload("res://tscn/Home/GhostPlatform.tscn")

@onready var Base = $"."

## VARIABLES
#POSITION
var posRUp:Vector2 = Vector2(210,-78)
var posRDown:Vector2 = Vector2(210,78)
var posLUp:Vector2 = Vector2(-210,-78)
var posLDown:Vector2 = Vector2(-210,78)
#ARRAY
var arrPlatform:Array = []

## FUNCTIONS
#ready
func _ready() -> void:
	for child in Base.get_children():
		if child.name.begins_with("Platform"):
			arrPlatform.append(child)

## LIST
#ADD
func createPlatform()->void:
	pass

func createGhostPlatforms(platform, pos)->void:
	var GPlatform = GhostPlatform.instantiate()
	GPlatform.global_position = pos
	platform.add_child(GPlatform)

#BUILD
func _BuildMode()->void:
	for plt in arrPlatform:
		for path in plt.raycast:
			print(plt, path)

func Build()->void:
	pass

#process
func _process(delta: float) -> void:
	
		#place holder
		if Input.is_action_just_pressed("enter"):
			_BuildMode()
