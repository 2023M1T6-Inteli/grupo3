extends Control

func _ready():
	$control/StartButton.grab_focus() #Essa linha faz o botão estar selecionado, ao entrar no jogo.



#func _on_StartButton_pressed():
	#get_tree().change_scene() # Essa função faz trocar de cena ao clicar no "start"
	pass

func _on_quitbtn_pressed() ->void:
	get_tree().quit() # Essa função fecha o jogo ao clicar em "sair"
	
