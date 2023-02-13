extends Control



func _ready():
	pass
	
func _on_StartButton_pressed(): # essa funçao inicia o jogo ao aperta "start"
		get_tree().change_scene("res://Cena Nivel principal.tscn")
		

func _on_Controles_pressed(): # essa função troca para a tela dos controles ao clicar "controles"
	get_tree().change_scene("res://Tela de controles.tscn")
	


func _on_quitbtn_pressed():
	get_tree().quit() # Essa função faz fechar o jogo ao clicar em "sair"
	


