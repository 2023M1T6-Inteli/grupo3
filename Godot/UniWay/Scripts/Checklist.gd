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
	
#Essa função altera as palavras de acordo com o idioma escolhido 
func alteradorDeIdioma():
	if Global.idiomaEscolhido == 0:
		$Button1.text = "Arrumar Freios"
		$Button2.text = "Verificar  Motor"
		$Button3.text = "Alinhar eixos"
		$Button4.text = "Calibrar Pneus"
		$continuar.text = "Continuar"
	
	elif Global.idiomaEscolhido == 1:
		$Button1.text = "fix brakes"
		$Button2.text = "Check Engine"
		$Button3.text = "align axes"
		$Button4.text = "Calibrate Tires"
		$continuar.text = "Continue"
			
	
	elif Global.idiomaEscolhido == 2:
		$Button1.text = "arreglar frenos"
		$Button2.text = "Comprobar motor"
		$Button3.text = "alinear ejes"
		$Button4.text = "calibrar ruedas"
		$continuar.text = "Continuar"
	

#Função de troca de cena
func _on_continuar_pressed():
	transitionScene.trocaDeCena()
	get_tree().change_scene("res://Cenas/Novo Nivel Principal.tscn")
