extends Node2D

var velocidade = 200
#export(NodePath) var nave

func _ready():
#	if nave:
#		nave = get_node(nave)
#	else:
#		set_process(false)
	pass
 


func _process(delta):
	translate(Vector2(0, -1) * velocidade * delta)
#	global_position.x = (nave.global_position.x - 80) * 0.002 * -160


#quando o laser sair da visão da tela, será apagado
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	 

#esse sinal executa quando o laser bater em algo (no asteroide)
func _on_area_area_entered(area):
	queue_free() 
#em collision: layer é quem eu sou, mask é em quem eu bato
