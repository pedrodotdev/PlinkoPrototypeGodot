extends RigidBody2D
signal hit

@export var freeze_slow := 0.07
@export var freeze_time := 0.3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func freeze_engine() -> void:
	Engine.time_scale = freeze_slow
	await get_tree().create_timer(freeze_time * freeze_slow).timeout
	Engine.time_scale = 1.0


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Pins"):
		freeze_engine()
		var direction = [-1, 1].pick_random()
		apply_central_impulse(Vector2(direction * 25, 0))
	hit.emit(body)
