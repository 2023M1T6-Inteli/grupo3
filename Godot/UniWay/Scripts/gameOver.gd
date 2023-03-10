extends Control

#Variáveis que armazenam textos
var pontos = 'pontos: '
var nome = "Seu nome: "


#Função chamada a cada frame do jogo 
func _process(delta):
	#Altera os textos da tela de Gamer Over para se adaptar ao nome e pontos 
	#do jogador
	$pontos.text = pontos + String(Global.pontosArmazenados)
	$nome.text = nome + String(Global.nomeDoJogador)
	alteradorDeIdioma()
	alteradorDeRanking()
	
#Função que altera as palavras de acordo com o idioma escolhido 
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

#Função que retorna a cena inicial quando o botão de retorno é pressionado 
func _on_retorno_pressed():
	get_tree().change_scene("res://Cenas/menuPrincipal.tscn")
	
#Função que realiza o sistema de ranking
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

#Função que mostra o ranking na tela
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

#Função que mostra a tela de ranking
func _on_Ranking_pressed():
	$gamerOver.visible = false
	$retorno.visible = false
	$pontos.visible = false
	$nome.visible = false
	$Ranking.visible = false
	$os5Melhores.visible = true
	$voltar.visible = true


#Função que volta para a tela de game over
func _on_voltar_pressed():
	$gamerOver.visible = true
	$retorno.visible = true
	$pontos.visible = true
	$nome.visible = true
	$Ranking.visible = true
	$os5Melhores.visible = false
	$voltar.visible = false

#Função que salva os dados do jogo quando se sai dessa cena
func _exit_tree():
	DataSave.saveData()

#função que é chamada quando se entra nessa cena
func _enter_tree():
	sistemaDeRank()
