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
#Essa mudança na variável faz com que o caminhão sempre comece com vida cheia
	Global.vidaDoCaminhao = 4

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
	alteradorDeVelocidade()
	atualizadorDeVida()
	ajustadorDaVida()
	
	

#Função para realizar o movimento horizontal do caminhão
func movimentoHorizontal() -> void:
	#Realizar a movimentação horizontal
	var validacaodeMovimento: float = (Input.get_action_strength("ui_right") * limitadorHorizontalDireita) - (Input.get_action_strength("ui_left") * limitadorHorizontalEsquerda)
	velocidadeHorizontal.x = validacaodeMovimento * multiplicadordeVelocidadeHorizontal
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
	
	
#Essa função aumenta a velocidade do caminhão em condição do aumento de pontos
func alteradorDeVelocidade():
	if Global.pontosArmazenados <=2000:
		multiplicadordeVelocidadeHorizontal = 270
		multiplicadordeVelocidadeVertical = 500
		$velocimetro/AnimatedSprite.frame = 0
	elif Global.pontosArmazenados >= 2000 and Global.pontosArmazenados <= 5000:
		multiplicadordeVelocidadeVertical = 750
		$velocimetro/AnimatedSprite.frame = 1
	elif Global.pontosArmazenados >= 5000 and Global.pontosArmazenados <= 9000:
		multiplicadordeVelocidadeVertical = 1000
		multiplicadordeVelocidadeHorizontal = 320
		$velocimetro/AnimatedSprite.frame = 2
	elif Global.pontosArmazenados >= 9000 and Global.pontosArmazenados <= 14000:
		multiplicadordeVelocidadeVertical = 1250
		multiplicadordeVelocidadeHorizontal = 370
		$velocimetro/AnimatedSprite.frame = 3
	elif Global.pontosArmazenados >= 14000 and Global.pontosArmazenados <= 20000:
		multiplicadordeVelocidadeVertical = 1500
		multiplicadordeVelocidadeHorizontal =420
		$velocimetro/AnimatedSprite.frame = 4

func atualizadorDeVida():
	if Global.vidaDoCaminhao == 4:
		$barraDeVida/AnimatedSprite.frame = 0
	elif Global.vidaDoCaminhao == 3.5:
		$barraDeVida/AnimatedSprite.frame = 1
	elif Global.vidaDoCaminhao == 2.5:
		$barraDeVida/AnimatedSprite.frame = 2
	elif Global.vidaDoCaminhao == 1.5:
		$barraDeVida/AnimatedSprite.frame = 3
	elif Global.vidaDoCaminhao == 0:
		$barraDeVida/AnimatedSprite.frame = 4
		get_tree().change_scene("res://Cenas/Jornal1.tscn")
	
func ajustadorDaVida():
	if Global.vidaDoCaminhao == 3 or Global.vidaDoCaminhao == 2 or Global.vidaDoCaminhao == 1:
		$barraDeVida.global_position.y = $barraDeVida.global_position.y + 80
		Global.vidaDoCaminhao += 0.5
	if Global.vidaDoCaminhao == 0.5:
		Global.vidaDoCaminhao = 0
		

