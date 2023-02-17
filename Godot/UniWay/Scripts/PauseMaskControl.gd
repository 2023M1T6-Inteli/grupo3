extends Node2D


func _process(delta):
	if(Global.verificadorDePause == true):
		$KinematicBody2D/Camera2D/pauseMask.visible = true
		$ParallaxBackground/pauseMask2.visible = true
	else:
		$KinematicBody2D/Camera2D/pauseMask.visible = false
		$ParallaxBackground/pauseMask2.visible = false
