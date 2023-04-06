extends Node2D


#Criação de variáveis para armazenar a quantidade de pontos e
#mostrar eles na tela
var quantidadesDePontos :int
var pontos :String

func _ready():
	#Começa a tocar o som do motor do caminhão 
	Global.verificadorGarantirPontos = false
	$KinematicBody2D/Camera2D/volumeAtivo.visible = true
	$KinematicBody2D/Camera2D/volumeMudo.visible = true
	
#Função que chama outras funções a cada frame do jogo
func _process(delta):
	placarPista()
	controladorDaMascaraDePause()
	volumeIcone()
	idiomaModificador()
	#condição que faz tocar o som do motor do carro
	if Global.pontosArmazenados == 30:
		$KinematicBody2D/somDoMotor.play()
	
	
	
	
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
		$KinematicBody2D/Camera2D/Label.text = "Lista de comandos (teclado)"
		$KinematicBody2D/Camera2D/Label/Label1.text = "Mover para a esquerda"
		$KinematicBody2D/Camera2D/Label/Label2.text = "mover para a direita"
		$KinematicBody2D/Camera2D/Label/Label3.text = "pausar o jogo"
		$KinematicBody2D/Camera2D/Label/Label4.text = "Garantir Pontos"
		$KinematicBody2D/Camera2D/Label/Label5.text = "Pressione qualquer tecla para continuar"
		pontos = "Pontos "
		$KinematicBody2D/Camera2D/garantirPontos/alerta.text = "              clique em garantir pontos para que seus pontos sejam salvos.\n              Caso deseje continuar na sua viagem clique em voltar, mas lembrando que seus pontos ficaram igual a zero se perder."
		$KinematicBody2D/Camera2D/garantirPontos.text  = "Garantir pontos"
		$KinematicBody2D/Camera2D/garantirPontos/continuar.text = "voltar"
		
	elif Global.idiomaEscolhido == 1:
		$KinematicBody2D/Camera2D/Label.text = "List of commands (keyboard)"
		$KinematicBody2D/Camera2D/Label/Label1.text = "move left"
		$KinematicBody2D/Camera2D/Label/Label2.text = "move right"
		$KinematicBody2D/Camera2D/Label/Label3.text = "pause the game"
		$KinematicBody2D/Camera2D/Label/Label4.text = "Guarantee Points"
		$KinematicBody2D/Camera2D/Label/Label5.text = "Press any key to continue"
		pontos = "Score "
		$KinematicBody2D/Camera2D/garantirPontos/alerta.text = "              click secure points to have your points saved.\n              If you want to continue on your trip, click on return, remembering that your points will be equal to zero if you lose."
		$KinematicBody2D/Camera2D/garantirPontos.text  = "secure points"
		$KinematicBody2D/Camera2D/garantirPontos/continuar.text = "return"
	
	elif Global.idiomaEscolhido == 2: 
		$KinematicBody2D/Camera2D/Label.text = "Lista de comandos (teclado)"
		$KinematicBody2D/Camera2D/Label/Label1.text = "mover hacia la izquierda"
		$KinematicBody2D/Camera2D/Label/Label2.text = "mover a la derecha"
		$KinematicBody2D/Camera2D/Label/Label3.text = "pausa el juego"
		$KinematicBody2D/Camera2D/Label/Label4.text = "guardar puntos"
		$KinematicBody2D/Camera2D/Label/Label5.text = "Pulse cualquier tecla para continuar"
		pontos = "Puntos "
		$KinematicBody2D/Camera2D/garantirPontos/alerta.text = "              haga clic en guardar puntos para guardar sus puntos.\n              Si quieres continuar con tu viaje, haz clic en volver, recordando que tus puntos seran igual a cero si pierdes."
		$KinematicBody2D/Camera2D/garantirPontos.text  = "guardar puntos"
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

#Controla o volume do jogo, sendo ele mudo ou não
func _on_volumeAtivo_pressed():
	Sons.mudo()
	Global.volume = false

func _on_volumeMudo_pressed():
	Sons.audivel()
	Global.volume = true

#controla o icone do volume
func volumeIcone():
	if Global.verificadorDePause == true:
		if Global.volume == true:
			$KinematicBody2D/Camera2D/volumeAtivo.rect_global_position.y = -1030 + $KinematicBody2D/Camera2D.global_position.y
			$KinematicBody2D/Camera2D/volumeMudo.rect_global_position.y = 100000
		else:
			$KinematicBody2D/Camera2D/volumeAtivo.rect_global_position.y = 100000
			$KinematicBody2D/Camera2D/volumeMudo.rect_global_position.y = -1040 + $KinematicBody2D/Camera2D.global_position.y
	else:
		$KinematicBody2D/Camera2D/volumeAtivo.rect_global_position.y = 100000
		$KinematicBody2D/Camera2D/volumeMudo.rect_global_position.y = 100000
	if Global.volume == false:
		Sons.mudo()
