extends KinematicBody2D

var deslocamentoHorizontal: Vector2
var pararORelogio :float 
func _process(delta):
	if Global.verificadorDePause == true:
		pararORelogio = 0
	else:
		pararORelogio = 1
	deslocamentoHorizontal = move_and_slide(deslocamentoHorizontal)
	deslocamentoHorizontal.x = -400 * pararORelogio
	if self.global_position.x <= 0 and Global.validadorDeMovimentoTutorial == true and self.global_position.x >= -2000:
		Global.validadorDoTutorial = true
	else:
		Global.validadorDoTutorial = false
	
