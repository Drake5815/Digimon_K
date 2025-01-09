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
var head:Platform = null

## FUNCTIONS
#ready
func _ready() -> void:
	for child in Base.get_children():
		if child.name.begins_with("Platform"):
			head = child
	
## LIST
#ADD
func add(pos, platform)->Platform:
	var new_platform = platform.instantiate()
	new_platform.node_RUp = null
	new_platform.node_RDown = null
	new_platform.node_LUp = null
	new_platform.node_LDown = null
	
	# if head is null create this as new head
	if head == null:
		head = new_platform
		return head
	
	if abs(pos-3) == 0:
		new_platform.node_RDown = platform
	if abs(pos-3) == 1:
		new_platform.node_LDown = platform
	if abs(pos-3) == 2:
		new_platform.node_RUp = platform
	if abs(pos-3) == 3:
		new_platform.node_LUp = platform
	
	return new_platform


#BUILD
func _BuildMode()->void:
	## if OBJECT:platform is visible add ghost build for visible areas
	pass

func Build()->void:
	pass

func createGhostPlatforms(platform, pos)->void:
	var GPlatform = GhostPlatform.instantiate()
	GPlatform.global_position = pos
	if pos.y < 0:
		GPlatform.sprite.set_z_index(-2)
	else:
		GPlatform.sprite.set_z_index(2)
	platform.add_child(GPlatform)



#process
func _process(delta: float) -> void:
	
		#place holder
		if Input.is_action_just_pressed("enter"):
			_BuildMode()
