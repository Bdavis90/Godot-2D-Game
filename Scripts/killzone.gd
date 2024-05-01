extends Area2D

#@onready var camera = $"../Player/Camera2D"
@onready var timer = $Timer

func _on_body_entered(body):
	print("You died!")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	

func _on_timer_timeout():
	#camera.limit_bottom = 1
	#camera.limit_top = 1
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
