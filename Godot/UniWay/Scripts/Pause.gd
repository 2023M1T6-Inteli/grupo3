extends Control

#Função que deixa o menu de pause invisível ao iniciar a cena
func _ready():
	self.visible = false

#Variável que permite o funcionamento do modo de pause
var isPaused = false setget set_is_paused

#Função que habilita o modo de pause
func _unhandled_input(event):
	if event.is_action_pressed("paused"):
		self.isPaused = !isPaused
		#Condição que garante o aparecimento e desaparecimento do menu de pause
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
	print("estou aqui")
	self.visible = false

#Função que volta para a tela inicial
func _on_Sair_pressed():
	self.isPaused = false
	get_tree().change_scene("res://Cenas/menuPrincipal.tscn")
	
#Função que armazena um valor verdadeiro ou falso de acordo
#com a visibilidade do menu de pause
func _process(delta) ->void:
	if(self.visible == true):
		Global.verificadorDePause = true
	else:
		Global.verificadorDePause = false



