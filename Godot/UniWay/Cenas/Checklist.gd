extends Control




func _on_Button1_pressed():
	$"Check(Checklist)1".visible = true

func _on_Button2_pressed():
	$"Check(Checklist)2".visible = true

func _on_Button3_pressed():
	$"Check(Checklist)3".visible = true
	
func _on_Button4_pressed():
	$"Check(Checklist)4".visible = true

func _process(delta):
	if($"Check(Checklist)1".visible == true && $"Check(Checklist)2".visible == true && $"Check(Checklist)3".visible == true && $"Check(Checklist)4".visible == true):
		$continuar.disabled = false


func _on_continuar_pressed():
	transitionScene.trocaDeCena()
	get_tree().change_scene("res://Cenas/Novo Nivel Principal.tscn")
