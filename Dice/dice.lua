-- @module Dice
-- @file dice.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/10
-- @description Este arquivo está responsável por simular uma jogada
-- de dado de 2 a 20 faces. Apesar de simples, aqui se encontra o coração
-- da aplicação. Suas funcionalidades são utilizadas pelos módulos View
-- e IO.
-- @version 0.1

-- Módulo de Lua que representa esse arquivo.
local dice = {
	-- Array público com o histórico das jogadas. Somente um pode estar ativo por
	-- vez.
	history = {}
}

-- Funções de get e set do array com o histórico de jogadas, além do seu
-- tamanho.
function dice.setHistory(hist)
	dice.history = hist
end

function dice.getHistory()
	return dice.history
end

-- Função que rola o dado utilizando LCG, que gera uma distribuição uniforme
-- de números pseudoaleatórios.
-- @param max Valor máximo possível.
-- @return Valor obtido no dado.
function dice.roll(max)
	dice.history[#(dice.history) + 1] = math.random(max)
	return dice.history[#(dice.history)]
end

return dice