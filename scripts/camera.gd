extends Camera2D

var time = 0
var forca = 0

func _ready():
	pass 


func _process(delta):
	if forca > 0:
		time += delta * 100
		#velocidade que gira/treme
		
		global_position = Vector2(forca, forca).rotated(time)
		#faz a camera girar/tremer
		
		forca = lerp(forca, 0, .05)
	
	#lerp faz ir de um valor (param 1) a outro valor (param 2) gradualmente (param 3)
	#ou seja, faz o tremer ir parando aos poucos
	
#	if Input.is_action_just_pressed("ui_cancel"):
#		treme(1)

func treme(tremor):
	forca = tremor
