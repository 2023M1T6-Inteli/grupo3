extends Control
var pontos = 'pontos: '



func _ready():
	#adicionarAoRanking()
	pass


func _process(delta):
	$Label.text = pontos + String(Global.pontosArmazenados)
	alteradorDeIdioma()
	

func alteradorDeIdioma():
	if Global.idiomaEscolhido == 0:
		pontos = 'pontos: '
		$retorno.text = "VOLTAR PARA O MENU"
	elif Global.idiomaEscolhido == 1:
		pontos = 'Score: '
		$retorno.text = "BACK TO MENU"
	elif Global.idiomaEscolhido == 2:
		pontos = 'pontos: '
		$retorno.text = "DE REGRESO AL COMIENZO"


func _on_retorno_pressed():
	get_tree().change_scene("res://Cenas/menuPrincipal.tscn")
	
func adicionarAoRanking() -> void:
	DataSave.pontos.push_back(Global.pontosArmazenados)
	DataSave.nomeDoJogador.push_back(Global.nomeDoJogador)
	
	
