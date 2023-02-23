extends Button

#Função que retorna à cena do menu inicial
func _on_Sair_tree_exiting():
	get_tree().change_scene("res://Cenas/Control.tscn")

#Função que retorna à cena do menu inicial
func _on_Sair_pressed():
	get_tree().change_scene("res://Cenas/Control.tscn")
