extends Node2D


#Criação de variáveis para armazenar a quantidade de pontos e
#mostrar eles na tela
var quantidadesDePontos :int
var pontos :String

func _ready():
	#Começa a tocar o som do motor do caminhão 
	Global.verificadorGarantirPontos = false
	#condição que faz tocar o som do motor do carro
	#if Global.verificadorGarantirPontos == false:
		#$somDoMotor.play()
	
#Função que chama outras funções a cada frame do jogo
func _process(delta):
	placarPista()
	controladorDaMascaraDePause()
	idiomaModificador()
	
	
	
	
#Essa função declara os pontos a partir da posição Y do caminhão,
#permite a visualização dos pontos na tela de jogo e
#armazena os pontos em uma variavel global
func placarPista():
	quantidadesDePontos = (-$"KinematicBody2D/CollisionShape2D/CaminhãoUnipar".global_position.y + 408)/5
	$"KinematicBody2D/Label".text = pontos + String(quantidadesDePontos)
	Global.pontosArmazenados = quantidadesDePontos
	
#Função que habilita e desabilita a cor para o menu de pause e para o tutorial
func controladorDaMascaraDePause() ->void:
	if(Global.verificadorDePause == true):
		$carrinho/Area2D3/CollisionShape2D/Sprite/pauseMask.visible = true
		$buraco/Area2D3/CollisionShape2D/Buraco/pauseMask2.visible = true
		$ParallaxBackground/pauseMask2.visible = true
		$KinematicBody2D/Camera2D/Label.visible = false
	elif Global.verificadorGarantirPontos:
		$carrinho/Area2D3/CollisionShape2D/Sprite/pauseMask.visible = true
		$buraco/Area2D3/CollisionShape2D/Buraco/pauseMask2.visible = true
		$ParallaxBackground/pauseMask2.visible = true
		$KinematicBody2D/Camera2D/garantirPontos.visible = true
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
			$KinematicBody2D/Camera2D/garantirPontos.visible = false
		
			
#Função que modifica os textos de acordo com o idioma escolhido
func idiomaModificador():
	if Global.idiomaEscolhido == 0:
		$KinematicBody2D/Camera2D/Label.text = "Para movimentar utilize os comandos abaixo"
		$KinematicBody2D/Camera2D/Label/Label.text = "Pressione qualquer tecla para continuar"
		pontos = "Pontos "
		$KinematicBody2D/Camera2D/Label/Label2.text = "Para garantir seus pontos use o comando abaixo"
		$KinematicBody2D/Camera2D/garantirPontos.text  = "Garantir pontos"
		$KinematicBody2D/Camera2D/garantirPontos/continuar.text = "voltar"
		
	elif Global.idiomaEscolhido == 1:
		$KinematicBody2D/Camera2D/Label.text = "To move use the commands below"
		$KinematicBody2D/Camera2D/Label/Label.text = "Press any key to continue"
		pontos = "Score "
		$KinematicBody2D/Camera2D/Label/Label2.text = "To secure your points use the command below"
		$KinematicBody2D/Camera2D/garantirPontos.text  = "secure points"
		$KinematicBody2D/Camera2D/garantirPontos/continuar.text = "back"
	
	elif Global.idiomaEscolhido == 2: 
		$KinematicBody2D/Camera2D/Label.text = "Para mover usa los siguientes comandos"
		$KinematicBody2D/Camera2D/Label/Label.text = "Pulse cualquier tecla para continuar"
		pontos = "Puntos "
		$KinematicBody2D/Camera2D/Label/Label2.text = "Para asegurar sus puntos, use el siguiente comando"
		$KinematicBody2D/Camera2D/garantirPontos.text  = "puntos seguros"
		$KinematicBody2D/Camera2D/garantirPontos/continuar.text = "volver"
		
#função que faz o menu de garantir os pontos aparecer
func _unhandled_input(event):
	if Global.validadorDoTutorial == false:
		if event.is_action_pressed("garantirPontos"):
			if Global.verificadorDePause == false:
				if Global.verificadorGarantirPontos == false:
					Global.verificadorGarantirPontos = true
				else:
					Global.verificadorGarantirPontos = false
	
#função que faz o jogo continuar quando se aperta o botão continuar dentro do
#menu de garantir os pontos
func _on_continuar_pressed():
	Global.verificadorGarantirPontos = false
	$carrinho/Area2D3/CollisionShape2D/Sprite/pauseMask.visible = false
	$buraco/Area2D3/CollisionShape2D/Buraco/pauseMask2.visible = false
	$ParallaxBackground/pauseMask2.visible = false
	$KinematicBody2D/Camera2D/garantirPontos.visible = false

#função que faz o jogador ir até a cena final com os pontos garantidos
func _on_garantirPontos_pressed():
	get_tree().change_scene("res://Cenas/gameOver.tscn")
