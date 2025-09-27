extends CharacterBody2D

const SPEED = 500.0 # const won't change throughout game
const JUMP_VELOCITY = -600

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
	
	var direction := Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, 20) # Slowly goes to 0 after user releases key by SPEED for gliding stop
		$AnimatedSprite2D.play("stand")

	move_and_slide()
		
