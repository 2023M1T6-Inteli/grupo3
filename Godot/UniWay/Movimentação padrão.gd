extends KinematicBody2D

#Criação de variáveis para armazenar valores da movimentação horizontal e vertical do caminhão
var Velocidade_horizontal: Vector2
var Multiplicador_de_velocidade_horizontal = 400
var Velocidade_vertical: Vector2
var Multiplicador_de_velocidade_vertical: int = 1500
#Função de física padrão do Godot para chamar funções de movimento
# warning-ignore:unused_argument
func _physics_process(delta):
	movimento_horizontal()
#Definindo a variavel movimento como slide para facilitar a detecção de colisões
	Velocidade_horizontal = move_and_slide(Velocidade_horizontal)
	Velocidade_vertical = move_and_slide(Velocidade_vertical)
	pass

#Função para realizar o movimento horizontal do caminhão
func movimento_horizontal() -> void:
	#Realizar a movimentação horizontal
	var Validacao_de_movimento: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	Velocidade_horizontal.x = Validacao_de_movimento * Multiplicador_de_velocidade_horizontal
	#Realizar a movimentação vertical
	Velocidade_vertical.y = - Multiplicador_de_velocidade_vertical
	
