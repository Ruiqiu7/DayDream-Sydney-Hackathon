extends ColorRect
#Information label that appears in level 1 to iform players on game goals.

#At the beginning of the game the label is shown(visible)
func _ready() -> void: 
	show()

#When hide button is pressed, the label is hidden
func _on_hide_button_pressed() -> void:
	hide()
