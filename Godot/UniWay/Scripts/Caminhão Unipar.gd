extends KinematicBody2D



#Criação de variáveis para armazenar valores da movimentação horizontal e 
#vertical do caminhão
var velocidadeHorizontal: Vector2
var multiplicadordeVelocidadeHorizontal = 270
var velocidadeVertical: Vector2
var multiplicadordeVelocidadeVertical: int = 500
# Variáveis que realizam a limitação horizontal e de rotação do caminhão
var limitadorDeRotacionar :float
var limitadorHorizontalDireita :float
var limitadorHorizontalEsquerda :float

func _ready():
	#Essa mudança de valor da variável garante que o tutorial apareça se
	#não houver movimentação horizontal do caminhão
	Global.validadorDeMovimentoTutorial = true

#Função de física padrão do Godot para chamar funções de movimento
func _physics_process(delta):
	#Equação que armazena a posição do caminhão em uma variavél global
	Global.posicionamentoDoJogador = $"CollisionShape2D/CaminhãoUnipar".global_position.y;
	limiteHorizontal()
	movimentoHorizontal()
	#Definindo a variavel movimento como slide para facilitar a detecção de colisões
	velocidadeHorizontal = move_and_slide(velocidadeHorizontal)
	velocidadeVertical = move_and_slide(velocidadeVertical)
	#Realizar a movimentação vertical
	velocidadeVertical.y = - multiplicadordeVelocidadeVertical
	

#Função para realizar o movimento horizontal do caminhão
func movimentoHorizontal() -> void:
	#Realizar a movimentação horizontal
	var validacaodeMovimento: float = (Input.get_action_strength("ui_right") * limitadorHorizontalDireita) - (Input.get_action_strength("ui_left") * limitadorHorizontalEsquerda)
	velocidadeHorizontal.x = validacaodeMovimento * multiplicadordeVelocidadeHorizontal
	#Essa condição faz com q o tutorial não apareça
	if validacaodeMovimento != 0:
		Global.validadorDeMovimentoTutorial = false
	#Faz a rotação do caminhão na movimentação horizontal
	if (validacaodeMovimento > 0):
		$CollisionShape2D.rotation = 0.15 * limitadorDeRotacionar
	elif (validacaodeMovimento == 0):
		$CollisionShape2D.rotation = 0
	else:
		$CollisionShape2D.rotation = -0.15 * limitadorDeRotacionar


# Função que limita o movimento horizontal e a rotação do caminhão para
# não sair da rodovia
func limiteHorizontal() ->void:
# Condição que limita o movimento horizontal
	if global_position.x >= 10:
		global_position.x = 10
	elif global_position.x <= -586:
		global_position.x = -586
	
# Condição que limita a rotação do caminhão e
# Auxilia na limitação horizontal
	if global_position.x >= 9:
		limitadorDeRotacionar = 0
		limitadorHorizontalDireita = 0
	elif global_position.x <= -585:
		limitadorDeRotacionar = 0
		limitadorHorizontalEsquerda = 0
	else:
		limitadorDeRotacionar = 1
		limitadorHorizontalDireita = 1
		limitadorHorizontalEsquerda = 1
		

