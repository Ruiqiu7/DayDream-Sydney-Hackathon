extends CanvasLayer

var coins = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Coins.text = str(coins) 

 

func _on_coin_collected() -> void:
	coins = coins + 1
	_ready()


func _on_coins_2_coin_collected() -> void:
	pass # Replace with function body.
