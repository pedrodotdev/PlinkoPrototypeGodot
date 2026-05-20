extends Node

var ball_drop_location = Vector2(576, 40)
var ball_dropped := false
@export var ball_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#ball_drop_location = $Ball.global_position
	#$Ball.gravity_scale = 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and not ball_dropped:
		ball_drop_location = Vector2(event.position.x, 40)
		$Aim.position = ball_drop_location
		print(ball_drop_location)

	if event.is_action_pressed("drop_ball") and not ball_dropped:
		ball_dropped = true
		drop_ball()
		
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not ball_dropped:
		pass
		#$Ball.global_position = ball_drop_location
		
		
func drop_ball():
	var ball = ball_scene.instantiate()
	
	ball.position = ball_drop_location
	ball.gravity_scale = 1
	
	ball.hit.connect(_on_ball_hit)
	
	add_child(ball)



func _on_ball_hit(body) -> void:
	print(body.name)
	#if body.name == "BottomWall":
		#$Ball.physics_material_override.bounce = 0.01
	
