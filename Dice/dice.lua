-- @module Dice
-- @file dice.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/10
-- @description Este arquivo está responsável por simular uma jogada
-- de dado de 2 a 20 faces. Apesar de simples, aqui se encontra o coração
-- da aplicação. Suas funcionalidades são utilizadas pelo módulo View.
-- @version 1.0

-- Módulo de Lua que representa esse arquivo.
local dice = {
	-- Array público com o histórico das jogadas. Somente um pode estar ativo por
	-- vez.
	history = {}
}

-- Funções de get e set do array com o histórico de jogadas, além do seu
-- tamanho.
-- Nesta função, dice.history terá sido alterado.
function dice.setHistory(hist)
	dice.history = hist
end
-- Esta função retorna dice.history.
function dice.getHistory()
	return dice.history
end

-- Função que rola o dado utilizando LCG, que gera uma distribuição uniforme
-- de números pseudoaleatórios. Ela também preenche o array dice.history com
-- o valor encontrado.
-- @param max Valor máximo possível.
-- @return Valor obtido no dado. Esse valor terá sido adicionado ao array
-- dice.history.
function dice.roll(max)
	dice.history[#(dice.history) + 1] = math.random(max)
	return dice.history[#(dice.history)]
end

return dice