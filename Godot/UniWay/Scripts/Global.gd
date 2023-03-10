extends Node

#Variáveis utilizadas para armazenar e tranferir valores entre cenas.

var verificadorDePause :bool

var pontosArmazenados :float

var posicionamentoDoJogador

var validadorDoTutorial :bool = true

#Se essa variável for igual a 0 o idioma é PT-BR
#Se essa variável for igual a 1 o idioma é Inglês
#Se essa variável for igual a 2 o idioma é espanhol
var idiomaEscolhido :float = 0

#Vida do caminhão começa em 4
var vidaDoCaminhao :float

var nomeDoJogador :String

