extends CharacterBody2D

var direction: int = -1
var speed: int = 100

func _ready():
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.size.x * direction 
	
func _physics_process(_delta: float) -> void:
	if is_on_wall() or not $floor_checker.is_colliding() and is_on_floor(): # Detects if the enemy has hit a wall or 
		direction = direction * -1
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.size.x * direction 
	velocity.y += 20
	
	velocity.x = speed * direction
	
	move_and_slide()




func _on_top_checker_body_entered(body: Node2D) -> void:
	print("here")# Replace with function body.
