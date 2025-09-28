extends Area2D

signal coin_collected




func _on_body_entered(body: Node2D) -> void:
	emit_signal("coin_collected")
	queue_free() # Replace with function body.
