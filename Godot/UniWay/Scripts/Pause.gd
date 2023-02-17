extends Control

func _ready():
	self.visible = false

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("paused"):
		self.is_paused = !is_paused
		if (self.visible == false):
			self.visible = true
		else:
			self.visible = false

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused

func _on_Resumir_pressed():
	self.is_paused = false
	print("estou aqui")
	self.visible = false


func _on_Sair_pressed():
	self.is_paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Cenas/Control.tscn")
	
func _process(delta) ->void:
	if(self.visible == true):
		Global.verificadorDePause = true
	else:
		Global.verificadorDePause = false



