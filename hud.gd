extends CanvasLayer

@export var time_left = Global.allocated_time # Set the starting time in seconds
@export var health_textures: Array[Texture2D]
@export var ghost_texture: Texture2D
var new_coins =0
func _ready() -> void:
	update_coin_label()
	update_health_bar()
	update_time_label()
	update_ghost_display()
func update_ghost_display() -> void:
	$ghost.visible = (Global.ghost >= 1)
	$ghost2.visible = (Global.ghost >= 2)
	$ghost3.visible = (Global.ghost >= 3)
	
	# For example, if Global.ghost is 2:
	# - $GhostIcon1.visible becomes true (2 is >= 1)
	# - $GhostIcon2.visible becomes true (2 is >= 2)
	# - $GhostIcon3.visible becomes false (2 is not >= 3)
		



func update_coin_label() -> void:
	$Coins.text = str(Global.coins+new_coins )

func update_health_bar() -> void:
	var texture_index = Global.max_health - Global.health
	
	if texture_index >= 0 and texture_index < health_textures.size():
		$HealthBar.texture = health_textures[texture_index]
	if Global.health <= 0:
		pass## Game over scene to be implemented
func update_time_label() -> void:
	$TimeLabel.text = "Time: %d:%02d" % [time_left / 60, time_left % 60]

func _on_game_timer_timeout() -> void:
	time_left -= 1
	update_time_label()
	
	if time_left <= 0:
		$GameTimer.stop()
		Global.finished_on_time = false

	
func _on_coins_coin_collected() -> void:
	new_coins += 1
	update_coin_label()

func _on_portal_new_level() -> void:
	if Global.coins+ new_coins  >= Global.coins_required:
		Global.coins -= Global.coins_required-new_coins 
		
		update_coin_label()
		if not Global.finished_on_time:
			Global.finished_on_time = true
			get_tree().change_scene_to_file("sacrifice.tscn")

		else:
			get_tree().change_scene_to_file(Global.new_level)


func _on_fall_zone_body_entered(body: Node2D) -> void:
	Global.take_damage(1)
	new_coins =0
	get_tree().change_scene_to_file(Global.current_level)
	
	
