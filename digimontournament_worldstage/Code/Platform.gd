class_name Platform
extends Node2D

## MANAGEMENT
@onready var h_management = HomeManager
## VARIABLES
# ONREADY

#Arrays
var Array_Position:Array = [posRUp, posRDown, posLUp, posLDown]

#Vector2 positions
var posRUp:Vector2 = Vector2(210,-78)
var posRDown:Vector2 = Vector2(210,78)
var posLUp:Vector2 = Vector2(-210,-78)
var posLDown:Vector2 = Vector2(-210,78)
##FUNCTIONS
func Update_ArrayPos()->void:
	pass

func Avail_ArrayPos()->bool:
	return false

func Spawn_Ghost_Platform()->void:
	pass

func _BuildMode()->void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		pass
