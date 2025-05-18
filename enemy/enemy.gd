extends CharacterBody2D

class_name Enemy

@export_group("Vision Ranges")
@export var detection_radius := 100.0
@export var chase_radius := 200.0
@export var follow_radius := 25.0

#var area : Vector2
@export var area : CollisionShape2D
var sprite_frames : SpriteFrames

func _ready() -> void:
	#area = get_viewport_rect().size
	var rect = area.shape.get_rect()
	var x = rect.position.x
	var y = rect.position.y
	$AnimatedSprite2D.sprite_frames = sprite_frames
	#position = Vector2(randf_range(0, area.x), randf_range(0, area.y)) 
	position = Vector2(randf_range(x, x + (rect.size.x / 2)), randf_range(y, (rect.size.y / 2)))
	rotation = 0
	$CollisionShape2D.disabled = false

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	if velocity.length() > 0:
		$AnimatedSprite2D.play(&"walk")
	else:
		$AnimatedSprite2D.play(&"idle")
	
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	var rect = area.shape.get_rect()
	var x = rect.position.x
	var y = rect.position.y
	position = position.clamp(Vector2(x,y), Vector2(x + rect.size.x, y + rect.size.y))
