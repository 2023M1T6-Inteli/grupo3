extends KinematicBody2D

var deslocamentoHorizontal: Vector2

func _ready():
	Global.validadorDoTurorial = false

func _process(delta):
	deslocamentoHorizontal = move_and_slide(deslocamentoHorizontal)
	deslocamentoHorizontal.x = -200
	if self.global_position.x <= 0 and self.global_position.x >= -1000 and :
		Global.validadorDoTurorial = true
	
