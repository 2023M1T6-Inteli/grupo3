extends Control

#Termo que permite acessar variáveis de outros scripts
onready var caminhao = get_node("KinematicBody2D")

#Essa função prossegue a linha do jogo fazendo a aba de
#inserir o nome aparecer ao clickar no botão "START"
func _on_StartButton_pressed():
	$somCorreto.play()
	$TituloDoJogo.visible = false
	$control.visible = false
	$gitHub.visible = false
	$Unipar.visible = false
	$"Top 5".visible = false
	$LineEdit.visible = true
	

#Essa função abre o menu de seleção de idiomas
func _on_Idioma_pressed(): 
	$TituloDoJogo.visible = false
	$control.visible = false
	$gitHub.visible = false
	$Unipar.visible = false
	$"Top 5".visible = false
	$Idioma.visible = true
	$VBoxIdioma.visible = true
	$VoltarIdioma.visible = true
	


func _on_Exit_pressed():
	get_tree().quit() # Essa função faz fechar o jogo ao clicar em "sair"
	

#Função que muda o idioma para PT-BR
func _on_PTBR_pressed():
	$TituloDoJogo.visible = true
	$control.visible = true
	$gitHub.visible = true
	$Unipar.visible = true
	$"Top 5".visible = true
	$Idioma.visible = false
	$VBoxIdioma.visible = false
	$VoltarIdioma.visible = false
	Global.idiomaEscolhido = 0
	
#Função que muda o idioma para inglês
func _on_English_pressed():
	$TituloDoJogo.visible = true
	$control.visible = true
	$gitHub.visible = true
	$Unipar.visible = true
	$"Top 5".visible = true
	$Idioma.visible = false
	$VBoxIdioma.visible = false
	$VoltarIdioma.visible = false
	Global.idiomaEscolhido = 1

#Função que muda o idioma para espanhol
func _on_Spanish_pressed():
	$TituloDoJogo.visible = true
	$control.visible = true
	$gitHub.visible = true
	$Unipar.visible = true
	$"Top 5".visible = true
	$Idioma.visible = false
	$VBoxIdioma.visible = false
	$VoltarIdioma.visible = false
	Global.idiomaEscolhido = 2
	


#Função que sai do menu de seleção de idioma sem alterar o idioma
func _on_VoltarIdioma_pressed():
	$TituloDoJogo.visible = true
	$control.visible = true
	$gitHub.visible = true
	$Unipar.visible = true
	$"Top 5".visible = true
	$Idioma.visible = false
	$VBoxIdioma.visible = false
	$VoltarIdioma.visible = false

func _process(delta):
#Condições que realizam a troca de palavras de acordo com o idioma escolhido
	if Global.idiomaEscolhido == 0:
		$control/StartButton.text = "Iniciar"
		$control/Idioma.text = "Idioma"
		$control/Exit.text = "Sair"
		$Idioma.text = "Idioma"
		$Idioma.set_position(Vector2(638,98))
		$VoltarIdioma.text = "Voltar"
		$gitHub.text = "Quem Somos"
		$LineEdit/Label.text = "insira seu nome"
		$LineEdit/Label/continuar.text = "Continuar"
	
	elif Global.idiomaEscolhido == 1:
		$control/StartButton.text = "Start"
		$control/Idioma.text = "Language"
		$control/Exit.text = "Exit"
		$Idioma.text = "Language"
		$Idioma.set_position(Vector2(540,98))
		$VoltarIdioma.text = "Back"
		$gitHub.text = "who we are"
		$LineEdit/Label.text = "enter your name"
		$LineEdit/Label/continuar.text = "Continue"
	
	elif Global.idiomaEscolhido == 2:
		$control/StartButton.text = "comenzar"
		$control/Idioma.text = "Idioma"
		$control/Exit.text = "salida"
		$Idioma.text = "Idioma"
		$Idioma.set_position(Vector2(638,98))
		$VoltarIdioma.text = "volver"
		$gitHub.text = "quienes somos"
		$LineEdit/Label.text = "introduzca su nombre"
		$LineEdit/Label/continuar.text = "Continuar"

#Botão que redireciona para a nossa pagina do GitHub
func _on_gitHub_pressed():
	OS.shell_open("https://github.com/2023M1T6-Inteli/grupo3")


#Botão que redireciona para a página web do site da unipar
func _on_Unipar_pressed():
	OS.shell_open("https://www.unipar.com/")


#Botão que valida o movimento do caminhão para prosseguir para a
#proxima cena
func _on_continuar_pressed():
	$somCorreto.play()
	Global.nomeDoJogador = String($LineEdit.text)
	caminhao.verificadorDeMovimento = true

#Toda vez que entrar nessa cena os dados salvos na maquina são carregados
func _enter_tree():
	DataSave.loadData()


func _on_Top_5_pressed():
	alteradorDeRanking()
	$TituloDoJogo.visible = false
	$control.visible = false
	$gitHub.visible = false
	$Unipar.visible = false
	$"Top 5".visible = false
	$"Título Top 5".visible = true
	$voltarRanking.visible = true
	$voltarRanking.visible = true



#Função que altera o ranking na tela
func alteradorDeRanking():
	if DataSave.pontosJogador1 > 0:
		$"Título Top 5/Top1".text = DataSave.nomeJogador1 + " -> " + String(DataSave.pontosJogador1)
	else:
		$"Título Top 5/Top1".text = ""
	if DataSave.pontosJogador2 > 0:
		$"Título Top 5/Top2".text = DataSave.nomeJogador2 + " -> " + String(DataSave.pontosJogador2)
	else:
		$"Título Top 5/Top2".text = ""
	if DataSave.pontosJogador3 > 0:
		$"Título Top 5/Top3".text = DataSave.nomeJogador3 + " -> " + String(DataSave.pontosJogador3)
	else:
		$"Título Top 5/Top3".text = ""
	if DataSave.pontosJogador4 > 0:
		$"Título Top 5/Top4".text = DataSave.nomeJogador4 + " -> " + String(DataSave.pontosJogador4)
	else:
		$"Título Top 5/Top4".text = ""
	if DataSave.pontosJogador5 > 0:
		$"Título Top 5/Top5".text = DataSave.nomeJogador5 + " -> " + String(DataSave.pontosJogador5)
	else:
		$"Título Top 5/Top5".text = ""

func _on_voltarRanking_pressed():
	$TituloDoJogo.visible = true
	$control.visible = true
	$gitHub.visible = true
	$Unipar.visible = true
	$"Top 5".visible = true
	$"Título Top 5".visible = false
	$voltarRanking.visible = false
	
