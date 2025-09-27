extends CharacterBody2D

var coins = 0
const SPEED = 500.0
const JUMP_VELOCITY = -600.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	elif Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
			
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run")
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run")
		
	else:
		velocity.x = move_toward(velocity.x, 0, 50)
		$AnimatedSprite2D.play("idle")

	move_and_slide()
	
func add_coin() :
	coins = coins +1
	print(coins) 
