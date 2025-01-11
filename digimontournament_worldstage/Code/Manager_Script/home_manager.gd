extends Node


## ONREADY VARIABLES
@onready var platform = preload("res://tscn/Home/platform.tscn")
@onready var GhostPlatform = preload("res://tscn/Home/GhostPlatform.tscn")
@onready var popUp = preload("res://tscn/PopUp.tscn")

@onready var Base:Node2D = $"."

## VARIABLES
#ARRAY
var arrPlatform:Array = []

#MAX_SIZE
var size = 5

## FUNCTIONS
#ready
func _ready() -> void:
	for child in Base.get_children():
		if child.name.begins_with("Platform"):
			arrPlatform.append(child)

## POP-UP
func pop()->void:
	var init_pop = popUp.instantiate()
	#init_pop.global_position = Vector2(640, 360)
	self.add_child(init_pop)

## BUILD
func createGhostPlatforms(platform, pos)->void:
	var GPlatform = GhostPlatform.instantiate()
	GPlatform.global_position = pos
	platform.add_child(GPlatform)

#BUILD
func _BuildMode()->void:
	for plt in arrPlatform:
		plt.update_platform()
		for path in plt.other_platform.keys():
			if !plt.other_platform[path]:
				match path:
					"path_RUp":
						_createGhost(Vector2(210,-78),plt)
					"path_RDown":
						_createGhost(Vector2(210,78),plt)
					"path_LUp":
						_createGhost(Vector2(-210,-78),plt)
					"path_LDown":
						_createGhost(Vector2(-210,78),plt)

func _createGhost(vec:Vector2,platform):
	var inst_GPlatform = GhostPlatform.instantiate()
	inst_GPlatform.global_position = vec
	platform.add_child(inst_GPlatform)

func _Build(vec:Vector2)->void:
	var inst_platform = platform.instantiate()
	inst_platform.global_position = vec
	Base.add_child(inst_platform)
	
	arrPlatform.append(inst_platform)
	
	for plt in arrPlatform:
		for child in plt.get_children():
			if child.name.begins_with("Ghost_Platform"):
				child.queue_free()

#process
func _process(delta: float) -> void:
	#Constant check of size of array
	if Input.is_action_just_pressed("enter"):
		if arrPlatform.size() < 5:
			_BuildMode()
		else:
			pop()
