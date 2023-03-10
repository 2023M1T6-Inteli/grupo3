extends Node

#Variável para criar um salvamento local
var save :String = "user://save.dat"

#Variavéis para armazenar o ranking do jogo 
var pontosJogador1 :float
var nomeJogador1
var pontosJogador2 :float
var nomeJogador2
var pontosJogador3 :float
var nomeJogador3
var pontosJogador4 :float
var nomeJogador4
var pontosJogador5 :float
var nomeJogador5

#Função de salvamento de dados do jogo
func saveData() -> void:
	var file: File = File.new()
	var testagem  = file.open(save, File.WRITE)
	if testagem == OK:
		file.store_var(pontosJogador1)
		file.store_var(nomeJogador1)
		file.store_var(pontosJogador2)
		file.store_var(nomeJogador2)
		file.store_var(pontosJogador3)
		file.store_var(nomeJogador3)
		file.store_var(pontosJogador4)
		file.store_var(nomeJogador4)
		file.store_var(pontosJogador5)
		file.store_var(nomeJogador5)
		file.close()
	
#Função de carregamento dos arquivos salvos
func loadData() -> void:
	var file :File = File.new()
	if file.file_exists(save):
		var error = file.open(save, File.READ)
		if error == OK:
			pontosJogador1 = file.get_var()
			nomeJogador1 = file.get_var()
			pontosJogador2 = file.get_var()
			nomeJogador2 = file.get_var()
			pontosJogador3 = file.get_var()
			nomeJogador3 = file.get_var()
			pontosJogador4 = file.get_var()
			nomeJogador4 = file.get_var()
			pontosJogador5 = file.get_var()
			nomeJogador5 = file.get_var()
			file.close()

