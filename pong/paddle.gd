extends CharacterBody2D

enum Player { LEFT, RIGHT }
@export var player: Player = Player.LEFT
@export var speed: int = 200
var direction: int = 0

func _physics_process(_delta: float) -> void:
	if player == Player.LEFT:
		left()
	else:
		right()
	velocity.y = direction * speed
	move_and_slide()
	

func left() -> void:
	if Input.is_key_pressed(KEY_W):
		direction = -1
	if Input.is_key_pressed(KEY_S):
		direction = 1
		
func right() -> void:
	if Input.is_key_pressed(KEY_UP):
		direction = -1
	if Input.is_key_pressed(KEY_DOWN):
		direction = 1
