extends Node

var window

func _ready() -> void:
	window = get_tree().root.get_child(get_child_count()+1)
