extends Button


#Função que retorna à cena do menu inicial
func _on_Sair_pressed():
	get_tree().change_scene("res://Cenas/menuPrincipal.tscn")
