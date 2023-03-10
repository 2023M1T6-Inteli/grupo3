extends Control

#Termo que permite acessar variáveis de outros scripts
onready var relogio = get_node("Relogio")

#Função que habilita a visualização do botão
func _process(delta):
	if relogio.validadorDoRelogio == true:
		$voltarParaOMenu.disabled = false
	idiomaModificador()

#Função que realiza a troca para a cena de Game Over
func _on_voltarParaOMenu_pressed():
	get_tree().change_scene("res://Cenas/gameOver.tscn")

#Função que realiza a troca de palavras de acordo como o idioma escolhido
func idiomaModificador():
	if Global.idiomaEscolhido == 0:
		$voltarParaOMenu.text = "Continuar"
	
	elif Global.idiomaEscolhido == 1:
		$voltarParaOMenu.text = "Continue"
		
	
	elif Global.idiomaEscolhido == 2: 
		$voltarParaOMenu.text = "Continuar"
		
