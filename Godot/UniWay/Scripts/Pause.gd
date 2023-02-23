extends Control

#Função que deixa o menu de pause invisível ao iniciar a cena
func _ready():
	self.visible = false

#Variável que permite o funcionamento do modo de pause
var is_paused = false setget set_is_paused

#Função que habilita o modo de pause
func _unhandled_input(event):
	if event.is_action_pressed("paused"):
		self.is_paused = !is_paused
		#Condição que garante o aparecimento e desaparecimento do menu de pause
		if (self.visible == false):
			self.visible = true
		else:
			self.visible = false
#Função que habilita o modo de pause, trabalhando junto com a de cima
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused

#Função que resume o jogo, ou seja
#retira o modo de pause
func _on_Resumir_pressed():
	self.is_paused = false
	print("estou aqui")
	self.visible = false

#Função que volta para a tela inicial
func _on_Sair_pressed():
	self.is_paused = false
	get_tree().change_scene("res://Cenas/Control.tscn")
	
#Função que armazena um valor verdadeiro ou falso de acordo
#com a visibilidade do menu de pause
func _process(delta) ->void:
	if(self.visible == true):
		Global.verificadorDePause = true
	else:
		Global.verificadorDePause = false



