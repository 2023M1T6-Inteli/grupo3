extends Control

#Termo que permite acessar variáveis de outros scripts
onready var relogio = get_node("Relogio")
#variável ultilicada para alterar o nome do jogador no jornal
var nome = ""
#variável que tem valor aleatório para que o texto do jornal fique aleatório
var valorAleatorio = rand_range(0,78)
func _ready():
	Global.pontosArmazenados = 0
	$sirene.play()
	yield(get_tree().create_timer(5),"timeout")
	$sirene.stop()
	musica()
	
#Função que habilita a visualização do botão
func _process(delta):
	if relogio.validadorDoRelogio == true:
		$voltarParaOMenu.disabled = false
	if Global.personagemSelecionado == 2 or Global.personagemSelecionado == 3:
		nome = "caminhoneira"
	else:
		nome = "caminhoneiro"
	#chamando outras funções
	idiomaModificador()
	alteradorDeJornal()
	
#Função que realiza a troca para a cena de Game Over
func _on_voltarParaOMenu_pressed():
	get_tree().change_scene("res://Cenas/gameOver.tscn")

#Função que realiza a troca de palavras de acordo como o idioma escolhido
func idiomaModificador():
	if Global.idiomaEscolhido == 0:
		$voltarParaOMenu.text = "Continuar"
		match Global.comoPerdeu:
			0:
				if valorAleatorio <= 49:
					$RichTextLabel.text = "Pai, sua esposa e duas filhas morrem em acidente causado por " + nome + "."
				else:
					$RichTextLabel.text = "Dois idosos e seus netos perdem a vida em um acidente causado por " + nome + "."
			1:
				$RichTextLabel.text = nome + " dormiu ao volante e sofreu um acidente causado por um buraco em estrada."
	elif Global.idiomaEscolhido == 1:
		$voltarParaOMenu.text = "Continue"
		match Global.comoPerdeu:
			0:
				if valorAleatorio <= 49:
					$RichTextLabel.text = "Father, motherand their two daughters die in an accident caused by a truck driver."
				else:
					$RichTextLabel.text = "Two elderly people and their grandchildren are severly injured and do not survive an accident caused by a truck driver."
			1:
				$RichTextLabel.text = "Truck driver fell asleep at the wheel and had an accident caused by a hole in a road."
	
	elif Global.idiomaEscolhido == 2: 
		$voltarParaOMenu.text = "Continuar"
		match Global.comoPerdeu:
			0:
				if valorAleatorio <= 49:
					$RichTextLabel.text = "Mueren padre, madre y sus dos hijas en accidente provocado por camionero."
				else:
					$RichTextLabel.text = "Dos ancianos y sus nietos resultan heridos y no sobreviven al accidente provocado por un camionero."
			1:
				$RichTextLabel.text = "Conductor de camión se quedó dormido al volante y tuvo un accidente provocado por un bache en la carretera."
	
#função que altera a imagem do jornal
func alteradorDeJornal():
	match Global.personagemSelecionado:
		0:
			$Jornal0.visible = true
		1:
			$Jornal1.visible = true
		2:
			$Jornal2.visible = true
		3:
			$Jornal3.visible = true
		
func musica():
	Sons.sertanejoPara()
	Sons.rockPara()

