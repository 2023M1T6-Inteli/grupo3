extends KinematicBody2D


#Criação de variáveis
var deslocamentoHorizontal: Vector2
var pararORelogio :float 
var tutorial :bool = true

#Função que tem como objetivo ser um timer para o tutorial inicial
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
	
#Função que permite a saída do tutorial ao pressionar qualquer botão
func _input(event):
	if event is InputEventKey:
		if event.pressed:
			tutorial = false
			
			
	
