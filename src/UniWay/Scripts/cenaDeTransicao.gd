extends CanvasLayer

#Essa função realiza o efeito de apagão na troca de
#cenas dando um sensação de fluidez
func trocaDeCena() ->void:
	$AnimationPlayer.play("fadeIn")
	$AnimationPlayer.play("fadeOut")
