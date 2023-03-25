extends Control

#Função que deixa o menu de pause invisível ao iniciar a cena
func _ready():
	self.visible = false

#Variável que permite o funcionamento do modo de pause
var isPaused = false setget set_is_paused

#Função que habilita o modo de pause
func _unhandled_input(event):
	if event.is_action_pressed("paused"):
		#Condição que garante o aparecimento e desaparecimento do menu de pause
		if Global.verificadorGarantirPontos == false:
			if (self.visible == false):
				self.visible = true
			else:
				self.visible = false
#Função que habilita o modo de pause, trabalhando junto com a de cima
func set_is_paused(value):
	isPaused = value
	get_tree().paused = isPaused

#Função que resume o jogo, ou seja
#retira o modo de pause
func _on_Resumir_pressed():
	self.isPaused = false
	self.visible = false

#Função que volta para a tela inicial
func _on_Sair_pressed():
	self.isPaused = false
	get_tree().change_scene("res://Cenas/menuPrincipal.tscn")
	
#Função ultilizada para não deixar um menu sobrepor o outro
#e pausar o jogo
func _process(delta) ->void:
	if(self.visible == true):
		Global.verificadorDePause = true
	else:
		Global.verificadorDePause = false
	if Global.validadorDoTutorial == true:
		self.isPaused = true
	else:
		if self.visible == true or Global.verificadorGarantirPontos:
			self.isPaused = true
		else:
			self.isPaused = false

#Função que altera palavras de acordo com o idioma escolhido
	if Global.idiomaEscolhido == 0:
		$CenterContainer/VBoxContainer/Label.text = "PAUSADO"
		$CenterContainer/VBoxContainer/Resumir.text = "Resumir"
		$CenterContainer/VBoxContainer/Sair.text = "Sair"
		
	
	elif Global.idiomaEscolhido == 1:
		$CenterContainer/VBoxContainer/Label.text = "PAUSED"
		$CenterContainer/VBoxContainer/Resumir.text = "Resume"
		$CenterContainer/VBoxContainer/Sair.text = "Exit"
		
	
	elif Global.idiomaEscolhido == 2: 
		$CenterContainer/VBoxContainer/Label.text = "EN PAUSA"
		$CenterContainer/VBoxContainer/Resumir.text = "Resumir"
		$CenterContainer/VBoxContainer/Sair.text = "Salir"
	
#Garantir que o jogo não fique travado no modo pause
func _exit_tree():
	self.isPaused = false



