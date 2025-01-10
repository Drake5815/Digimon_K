class_name Platform
extends Node2D

## Path
var path_RUp:bool = false
var path_LUp:bool = false
var path_RDown:bool = false
var path_LDown:bool = false
## Array
var path = []
var internal_path = {}
## Raycasts
@onready var R_Up = $RUp
@onready var R_Down = $RDown
@onready var L_Up = $LUp
@onready var L_Down = $LDown

func _init() -> void:
	print(self)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		update_plaform()

func _set():
	

func update_plaform()->void:
	if R_Up.is_colliding():
		_nodePath(path_RUp)
	if R_Down.is_colliding():
		_nodePath(path_RDown)
	if L_Up.is_colliding():
		_nodePath(path_LUp)
	if L_Down.is_colliding():
		_nodePath(path_LDown)

func _nodePath(node:bool)->void:	
	node = true 

func _to_string() -> String:
	return "Platform"
