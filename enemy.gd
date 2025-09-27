extends CharacterBody2D

var speed = 50
var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true
signal lost_life

#Directing the enemy to flip when its direction of movement is changed. 
func _ready():
	if direction == 1:
		$jellyfish.flip_h = true
	$floorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floorChecker.enabled = detects_cliffs
	if not detects_cliffs:
		set_modulate(Color(1.2,0.5,1))

#Directing the enemy to flip when it hits a wall. 
func _physics_process(delta):
	if is_on_wall() or not $floorChecker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$jellyfish.flip_h = not $jellyfish.flip_h
		$floorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction

#The enemy's gravity and speed.
	velocity.y = 20
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_topChecker_body_entered(body):
	$jellyfish.play("dead")
	speed = 0 
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0,false)
	$topChecker.set_collision_layer_bit(4,false)
	$topChecker.set_collision_mask_bit(0,false)
	$sideChecker.set_collision_layer_bit(4,false)
	$sideChecker.set_collision_mask_bit(0,false)
	$Timer.start()
	$SoundEnemyOuch.play()
	
func _on_sideChecker_body_entered(body):
	body.ouch(position.x)
	emit_signal("lost_life")
	$SoundPlayerOuch.play()

func _on_Timer_timeout():
	queue_free()
