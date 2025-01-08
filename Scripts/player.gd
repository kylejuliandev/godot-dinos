extends CharacterBody2D

class_name Player

@export var speed : int = 6000

var screen_size : Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size
	hide()

func _physics_process(delta: float) -> void:
	var input : Vector2 = get_input()
	player_movement(input, delta)
	move_and_slide()

func get_input() -> Vector2:
	var input : Vector2 = Vector2.ZERO
	var is_moving_right : bool = Input.is_action_pressed("ui_right")
	var is_moving_left : bool = Input.is_action_pressed("ui_left")
	var is_moving_down : bool = Input.is_action_pressed("ui_down")
	var is_moving_up : bool = Input.is_action_pressed("ui_up")
	
	input.x = int(is_moving_right) - int(is_moving_left)
	input.y = int(is_moving_down) - int(is_moving_up)
	
	return input.normalized()

func player_movement(input: Vector2, delta: float) -> void:
	if input == Vector2.ZERO:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play(&"idle")
	else:
		velocity = input * speed
		$AnimatedSprite2D.play(&"walk")
	
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	position = position.clamp(Vector2.ZERO, screen_size)

func start(pos: Vector2) -> void:
	position = pos
	rotation = 0
	$CollisionShape2D.disabled = false
	show()
