extends Node2D

var velocidade = 60
# 20 pixels

#acontece só quando a nave aparece
func _ready():
	pass 

#essas ações acontecem 60x em um segundo
func _process(delta):
	
	var direcao_x = 0
	var direcao_y = 0
	
	# 1 seria 1 pixel
	if Input.is_action_pressed("mv-esquerdo"):
		direcao_x += -1
	# += pra poder zerar e a nave ficar parada, se as duas teclas forem pressionadas
	if Input.is_action_pressed("mv-direito"):
		direcao_x += 1
		
	if Input.is_action_pressed("mv-cima"):
		direcao_y += -1
		
	if Input.is_action_pressed("mv-baixo"):
		direcao_y += 1
	
	translate(Vector2(direcao_x, direcao_y) * velocidade * delta)
	pass
