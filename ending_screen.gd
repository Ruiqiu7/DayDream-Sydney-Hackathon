extends Control

func _ready() -> void:
	$BackgroundMusic2.play()

func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn") 
