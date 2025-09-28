extends Node2D
func _ready() -> void:
	Global.new_level = "res://level_2.tscn"
	Global.current_level = "res://level_1.tscn"
	Global.allocated_time= 40
