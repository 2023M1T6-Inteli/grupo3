extends KinematicBody2D

#Criação de variáveis para armazenar valores da movimentação horizontal e vertical do caminhão
var velocidade_horizontal: Vector2
var multiplicador_de_velocidade_horizontal = 400
var velocidade_vertical: Vector2
var multiplicador_de_velocidade_vertical: int = 1500
#Função de física padrão do Godot para chamar funções de movimento
# warning-ignore:unused_argument
func _physics_process(delta):
	movimento_horizontal()
#Definindo a variavel movimento como slide para facilitar a detecção de colisões
	velocidade_horizontal = move_and_slide(velocidade_horizontal)
	velocidade_vertical = move_and_slide(velocidade_vertical)
	pass

#Função para realizar o movimento horizontal do caminhão
func movimento_horizontal() -> void:
	#Realizar a movimentação horizontal
	var validacao_de_movimento: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocidade_horizontal.x = validacao_de_movimento * multiplicador_de_velocidade_horizontal
	#Realizar a movimentação vertical
	velocidade_vertical.y = - multiplicador_de_velocidade_vertical
	
