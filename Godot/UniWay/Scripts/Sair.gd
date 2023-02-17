extends Button



func _ready():
	pass 


func _on_Sair_tree_exiting():
	get_tree().change_scene("res://Cenas/Control.tscn")
	pass

func _on_Sair_pressed():
	pass ;get_tree().change_scene("res://Cenas/Control.tscn")
