extends Node2D

var quantidadesDePontos :int

#Função que chama outras funções a cada frame do jogo
func _process(delta):
	placarPista()
	pauseMaskControlador()
	
#Essa função declara os pontos a partir da posição Y do caminhão,
#permite a visualização dos pontos na tela de jogo e
#armazena os pontos em uma variavel global
func placarPista():
	quantidadesDePontos = (-$"KinematicBody2D/CollisionShape2D/CaminhãoUnipar".global_position.y + 408)/5
	$"KinematicBody2D/Label".text = "Pontos " + String(quantidadesDePontos)
	Global.pontosArmazenados = quantidadesDePontos
	
#Função que habilita e desabilita a cor para o menu de pause
func pauseMaskControlador() ->void:
	if(Global.verificadorDePause == true):
		$carrinho/Area2D3/CollisionShape2D/Sprite/pauseMask.visible = true
		$ParallaxBackground/pauseMask2.visible = true
	else:
		$carrinho/Area2D3/CollisionShape2D/Sprite/pauseMask.visible = false
		$ParallaxBackground/pauseMask2.visible = false
	
