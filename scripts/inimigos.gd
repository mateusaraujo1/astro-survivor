extends Node2D

const PRE_ASTEROIDE = preload("res://scenes/asteroide.tscn")

export(NodePath) var nave

func _ready():
	restartTimer()



func _process(delta):
	pass


func _on_spawn_timer_timeout():
	#quando o timer acabar, vai criar o inimigo
	var asteroide = PRE_ASTEROIDE.instance()
	add_child(asteroide)
	asteroide.global_position = Vector2(rand_range(40, 120), -60)
	restartTimer()

func restartTimer():
	$spawn_timer.wait_time = rand_range(.2, 1)
	$spawn_timer.start()
