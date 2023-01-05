extends Node

@export var goal: AudioStream
@export var bounce: AudioStream
@onready var sfx: AudioStreamPlayer = get_node("SFX")
@onready var left_score_label: Label = get_node("LeftScore")
@onready var right_score_label: Label = get_node("RightScore")
var left_score: int = 0
var right_score: int = 0

func _ready() -> void:
	get_node("LeftGoal").body_entered.connect(_on_left_goal_scored)
	get_node("RightGoal").body_entered.connect(_on_right_goal_scored)
	get_node("Ball").bounced.connect(_on_ball_bounced)

func _on_left_goal_scored(ball: PhysicsBody2D) -> void:
	right_score += 1
	right_score_label.text = str(right_score)
	_on_goal_scored()
	ball.reset()
	
func _on_right_goal_scored(ball: PhysicsBody2D) -> void:
	left_score += 1
	left_score_label.text = str(left_score)
	_on_goal_scored()
	ball.reset()
	
func _on_ball_bounced() -> void:
	sfx.stream = bounce
	sfx.play()
	
func _on_goal_scored() -> void:
	sfx.stream = goal
	sfx.play()
