extends Sprite

onready var nave = get_node("../ship");

func _ready():
	pass # Replace with function body.



func _process(delta):
	material.set_shader_param("deslocamento", (nave.global_position.x - 80) * 0.01)
#	fazer o movimento do background horizontal, 0.01 pra acontecer mais lento, -80 pra centralizar


	
