extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# This node doesn't need to do anything when it first loads.
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the 'g' key was just pressed this frame.
	if Input.is_action_pressed("ghost"):
		# Only subtract a ghost if there are ghosts to remove.
		if Global.ghost > 0:
			Global.ghost -= 1
			if 	Global.current_level == "res://level_3.tscn":
					if Global.ghost == 3:
						Global.new_level ="res://ending_screen_saved_everyone.tscn"
					elif Global.ghost == 0:
						Global.new_level ="res://ending_screen_no_friends.tscn"
					else:
						Global.new_level ="res://ending_screen_some_friends.tscn"

			get_tree().change_scene_to_file(Global.new_level)
			
			
	# Check if the 'h' key was just pressed this frame.
	if Input.is_action_pressed("life"):
		Global.take_damage(1)		
		get_tree().change_scene_to_file(Global.new_level)
