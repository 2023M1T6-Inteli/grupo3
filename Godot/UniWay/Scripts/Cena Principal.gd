extends Node2D


#Criação de variáveis para armazenar a quantidade de pontos e
#mostrar eles na tela
var quantidadesDePontos :int
var pontos :String

func _ready():
	#Começa a tocar o som do motor do caminhão 
	$KinematicBody2D/musicaDeFundo.play()
#Função que chama outras funções a cada frame do jogo
func _process(delta):
	placarPista()
	pauseMaskControlador()
	idiomaModificador()
	
	
	
	
#Essa função declara os pontos a partir da posição Y do caminhão,
#permite a visualização dos pontos na tela de jogo e
#armazena os pontos em uma variavel global
func placarPista():
	quantidadesDePontos = (-$"KinematicBody2D/CollisionShape2D/CaminhãoUnipar".global_position.y + 408)/5
	$"KinematicBody2D/Label".text = pontos + String(quantidadesDePontos)
	Global.pontosArmazenados = quantidadesDePontos
	
#Função que habilita e desabilita a cor para o menu de pause e para o tutorial
func pauseMaskControlador() ->void:
	if(Global.verificadorDePause == true):
		$carrinho/Area2D3/CollisionShape2D/Sprite/pauseMask.visible = true
		$buraco/Area2D3/CollisionShape2D/Buraco/pauseMask2.visible = true
		$ParallaxBackground/pauseMask2.visible = true
		$KinematicBody2D/Camera2D/Label.visible = false
	else:
		if Global.validadorDoTutorial == true:
			$carrinho/Area2D3/CollisionShape2D/Sprite/pauseMask.visible = true
			$buraco/Area2D3/CollisionShape2D/Buraco/pauseMask2.visible = true
			$ParallaxBackground/pauseMask2.visible = true
			$KinematicBody2D/Camera2D/Label.visible = true
		else:
			$carrinho/Area2D3/CollisionShape2D/Sprite/pauseMask.visible = false
			$buraco/Area2D3/CollisionShape2D/Buraco/pauseMask2.visible = false
			$ParallaxBackground/pauseMask2.visible = false
			$KinematicBody2D/Camera2D/Label.visible = false
			
#Função que modifica os textos de acordo com o idioma escolhido
func idiomaModificador():
	if Global.idiomaEscolhido == 0:
		$KinematicBody2D/Camera2D/Label.text = "Para movimentar utilize os comandos abaixo"
		$KinematicBody2D/Camera2D/Label/Label.text = "Pressione qualquer tecla para continuar"
		pontos = "Pontos "
	
	elif Global.idiomaEscolhido == 1:
		$KinematicBody2D/Camera2D/Label.text = "To move use the commands below"
		$KinematicBody2D/Camera2D/Label/Label.text = "Press any key to continue"
		pontos = "Score "
	
	elif Global.idiomaEscolhido == 2: 
		$KinematicBody2D/Camera2D/Label.text = "Para mover usa los siguientes comandos"
		$KinematicBody2D/Camera2D/Label/Label.text = "Pulse cualquier tecla para continuar"
		pontos = "Puntos "
		
	

