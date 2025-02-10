extends Node2D

const PRE_ASTEROIDE = preload("res://scenes/asteroide.tscn")
const PRE_EXPLOSAO = preload("res://scenes/explosion.tscn")

export(NodePath) var nave

func _ready():
	restartTimer()



func _process(delta):
	pass


func _on_spawn_timer_timeout():
	#quando o timer acabar, vai criar o inimigo
	var asteroide = criar_asteroide()
	add_child(asteroide)
	asteroide.global_position = Vector2(rand_range(40, 120), -60)
	restartTimer()

func restartTimer():
	$spawn_timer.wait_time = rand_range(.2, 1)
	$spawn_timer.start()

func on_asteroide_destroied(asteroide):
	#se o asteroide destruido for grande, será partido em dois
	if asteroide.chosen >= 3:
		for a in range((randi() % 3) + 1):
			var asteroide_partido = criar_asteroide()
			asteroide_partido.chosen = (randi() % 2) + 1 #faz com que o asteroide partido seja o 1 ou 2 (pequeno)
			add_child(asteroide_partido)
			asteroide_partido.global_position = asteroide.global_position
			#a posicao dele ficará na posicao do antigo asteroide
		
	var explosao = PRE_EXPLOSAO.instance()
	add_child(explosao)
	explosao.global_position = asteroide.global_position
	#quando o asteroide é destruido, add a explosao
	
func criar_asteroide():
	var asteroide = PRE_ASTEROIDE.instance()
	asteroide.connect("destroied", self, "on_asteroide_destroied")
	return asteroide
