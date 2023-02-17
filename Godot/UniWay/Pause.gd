extends Control

func _ready():
	self.visible = false

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("paused"):
		self.is_paused = !is_paused
		self.visible = true
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_Resumir_pressed():
	self.is_paused = false
	print("estou aqui")
	self.visible = false


func _on_Sair_pressed():
	self.is_paused = false
	get_tree().change_scene("res://Control.tscn")



