extends Node2D

var chosen = 0

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
	pass


func _on_area_area_entered(area):
	queue_free()
#asteroide some se bater em algo
