extends Control
var pontos = 'pontos: '

func _process(delta):
	$Label.text = pontos + String(Global.pontosArmazenados)

func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/menuPrincipal.tscn")

func alteradorDeIdioma():
	if Global.idiomaEscolhido == 0:
		pontos = 'pontos: '
	elif Global.idiomaEscolhido == 1:
		pontos = 'points: '
	elif Global.idiomaEscolhido == 2:
		pontos = 'pontos: '
