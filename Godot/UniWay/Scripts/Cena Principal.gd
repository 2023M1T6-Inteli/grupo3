extends Node2D

var quantidadesDePontos :int

func _process(delta):
	placarPista()
	#pauseMaskControlador()
	
#Essa função declara os pontos a partir da posição Y do caminhão,
#permite a visualização dos pontos na tela de jogo e
#armazena os pontos em uma variavel global
func placarPista():
	quantidadesDePontos = (-$"KinematicBody2D/CollisionShape2D/CaminhãoUnipar".global_position.y + 408)/5
	$"KinematicBody2D/Camera2D/Label".text = "Pontos " + String(quantidadesDePontos)
	Global.pontosArmazenados = quantidadesDePontos
	
#func pauseMaskControlador() ->void:
	

