extends KinematicBody2D

var movimento = Vector2()

func _process(delta):
	teletransporte()
	#movimentacao()
	




func teletransporte():
	if $arvore.global_position.y >= Global.posicionamentoDoJogador + 400:
		$arvore.global_position.y = Global.posicionamentoDoJogador - 1280
	if $arvore2.global_position.y >= Global.posicionamentoDoJogador + 400:
		$arvore2.global_position.y = Global.posicionamentoDoJogador - 1320
	if $arvore3.global_position.y >= Global.posicionamentoDoJogador + 400:
		$arvore3.global_position.y = Global.posicionamentoDoJogador - 1200
	if $arvore4.global_position.y >= Global.posicionamentoDoJogador + 400:
		$arvore4.global_position.y = Global.posicionamentoDoJogador - 1500
	if $arvore.global_position.y < $arvore2.global_position.y + 100 and $arvore.global_position.y > $arvore2.global_position.y - 100:
		$arvore2.visible = false
	else:
		$arvore2.visible = true
	if $arvore.global_position.y < $arvore3.global_position.y + 100 and $arvore.global_position.y > $arvore3.global_position.y - 100:
		$arvore3.visible = false
	else:
		if $arvore2.global_position.y < $arvore3.global_position.y + 100 and $arvore2.global_position.y > $arvore3.global_position.y - 100:
			$arvore3.visible = false
		else:
			$arvore3.visible = true
	if $arvore.global_position.y < $arvore4.global_position.y + 100 and $arvore.global_position.y > $arvore4.global_position.y - 100:
		$arvore4.visible = false
	else:
		if $arvore2.global_position.y < $arvore4.global_position.y + 100 and $arvore2.global_position.y > $arvore4.global_position.y - 100:
			$arvore4.visible = false
		else:
			if $arvore3.global_position.y < $arvore4.global_position.y + 100 and $arvore3.global_position.y > $arvore4.global_position.y - 100:
				$arvore4.visible = false
			else:
				$arvore4.visible = true
				

