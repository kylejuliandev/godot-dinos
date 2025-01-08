extends EnemyState
class_name EnemyChase

@export var chase_speed := 75.0

func enter() -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	var direction := player.global_position - enemy.global_position
	
	var distance = direction.length()
	if distance > enemy.chase_radius:
		Transitioned.emit(self, "enemyidle")
		return
	
	enemy.velocity = direction.normalized() * chase_speed
	
	if distance <= enemy.follow_radius:
		enemy.velocity = Vector2.ZERO
