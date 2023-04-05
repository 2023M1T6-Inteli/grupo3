extends KinematicBody2D

var movimento = Vector2()

func _process(delta):
	teletransporte()
	




func teletransporte():
	if $pedra.global_position.y >= Global.posicionamentoDoJogador + 400:
		$pedra.global_position.y = Global.posicionamentoDoJogador - 1280
	if $pedra2.global_position.y >= Global.posicionamentoDoJogador + 400:
		$pedra2.global_position.y = Global.posicionamentoDoJogador - 1320
	if $pedra3.global_position.y >= Global.posicionamentoDoJogador + 400:
		$pedra3.global_position.y = Global.posicionamentoDoJogador - 1200
	if $pedra4.global_position.y >= Global.posicionamentoDoJogador + 400:
		$pedra4.global_position.y = Global.posicionamentoDoJogador - 1500
	if $pedra.global_position.y < $pedra2.global_position.y + 100 and $pedra.global_position.y > $pedra2.global_position.y - 100:
		$pedra2.visible = false
	else:
		$pedra2.visible = true
	if $pedra.global_position.y < $pedra3.global_position.y + 100 and $pedra.global_position.y > $pedra3.global_position.y - 100:
		$pedra3.visible = false
	else:
		if $pedra2.global_position.y < $pedra3.global_position.y + 100 and $pedra2.global_position.y > $pedra3.global_position.y - 100:
			$pedra3.visible = false
		else:
			$pedra3.visible = true
	if $pedra.global_position.y < $pedra4.global_position.y + 100 and $pedra.global_position.y > $pedra4.global_position.y - 100:
		$pedra4.visible = false
	else:
		if $pedra2.global_position.y < $pedra4.global_position.y + 100 and $pedra2.global_position.y > $pedra4.global_position.y - 100:
			$pedra4.visible = false
		else:
			if $pedra3.global_position.y < $pedra4.global_position.y + 100 and $pedra3.global_position.y > $pedra4.global_position.y - 100:
				$pedra4.visible = false
			else:
				$pedra4.visible = true
				

