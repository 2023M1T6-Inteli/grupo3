extends KinematicBody2D

#Função que faz com que os buracos apareçam em cima da tela em looping
func _process(delta):
	if $Area2D.global_position.y >= Global.posicionamentoDoJogador +500:
		$Area2D.global_position.y = Global.posicionamentoDoJogador - 4512
	if $Area2D2.global_position.y >= Global.posicionamentoDoJogador +500:
		$Area2D2.global_position.y = Global.posicionamentoDoJogador - 3256
	if $Area2D3.global_position.y >= Global.posicionamentoDoJogador +500:
		$Area2D3.global_position.y = Global.posicionamentoDoJogador - 2128
		

#funções que realizam a troca de cena caso o caminhão colida com os buracos
func _on_Area2D_body_entered(body):
	Global.vidaDoCaminhao -=1
	if Global.vidaDoCaminhao >=1.5:
		damageScene.danoVisual()

func _on_Area2D2_body_entered(body):
	Global.vidaDoCaminhao -=1
	if Global.vidaDoCaminhao >=1.5:
		damageScene.danoVisual()
	
func _on_Area2D3_body_entered(body):
	Global.vidaDoCaminhao -=1
	if Global.vidaDoCaminhao >=1.5:
		damageScene.danoVisual()
