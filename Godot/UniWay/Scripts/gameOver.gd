extends Control
var pontos = 'pontos: '
var nome = "Seu nome: "



func _process(delta):
	$pontos.text = pontos + String(Global.pontosArmazenados)
	$nome.text = nome + String(Global.nomeDoJogador)
	alteradorDeIdioma()
	alteradorDeRanking()
	

func alteradorDeIdioma():
	if Global.idiomaEscolhido == 0:
		pontos = 'Seus Pontos: '
		nome = "Seu nome: "
		$Ranking.text = "Os Melhores"
		$retorno.text = "VOLTAR PARA O MENU"
		$os5Melhores.text = "Os 5 melhores"
		$voltar.text = "Voltar"
	elif Global.idiomaEscolhido == 1:
		pontos = 'Your Score: '
		nome = "Your name: "
		$Ranking.text = "Leaderboard"
		$retorno.text = "BACK TO MENU"
		$os5Melhores.text = "TOP 5"
		$voltar.text = "Back"
	elif Global.idiomaEscolhido == 2:
		pontos = 'Tus Puntos: '
		nome = "Su nombre: "
		$Ranking.text = "Los mejores"
		$retorno.text = "DE REGRESO AL COMIENZO"
		$os5Melhores.text = "los 5 mejores"
		$voltar.text = "volver"


func _on_retorno_pressed():
	get_tree().change_scene("res://Cenas/menuPrincipal.tscn")
	
func sistemaDeRank():
	if Global.pontosArmazenados > DataSave.pontosJogador1 and Global.pontosArmazenados:
		DataSave.pontosJogador5 = DataSave.pontosJogador4
		DataSave.pontosJogador4 = DataSave.pontosJogador3
		DataSave.pontosJogador3 = DataSave.pontosJogador2
		DataSave.pontosJogador2 = DataSave.pontosJogador1
		DataSave.nomeJogador5 = DataSave.nomeJogador4
		DataSave.nomeJogador4 = DataSave.nomeJogador3
		DataSave.nomeJogador3 = DataSave.nomeJogador2
		DataSave.nomeJogador2 = DataSave.nomeJogador1
		DataSave.pontosJogador1 = Global.pontosArmazenados
		DataSave.nomeJogador1 = Global.nomeDoJogador
	else:
		if Global.pontosArmazenados > DataSave.pontosJogador2:
			DataSave.pontosJogador5 = DataSave.pontosJogador4
			DataSave.pontosJogador4 = DataSave.pontosJogador3
			DataSave.pontosJogador3 = DataSave.pontosJogador2
			DataSave.nomeJogador5 = DataSave.nomeJogador4
			DataSave.nomeJogador4 = DataSave.nomeJogador3
			DataSave.nomeJogador3 = DataSave.nomeJogador2
			DataSave.pontosJogador2 = Global.pontosArmazenados
			DataSave.nomeJogador2 = Global.nomeDoJogador
		else:
			if Global.pontosArmazenados > DataSave.pontosJogador3:
				DataSave.pontosJogador5 = DataSave.pontosJogador4
				DataSave.pontosJogador4 = DataSave.pontosJogador3
				DataSave.nomeJogador5 = DataSave.nomeJogador4
				DataSave.nomeJogador4 = DataSave.nomeJogador3
				DataSave.pontosJogador3 = Global.pontosArmazenados
				DataSave.nomeJogador3 = Global.nomeDoJogador
			else:
				if Global.pontosArmazenados > DataSave.pontosJogador4:
					DataSave.pontosJogador5 = DataSave.pontosJogador4
					DataSave.nomeJogador5 = DataSave.nomeJogador4
					DataSave.pontosJogador4 = Global.pontosArmazenados
					DataSave.nomeJogador4 = Global.nomeDoJogador
				else:
					if Global.pontosArmazenados > DataSave.pontosJogador5:
						DataSave.pontosJogador5 = Global.pontosArmazenados
						DataSave.nomeJogador5 = Global.nomeDoJogador
					else:
						pass


func alteradorDeRanking():
	if DataSave.pontosJogador1 > 0:
		$os5Melhores/top1.text = DataSave.nomeJogador1 + " -> " + String(DataSave.pontosJogador1)
	else:
		$os5Melhores/top1.text = ""
	if DataSave.pontosJogador2 > 0:
		$os5Melhores/top2.text = DataSave.nomeJogador2 + " -> " + String(DataSave.pontosJogador2)
	else:
		$os5Melhores/top2.text = ""
	if DataSave.pontosJogador3 > 0:
		$os5Melhores/top3.text = DataSave.nomeJogador3 + " -> " + String(DataSave.pontosJogador3)
	else:
		$os5Melhores/top3.text = ""
	if DataSave.pontosJogador4 > 0:
		$os5Melhores/top4.text = DataSave.nomeJogador4 + " -> " + String(DataSave.pontosJogador4)
	else:
		$os5Melhores/top4.text = ""
	if DataSave.pontosJogador5 > 0:
		$os5Melhores/top5.text = DataSave.nomeJogador5 + " -> " + String(DataSave.pontosJogador5)
	else:
		$os5Melhores/top5.text = ""


func _on_Ranking_pressed():
	$gamerOver.visible = false
	$retorno.visible = false
	$pontos.visible = false
	$nome.visible = false
	$Ranking.visible = false
	$os5Melhores.visible = true
	$voltar.visible = true


	
func _on_voltar_pressed():
	$gamerOver.visible = true
	$retorno.visible = true
	$pontos.visible = true
	$nome.visible = true
	$Ranking.visible = true
	$os5Melhores.visible = false
	$voltar.visible = false
	
func _exit_tree():
	DataSave.saveData()

func _enter_tree():
	sistemaDeRank()
