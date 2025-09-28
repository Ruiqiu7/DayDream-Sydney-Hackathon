extends Node2D
func _ready() -> void:


	if Global.ghost == 2:
		Global.new_level ="res://ending_screen_saved_everyone.tscn"
	elif Global.ghost == 0:
		Global.new_level ="res://ending_screen_no_friends.tscn"
	else:
		Global.new_level ="res://ending_screen_some_friends.tscn"

		
	Global.current_level = "res://level_2.tscn"
