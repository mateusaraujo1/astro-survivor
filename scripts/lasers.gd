extends Node2D


export(NodePath) var nave

func _ready():
	if nave:
		nave = get_node(nave)
	else:
		set_process(false)
#só executa o process se tiver a nave



func _process(delta):
	
	global_position.x = (nave.global_position.x - 80) * 0.002 * -160
	#movimento horizontal do que tem no cenario
	
	
#faz o laser e os inimigos se mover de acordo com o movimento da nave... 

