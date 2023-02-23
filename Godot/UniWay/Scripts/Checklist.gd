extends Control



#Essas funções fazem com que apareça o certinho do checklist quando
#o seu respectivo botão for pressionado
func _on_Button1_pressed():
	$"Check(Checklist)1".visible = true

func _on_Button2_pressed():
	$"Check(Checklist)2".visible = true

func _on_Button3_pressed():
	$"Check(Checklist)3".visible = true
	
func _on_Button4_pressed():
	$"Check(Checklist)4".visible = true

#Essa função habilita o botão continuar se todos os checklist estiverem feitos
func _process(delta):
	if($"Check(Checklist)1".visible == true && $"Check(Checklist)2".visible == true && $"Check(Checklist)3".visible == true && $"Check(Checklist)4".visible == true):
		$continuar.disabled = false

#Função de troca de cena
func _on_continuar_pressed():
	transitionScene.trocaDeCena()
	get_tree().change_scene("res://Cenas/Novo Nivel Principal.tscn")
