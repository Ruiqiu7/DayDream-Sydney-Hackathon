extends CharacterBody2D

var direction: int = -1

func _ready():
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	
	
func _physics_process(_delta: float) -> void:
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
	
	velocity.y += 20
	
	velocity.x = 100 * direction
	
	move_and_slide()
