extends RigidBody2D
signal hit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Pins"):
		var direction = [-1, 1].pick_random()
		apply_central_impulse(Vector2(direction * 25, 0))
	hit.emit(body)
