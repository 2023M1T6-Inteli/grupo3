extends KinematicBody2D

var movimentoHorizontal: Vector2
var verificadorDeMovimento :bool

func _ready():
	verificadorDeMovimento = false

func _process(delta):
	if verificadorDeMovimento == true:
		movimentoHorizontal = move_and_slide(movimentoHorizontal)
		movimentoHorizontal.x = -900
		if $"caminhãoUnipar".global_position.x <= 0:
			#Animação de transição
			transitionScene.trocaDeCena()
			#Troca de cena
			get_tree().change_scene("res://Cenas/Checklist.tscn")
	
