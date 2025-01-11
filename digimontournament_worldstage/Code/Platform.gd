extends Node2D

## Array
var other_platform = {path_RUp=false,path_RDown=false,path_LUp=false,path_LDown=false}
## Raycasts
@onready var R_Up = $RUp
@onready var R_Down = $RDown
@onready var L_Up = $LUp
@onready var L_Down = $LDown

func _ready() -> void:
	self.name = "Platform"

func update_platform()->void:
	if R_Up.is_colliding():
		_nodePath("path_RUp", true)
	if R_Down.is_colliding():
		_nodePath("path_RDown", true)
	if L_Up.is_colliding():
		_nodePath("path_LUp", true)
	if L_Down.is_colliding():
		_nodePath("path_LDown", true)

func _nodePath(path:String, value:bool)->void:
	other_platform[path] = value
