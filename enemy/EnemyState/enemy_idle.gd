extends EnemyState
class_name EnemyIdle

var idle_timer : Timer

func enter() -> void:
	enemy.velocity = Vector2.ZERO
	
	idle_timer = Timer.new()
	idle_timer.wait_time = randi_range(3, 10)
	idle_timer.timeout.connect(on_timeout)
	idle_timer.autostart = true
	add_child(idle_timer)

func update(delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	try_chase()

func on_timeout():
	Transitioned.emit(self, "enemywander")

func exit():
	idle_timer.queue_free()
