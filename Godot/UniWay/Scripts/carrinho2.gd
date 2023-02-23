extends KinematicBody2D

# Declaração da variável que vai fazer o carro se movimentar.
var velocidade: Vector2
	
# Nessa parte é chamada a função de movimento e a condição de teletransporte
func _physics_process(delta):
	movimentoCarrinho()
	move_and_slide(velocidade)
	#Condição que faz o carro ser teletransportado para cima da tela em looping
	if $Area2D/CollisionShape2D.position.y >= Global.posicionamentoDoJogador + 500 :
		$Area2D/CollisionShape2D.position.y = Global.posicionamentoDoJogador - 3500

	
# Criação de uma função para fazer o movimento do carro.
func movimentoCarrinho():
	velocidade.y = 300
	

#Função que faz a troca de cena se houver batida
func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Cenas/Jornal1.tscn")
