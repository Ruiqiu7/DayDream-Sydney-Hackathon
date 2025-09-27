extends CharacterBody2D

const SPEED = 300.0
var direction = -1

func _ready():
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	
func _physics_process(delta: float) -> void:
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
	
	velocity.y += 20
	
	velocity.x = SPEED*direction
	
	move_and_slide()
