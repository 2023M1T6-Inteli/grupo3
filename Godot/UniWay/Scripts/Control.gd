extends Control

#Termo que permite acessar variáveis de outros scripts
onready var caminhao = get_node("KinematicBody2D")

#Essa função valida o movimento do caminhão quando 
#o botão "START" é pressionado
func _on_StartButton_pressed():
	caminhao.verificadorDeMovimento = true

#Essa função troca para a tela dos controles ao clicar em "controles"
func _on_Controles_pressed(): 
	#Animação de transição
	transitionScene.trocaDeCena()
	get_tree().change_scene("res://Cenas/Tela de controles.tscn")


func _on_quitbtn_pressed():
	get_tree().quit() # Essa função faz fechar o jogo ao clicar em "sair"


