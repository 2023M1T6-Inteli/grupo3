extends Control

#Termo que permite acessar variáveis de outros scripts
onready var relogio = get_node("Relogio")

#Função que habilita a visualização do botão
func _process(delta):
	if relogio.validadorDoRelogio == true:
		$voltarParaOMenu.disabled = false
	idiomaModificador()

#Função que realiza a troca para a cena inicial
func _on_voltarParaOMenu_pressed():
	get_tree().change_scene("res://Cenas/menuPrincipal.tscn")
	
func idiomaModificador():
	if Global.idiomaEscolhido == 0:
		$voltarParaOMenu.text = "Voltar para o menu"
	
	elif Global.idiomaEscolhido == 1:
		$voltarParaOMenu.text = "Back to menu"
		
	
	elif Global.idiomaEscolhido == 2: 
		$voltarParaOMenu.text = "volver arriba"
		
