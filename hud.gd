extends CanvasLayer

@export var time_left = Global.allocated_time # Set the starting time in seconds
var new_coins =0
func _ready() -> void:
	update_coin_label()
	update_time_label()

func update_coin_label() -> void:
	$Coins.text = str(Global.coins+new_coins )

func update_time_label() -> void:
	$TimeLabel.text = "Time: %d:%02d" % [time_left / 60, time_left % 60]

func _on_game_timer_timeout() -> void:
	time_left -= 1
	update_time_label()
	
	if time_left <= 0:
		$GameTimer.stop()
		print("Time's up!")
		# Action for timer runs out

	
func _on_coins_coin_collected() -> void:
	new_coins += 1
	update_coin_label()

func _on_portal_new_level() -> void:
	if Global.coins+ new_coins  >= Global.coins_required:
		Global.coins -= Global.coins_required-new_coins 
		update_coin_label()
		get_tree().change_scene_to_file(Global.new_level)

func _on_fall_zone_body_entered(body: Node2D) -> void:
	new_coins =0
	get_tree().change_scene_to_file(Global.current_level)
