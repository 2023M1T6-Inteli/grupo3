extends Control

#Termo que permite acessar variáveis de outros scripts
onready var relogio = get_node("Relogio")

#Função que habilita a visualização do botão
func _process(delta):
	if relogio.validadorDoRelogio == true:
		$voltarParaOMenu.disabled = false

#Função que realiza a troca para a cena inicial
func _on_voltarParaOMenu_pressed():
	get_tree().change_scene("res://Cenas/menuPrincipal.tscn")
