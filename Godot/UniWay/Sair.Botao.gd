extends KinematicBody2D


#Criação de variáveis para armazenar valores da movimentação horizontal e vertical do caminhão
var velocidadeHorizontal: Vector2
var multiplicadordeVelocidadeHorizontal = 750
var velocidadeVertical: Vector2
var multiplicadordeVelocidadeVertical: int = 2800
#Função de física padrão do Godot para chamar funções de movimento
# warning-ignore:unused_argument
func _physics_process(delta):
	movimentoHorizontal()
#Definindo a variavel movimento como slide para facilitar a detecção de colisões
	velocidadeHorizontal = move_and_slide(velocidadeHorizontal)
	velocidadeVertical = move_and_slide(velocidadeVertical)
	pass

#Função para realizar o movimento horizontal do caminhão
func movimentoHorizontal() -> void:
	#Realizar a movimentação horizontal
	var validacaodeMovimento: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocidadeHorizontal.x = validacaodeMovimento * multiplicadordeVelocidadeHorizontal
	#Realizar a movimentação vertical
	velocidadeVertical.y = - multiplicadordeVelocidadeVertical
	
