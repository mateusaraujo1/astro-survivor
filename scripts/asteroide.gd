extends Node2D

var chosen = 0
onready var velocidade_y = rand_range(30, 200)
onready var velocidade_x = rand_range(-60, 60)

signal destroied(node)

func _ready():
	randomize()
	#deixa mais aleatório, senão iria repetir os mesmos asteroides
	
	for a in $asteroides.get_children():
		a.visible = false
	#puxa todos os filhos do grupo "asteroides" e deixa invisiveis
	
	chosen = (randi() % $asteroides.get_child_count()) + 1
	#gera um numero aleatorio entre 1 e 5
	
	var node = get_node("asteroides/asteroid-" + str(chosen))
	node.visible = true
	#deixa um asteroide aleatório visível
	
	$area/shape.shape.radius = node.texture.get_width() / 2
	# pega a largura da textura (diametro), divide por 2 pra pegar o raio,
	# e faz a area shape (area de colisão) receber o mesmo raio
	# ou seja, area de colisão recebe o tamanho da textura


func _process(delta):
	translate(Vector2(velocidade_x, velocidade_y) * delta)
#faz o asteroide cair

	if global_position.x > 200:
		global_position.x = -40
	if global_position.x < -40:
		global_position.x = 200
	#quando asteroide some na lateral, aparece na outra lateral
	
	if global_position.y > 300:
		queue_free()


func _on_area_area_entered(area):
	get_tree().call_group("camera", "treme", 1)
	#chama o grupo camera, chama a funcao treme com valor 1
	#treme se destruir um asteroide (talvez tirar isso)
	emit_signal("destroied", self)
	queue_free()
	#asteroide some se bater em algo
