extends KinematicBody2D

#Variável que armazena um valor (X,Y) do objeto
var velocidade: Vector2
#Variável do tipo verdadeiro ou falso que é ultilizada como um cronômetro
var validadorDoRelogio :bool = false

#Função que tem como objetivo ser um cronômetro
func _physics_process(delta):
	velocidade = move_and_slide(velocidade)
	velocidade.x = -400
	if self.global_position.x <= 0:
		validadorDoRelogio = true
		
 
