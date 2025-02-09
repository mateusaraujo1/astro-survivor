extends Sprite

export(NodePath) var nave

var time = 0.0

func _ready():
	if nave:
		nave = get_node(nave)
	else:
		set_process(false)
		
	# se o background nao tiver o endereço da nave, o process nao será executado



func _process(delta):
	time += delta
	
	material.set_shader_param("deslocamento", (nave.global_position.x - 80) * 0.01)
#	fazer o movimento do background horizontal, 0.01 pra acontecer mais lento, -80 pra centralizar

	material.set_shader_param("time", time)
	
