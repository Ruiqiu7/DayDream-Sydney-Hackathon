extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Display the initial coin count from the global script
	update_coin_label()

# A function to update the UI. This is better than calling _ready() again.
func update_coin_label() -> void:
	$Coins.text = str(Global.coins)

func _on_coin_collected() -> void:
	Global.coins += 1 # A shorter way to write Global.coins = Global.coins + 1
	update_coin_label()

func _on_portal_body_entered(body: Node2D) -> void:
	if Global.coins >= 3:
		Global.coins -= 3 # A shorter way to write Global.coins = Global.coins - 3
		update_coin_label()
		get_tree().change_scene_to_file("res://test.tscn")
