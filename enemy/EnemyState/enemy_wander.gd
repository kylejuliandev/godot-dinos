extends EnemyState
class_name EnemyWander

@export var min_wander_time := 2.5
@export var max_wander_time := 10.0
@export var wander_speed := 50.0

var wander_direction : Vector2

var wander_timer : Timer

func enter() -> void:
	wander_direction = Vector2.UP.rotated(deg_to_rad(randf_range(0, 360)))
	wander_timer = Timer.new()
	wander_timer.wait_time = randf_range(min_wander_time, max_wander_time)
	wander_timer.timeout.connect(on_timer_finished)
	wander_timer.autostart = true
	add_child(wander_timer)

func update(delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	enemy.velocity = wander_direction*wander_speed
	enemy.move_and_slide()
	
	try_chase()

func on_timer_finished():
	Transitioned.emit(self, "enemyidle")

func exit():
	wander_timer.queue_free()
