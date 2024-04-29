extends Area2D

@onready var camera = $"../Player/Camera2D"
@onready var timer = $Timer
var player: Player

func _on_body_entered(body):
	print("You died!")
	#player = body as Player
	#player.SPEED = 0
	#player._launch_player()
	#camera.limit_bottom = 0
	#camera.limit_top = 0
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	

func _on_timer_timeout():
	#camera.limit_bottom = 1
	#camera.limit_top = 1
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
