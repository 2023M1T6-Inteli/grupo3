extends KinematicBody2D

#Variaveis para armazenar valores de movimentação e
#validação da movimentação
var movimentoHorizontal: Vector2
var verificadorDeMovimento :bool
var multiplicadorDeVelocidade :float

#Armazeno o valor na validação de movimento como false para
#o caminhão não ativar a movimentação no inicio da cena
func _ready():
	verificadorDeMovimento = false

#Após a validação de movimento estar permitida o caminhão se desloca até 
#o canto da tela que assim se satisfaz a condição de troca de cena
func _process(delta):
	if verificadorDeMovimento == true:
		movimentoHorizontal = move_and_slide(movimentoHorizontal)
		movimentoHorizontal.x = -900 * multiplicadorDeVelocidade
	if $"caminhãoUnipar".global_position.x <= -650:
		multiplicadorDeVelocidade = 0
		#Animação de transição
		yield(get_tree().create_timer(1.5), "timeout")
		transitionScene.trocaDeCena()
		#Troca de cena
		get_tree().change_scene("res://Cenas/salaSom.tscn")
	else:
		multiplicadorDeVelocidade = 1
	
