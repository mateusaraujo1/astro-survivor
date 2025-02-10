extends Node2D


func _ready():
	$particles.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $particles.emitting:
		queue_free()
	#apaga as particulas de explosao depois que elas emitem
