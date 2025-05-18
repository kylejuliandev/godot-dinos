extends Node2D

@export var enemy_scene : PackedScene

@export var enemy_sprites : Array[SpriteFrames]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.start($StartPosition.position)
	for n in 4:
		var enemy = enemy_scene.instantiate()
		var new_enemy : Enemy = enemy
		var index : int = randi_range(0, enemy_sprites.size() - 1)
		new_enemy.sprite_frames = enemy_sprites[index]
		new_enemy.area = $Area2D/CollisionShape2D
		add_child(enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
