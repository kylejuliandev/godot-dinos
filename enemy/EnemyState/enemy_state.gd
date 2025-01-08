extends Node
class_name EnemyState

signal Transitioned(state: EnemyState, name: String)

@onready var enemy : Enemy = get_owner()
var player : Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func try_chase() -> bool:
	if get_distance_to_player() <= enemy.detection_radius:
		Transitioned.emit(self, "enemychase")
		return true
	
	return false

func get_distance_to_player() -> float:
	return player.global_position.distance_to(enemy.global_position)
