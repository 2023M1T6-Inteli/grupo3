extends Control

func _enter_tree():
	$caminhoneiro1/Light2D.visible = false
	$caminhoneiro2/Light2D.visible = false
	$Caminhoneira/Light2D.visible = false


func _on_Caminhoneiro1_mouse_entered():
	$caminhoneiro1/Light2D.visible = true


func _on_Caminhoneiro1_mouse_exited():
	$caminhoneiro1/Light2D.visible = false
	

func _on_Caminhoneiro1_pressed():
	$ColorRect/AnimationPlayer.play("voltandoAoNormal")
	$Caminhoneira.visible = false
	$caminhoneiro1.visible = false
	$caminhoneiro2.visible = false
	$selecionarPersonagem.visible = false
	$caminhoneiro1Selecionado.visible = true
	$SecretariaSentada.visible = true
	Global.personagemSelecionado = 0
	yield(get_tree().create_timer(1), "timeout")
	alteradorDeIdioma()


func _on_caminhoneiro2_mouse_entered():
	$caminhoneiro2/Light2D.visible = true
	

func _on_caminhoneiro2_mouse_exited():
	$caminhoneiro2/Light2D.visible = false

func _on_caminhoneiro2_pressed():
	$ColorRect/AnimationPlayer.play("voltandoAoNormal")
	$Caminhoneira.visible = false
	$caminhoneiro1.visible = false
	$caminhoneiro2.visible = false
	$selecionarPersonagem.visible = false
	$caminhoneiro2Selecionado.visible = true
	$SecretariaSentada.visible = true
	Global.personagemSelecionado = 1
	yield(get_tree().create_timer(1), "timeout")
	alteradorDeIdioma()
	

func _on_Caminhoneira_mouse_entered():
	$Caminhoneira/Light2D.visible = true


func _on_Caminhoneira_mouse_exited():
	$Caminhoneira/Light2D.visible = false


func _on_Caminhoneira_pressed():
	$ColorRect/AnimationPlayer.play("voltandoAoNormal")
	$Caminhoneira.visible = false
	$caminhoneiro1.visible = false
	$caminhoneiro2.visible = false
	$selecionarPersonagem.visible = false
	$caminhoneiraSelecionada.visible = true
	$SecretariaSentada.visible = true
	Global.personagemSelecionado = 2
	yield(get_tree().create_timer(1), "timeout")
	alteradorDeIdioma()
	
func alteradorDeIdioma():
	if Global.idiomaEscolhido == 0:
		var dialogoPTBR = Dialogic.start("salaDaSecretaria")
		add_child(dialogoPTBR)
		
	
	if Global.idiomaEscolhido == 1:
		var dialogo1 = Dialogic.start("salaDaSecretaria1")
		add_child(dialogo1)
	
	if Global.idiomaEscolhido == 2:
		var dialogo2 = Dialogic.start("salaDaSecretaria2")
		add_child(dialogo2)
	
