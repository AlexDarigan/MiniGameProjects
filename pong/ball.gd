extends CharacterBody2D

signal bounced
@export var speed: int = 300
var multiplier: float = 1.0
var direction: Vector2 = Vector2(1, 0)

func _ready() -> void:
	reset()

func _physics_process(_delta: float) -> void:
	velocity = direction * speed * multiplier
	move_and_slide()
	if get_slide_collision_count() > 0:
		var groups: Array[StringName] = get_slide_collision(0).get_collider().get_groups()
		bounced.emit()
		if &"Boundary" in groups:
			direction.y = -direction.y
		elif &"Paddle" in groups:
			multiplier += 0.1
			randomize()
			direction.x = -direction.x
			direction.y = randf()

func reset() -> void:
	randomize()
	multiplier = 1.0
	direction.y = randf()
	direction.x = -direction.x
	position = get_tree().root.size / 2
