extends Control

func _ready() -> void:
	$BackgroundMusic1.play()

#"Start Game" b utton that when pressed, brings user into the Level 1 scene
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn") #Changes to the level 1 scene
