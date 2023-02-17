extends Node2D

var quantidadesDePontos

func _ready():
	quantidadesDePontos = 0
func _process(delta):
 placarPista()

func placarPista():
	quantidadesDePontos +=1
	$player/Camera2D/RichTextLabel.text = "Pontos: " + String(quantidadesDePontos)

