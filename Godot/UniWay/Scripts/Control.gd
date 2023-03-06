extends Control

#Termo que permite acessar variáveis de outros scripts
onready var caminhao = get_node("KinematicBody2D")

#Essa função valida o movimento do caminhão quando 
#o botão "START" é pressionado
func _on_StartButton_pressed():
	caminhao.verificadorDeMovimento = true

#Essa função troca para a tela dos controles ao clicar em "controles"
func _on_Idioma_pressed(): 
	$"Highway-sky/TituloDoJogo".visible = false
	$control.visible = false
	$gitHub.visible = false
	$Unipar.visible = false
	$Idioma.visible = true
	$VBoxIdioma.visible = true
	$VoltarIdioma.visible = true
	


func _on_Exit_pressed():
	get_tree().quit() # Essa função faz fechar o jogo ao clicar em "sair"
	


func _on_PTBR_pressed():
	$"Highway-sky/TituloDoJogo".visible = true
	$control.visible = true
	$gitHub.visible = true
	$Unipar.visible = true
	$Idioma.visible = false
	$VBoxIdioma.visible = false
	$VoltarIdioma.visible = false
	Global.idiomaEscolhido = 0
	
	
func _on_English_pressed():
	$"Highway-sky/TituloDoJogo".visible = true
	$control.visible = true
	$gitHub.visible = true
	$Unipar.visible = true
	$Idioma.visible = false
	$VBoxIdioma.visible = false
	$VoltarIdioma.visible = false
	Global.idiomaEscolhido = 1


func _on_Spanish_pressed():
	$"Highway-sky/TituloDoJogo".visible = true
	$control.visible = true
	$gitHub.visible = true
	$Unipar.visible = true
	$Idioma.visible = false
	$VBoxIdioma.visible = false
	$VoltarIdioma.visible = false
	Global.idiomaEscolhido = 2
	



func _on_VoltarIdioma_pressed():
	$"Highway-sky/TituloDoJogo".visible = true
	$control.visible = true
	$gitHub.visible = true
	$Unipar.visible = true
	$Idioma.visible = false
	$VBoxIdioma.visible = false
	$VoltarIdioma.visible = false

func _process(delta):
	if Global.idiomaEscolhido == 0:
		$control/StartButton.text = "Iniciar"
		$control/Idioma.text = "Idioma"
		$control/Exit.text = "Sair"
		$Idioma.text = "Idioma"
		$Idioma.set_position(Vector2(638,98))
		$VoltarIdioma.text = "Voltar"
		$gitHub.text = "Quem Somos"
	
	elif Global.idiomaEscolhido == 1:
		$control/StartButton.text = "Start"
		$control/Idioma.text = "Language"
		$control/Exit.text = "Exit"
		$Idioma.text = "Language"
		$Idioma.set_position(Vector2(540,98))
		$VoltarIdioma.text = "Back"
		$gitHub.text = "who we are"
	
	elif Global.idiomaEscolhido == 2:
		$control/StartButton.text = "comenzar"
		$control/Idioma.text = "Idioma"
		$control/Exit.text = "salida"
		$Idioma.text = "Idioma"
		$Idioma.set_position(Vector2(638,98))
		$VoltarIdioma.text = "volver"
		$gitHub.text = "quienes somos"


func _on_gitHub_pressed():
	OS.shell_open("https://github.com/2023M1T6-Inteli/grupo3")



func _on_Unipar_pressed():
	OS.shell_open("https://www.unipar.com/")
