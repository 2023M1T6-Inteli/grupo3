extends KinematicBody2D


# Declaração da variável que vai fazer o carro se movimentar.
var velocidade: Vector2
	
# Nessa parte é chamada a função de movimento e as condições de teletransporte
func _physics_process(delta):
	move_and_slide(velocidade)
	movimentoCarrinho()
	#Condições que faz o carro ser teletransportado para cima da tela em looping
	if $Area2D/CollisionShape2D.global_position.y >= Global.posicionamentoDoJogador + 500 :
		$Area2D/CollisionShape2D.global_position.y = Global.posicionamentoDoJogador - 1500
	if $Area2D2/CollisionShape2D.global_position.y >= Global.posicionamentoDoJogador + 500:
		$Area2D2/CollisionShape2D.global_position.y = Global.posicionamentoDoJogador -2320
	if $Area2D3/CollisionShape2D.global_position.y >= Global.posicionamentoDoJogador + 500:
		$Area2D3/CollisionShape2D.global_position.y = Global.posicionamentoDoJogador -1950
	
# Criação de uma função para realizar o movimento do carro.
func movimentoCarrinho():
	velocidade.y = 300

#Função que faz a troca de cena se houver batida
func _on_Area2D_body_entered(body):
	Global.comoPerdeu = 0
	get_tree().change_scene("res://Cenas/Jornal1.tscn")
