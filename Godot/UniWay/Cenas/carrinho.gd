extends KinematicBody2D
# Declaração da variável que vai fazer o carro se movimentar.
var velocidade = Vector2()

# Abaixo está sendo definido o posicionamento do carro no eixo x, ao iniciar o jogo.
func _ready():
	$CollisionShape2D.position.x = 37
	
# Nessa parte é chamada as funções, que foram criadas no final do código.
func _physics_process(delta):
	movimentoCarrinho()
	voltaCarrinho()
	
# Criação de uma função para fazer o movimento do carro.
func movimentoCarrinho():
	velocidade.y = 300
	move_and_slide(velocidade)
	
# Essa parte do código faz com que o carro seja teletransportado para  cima, ao sair da tela.
func voltaCarrinho() ->void:
	if $CollisionShape2D.position.y >= Global.posicionamentoDoJogador + 500 :
		$CollisionShape2D.position.y = Global.posicionamentoDoJogador - 5000

	

