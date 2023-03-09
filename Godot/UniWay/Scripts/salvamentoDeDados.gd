extends Node

var save :String = "user://save.dat"

var Ranking :Dictionary = {
	"nomeDoJogador": [],
	"pontos": [],
	"rankingFuncional": []
	}
func saveData() -> void:
	var file: File = File.new()
	var testagem  = file.open(save, File.WRITE)
	if testagem == OK:
		file.store_var(Ranking)
		file.close()
	
func loadData() -> void:
	var file :File = File.new()
	if file.file_exists(save):
		var error = file.open(save, File.READ)
		if error == OK:
			Ranking = file.get_var()
			file.close()
