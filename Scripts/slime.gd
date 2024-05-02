extends Area2D

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer

var player: Player
var direction = 1
var SPEED = 60

func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x += direction * delta * SPEED



func _on_body_entered(body):
	player = body
	if player:
		player.lives = player.lives - 1
		player.hurt_sound.play()
		print(player.lives)
		if player.lives <= 0:
			player.get_node("CollisionShape2D").queue_free()
		timer.start()
		player.isHurting = true


func _on_timer_timeout():
	if player.isHurting:
		player.isHurting = false
		return
	if player.lives <= 0:
		get_tree().reload_current_scene()
