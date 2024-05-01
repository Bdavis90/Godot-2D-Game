extends Node

var score = 0
@onready var score_label = $ScoreLabel
@onready var coins = $"../Coins"
var totalCoins: int
var coinsStr = "coins"

func _ready():
	totalCoins = coins.get_child_count()

func add_point():
	score += 1
	if score == 1:
		coinsStr = "coin"
	else:
		coinsStr = "coins"
	score_label.text = "You collected " + str(score) + " " + coinsStr + " out of " + str(totalCoins)
	print(score)
