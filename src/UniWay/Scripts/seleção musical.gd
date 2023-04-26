extends Control

#função que faz com que o efeito de luz inicie apagado ao entrar na cena
func _enter_tree():
	$rock/Light2D.visible = false
	$sertanejo/Light2D2.visible = false

#função que altera os textos de acordo com o idioma escolhido
func _process(delta):
	if Global.idiomaEscolhido == 0:
		$selecionarSom.text = "Selecione um som"
	elif Global.idiomaEscolhido == 1:
		$selecionarSom.text = "select a sound"
	elif Global.idiomaEscolhido == 2:
		$selecionarSom.text = "selecciona un sonido"
	

#função que faz o efeito de luz aparecer 
func _on_rock_mouse_entered():
	$rock/Light2D.visible = true

#função que faz o efeito de luz desaparecer
func _on_rock_mouse_exited():
	$rock/Light2D.visible = false
	
#função que continua o jogo de acordo com o personagem escolhido
func _on_rock_pressed():
	Sons.rockInicia()
	get_tree().change_scene("res://Cenas/salaDaSecretaria.tscn")


#função que faz o efeito de luz aparecer 
func _on_sertanejo_mouse_entered():
	$sertanejo/Light2D2.visible = true
	
#função que faz o efeito de luz desaparecer
func _on_sertanejo_mouse_exited():
	$sertanejo/Light2D2.visible = false

#função que continua o jogo de acordo com o personagem escolhido
func _on_sertanejo_pressed():
	# Carrega o arquivo de áudio
	Sons.sertanejoInicia()
	get_tree().change_scene("res://Cenas/salaDaSecretaria.tscn")
