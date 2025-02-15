extends Node2D

const PRE_LASER = preload("res://scenes/laser.tscn")

export var velocidade = 100.0
# valor pixels
#export para poder mudar o valor na outra tela

#posicao minima esquerda = 21
#posicao maxima direita = 139


export(NodePath) var lasers


#acontece só quando a nave aparece
func _ready():
	if lasers:
		lasers = get_node(lasers)
	else:
		lasers = get_parent()
#se tiver lasers vai usar o já existente

#essas ações acontecem 60x em um segundo
func _process(delta):
	
	var direcao_x = 0
	var direcao_y = 0
	
	# 1 seria 1 pixel
	if Input.is_action_pressed("ui_left"):
		direcao_x += -1
	# += pra poder zerar e a nave ficar parada, se as duas teclas forem pressionadas
	if Input.is_action_pressed("ui_right"):
		direcao_x += 1
		
	if Input.is_action_pressed("ui_up"):
		direcao_y += -1
		
	if Input.is_action_pressed("ui_down"):
		direcao_y += 1
		
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().get_nodes_in_group("lasers").size() < 7:
			#"lasers" é o grupo de lasers existentes (que estão visiveis na tela)
			#só pode disparar se houver menos de 7 tiros
			var laser = PRE_LASER.instance()
			lasers.add_child(laser)
			#adiciona laser como filho
			laser.global_position = $blaster.global_position 
	
	translate(Vector2(direcao_x, direcao_y) * velocidade * delta)
	
	#faz o x ficar entre 21 e 139
	global_position.x = clamp(global_position.x, 21, 139)
	global_position.y = clamp(global_position.y, 24, 266)	
	pass
