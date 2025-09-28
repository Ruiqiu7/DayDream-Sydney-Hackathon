extends Node
var coins: int = 0
var new_level = "res://level_1.tscn"
var coins_required=3
var current_level = "res://level_1.tscn"
var allocated_time = 40
var max_health = 4
var health = 4
var ghost = 2
var finished_on_time = true

signal health_changed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func take_damage(amount):
	health -= amount
	health = clamp(health, -1, max_health)
	print(health)

	health_changed.emit()
	if health == -1:
		get_tree().change_scene_to_file("res://gameover.tscn")
		
		
	
func reset_health():
	health = max_health
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
