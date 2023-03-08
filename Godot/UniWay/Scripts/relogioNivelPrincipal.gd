extends KinematicBody2D



var deslocamentoHorizontal: Vector2
var pararORelogio :float 
var tutorial :bool = true


func _process(delta):
	if Global.verificadorDePause == true:
		pararORelogio = 0
	else:
		pararORelogio = 1
	deslocamentoHorizontal = move_and_slide(deslocamentoHorizontal)
	deslocamentoHorizontal.x = -2500 * pararORelogio
	if self.global_position.x <= 0 and tutorial:
		Global.validadorDoTutorial = true
	else:
		Global.validadorDoTutorial = false
		
func _input(event):
	if event is InputEventKey:
		if event.pressed:
			tutorial = false
			
			
	
