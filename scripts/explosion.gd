extends Node2D


func _ready():
	$particles.emitting = true
	$sparks.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $particles.emitting and not $sparks.emitting:
		queue_free()
	#apaga as particulas de explosao e de faisca depois que elas emitem
