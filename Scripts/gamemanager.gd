extends Node

@onready var score_label = $ScoreLabel
@onready var coins = $"../Coins"
@onready var lives_label = $"../CanvasLayer/LivesLabel"

var totalCoins: int
var coinsStr = "coins"
var score = 0
var mainPlayer: Player

func _ready():
	totalCoins = coins.get_child_count()
	
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func add_point():
	score += 1
	if score == 1:
		coinsStr = "coin"
	else:
		coinsStr = "coins"
	score_label.text = "You collected " + str(score) + " " + coinsStr + " out of " + str(totalCoins)
	print(score)
	
func _update_lives(lives):
	lives_label.text = "Lives " + str(lives)

