extends Node

## ONREADY VARIABLES
@onready var platform = "res://tscn/Home/platform.tscn"

## VARIABLES
#POSITION
var posRUp:Vector2 = Vector2(0,0)
var posRDown:Vector2 = Vector2(0,0)
var posLUp:Vector2 = Vector2(0,0)
var posLDown:Vector2 = Vector2(0,0)
var posUp:Vector2 = Vector2(0,0)
var posDown:Vector2 = Vector2(0,0)


## FUNCTIONS
#ready
func _ready() -> void:
	pass

#BUILD
func _BuildMode()->void:
	## if OBJECT:platform is visible add ghost build for visible areas
	pass

func Build()->void:
	pass

#process
func _process(delta: float) -> void:
	#place holder
	if Input.is_action_just_pressed("enter"):
		_BuildMode()
