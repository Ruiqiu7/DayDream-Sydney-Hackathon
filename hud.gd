extends CanvasLayer

var coins = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Coins.text = str(coins) 

 

func _on_coin_collected() -> void:
	coins = coins + 1
	_ready()





		


func _on_portal_body_entered(body: Node2D) -> void:
	if coins >= 3:
	
		coins = coins - 3
		_ready()

		get_tree().change_scene_to_file("res://test.tscn")
