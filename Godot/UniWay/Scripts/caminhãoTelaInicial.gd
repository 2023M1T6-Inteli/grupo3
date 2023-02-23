extends KinematicBody2D

#Variaveis para armazenar valores de movimentação e
#validação da movimentação
var movimentoHorizontal: Vector2
var verificadorDeMovimento :bool

#Armazeno o valor na validação de movimento como false para
#o caminhão não ativar a movimentação no inicio da cena
func _ready():
	verificadorDeMovimento = false

#Após a validação de movimento estar permitida o caminhão se desloca até 
#o canto da tela que assim se satisfaz a condição de troca de cena
func _process(delta):
	if verificadorDeMovimento == true:
		movimentoHorizontal = move_and_slide(movimentoHorizontal)
		movimentoHorizontal.x = -900
		if $"caminhãoUnipar".global_position.x <= 0:
			#Animação de transição
			transitionScene.trocaDeCena()
			#Troca de cena
			get_tree().change_scene("res://Cenas/Checklist.tscn")
	
