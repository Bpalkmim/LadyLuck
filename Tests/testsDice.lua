-- @module Test
-- @file testsDice.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável por realizar testes com o módulo Dice.
-- @version 0.1

local dice = require("dice")

-- Módulo de Lua que representa esse arquivo.
local testsDice = {
	-- Quantidade de erros encontrados.
	errorsDice = 0
}

-- Função para teste da função dice.setHistory(hist, size).
-- @param expected Valor esperado do teste. Array de histórico de jogadas.
-- @return TRUE caso o teste tenha sido realizado com sucesso, FALSE caso contrário.
function testsDice.set(expected)
	dice.setHistory(expected)

	if #(dice.history) ~= #expected then
		return false
	end

	for i=1,#expected do
		if dice.history[i] ~= expected[i] then
			return false
		end
	end

	return true
end

-- Função para teste da função dice.getHistory(). Deve ser realizado após o teste do
-- dice.setHistory(), pois depende do funcionamento dele.
-- @param expected Valor esperado do teste. Array de histórico de jogadas.
-- @return TRUE caso o teste tenha sido realizado com sucesso, FALSE caso contrário.
function testsDice.get(expected)
	dice.setHistory(expected)
	testArray = dice.getHistory()

	if #testArray ~= #expected then
		return false
	end

	for i=1,#expected do
		if testArray[i] ~= expected[i] then
			return false
		end
	end
	return true
end

-- Função para teste da função dice.roll(max). Verifica-se se o tamanho do array está
-- correto. Utiliza-se um dado de 20 faces.
-- @param expected Valor esperado do teste. Quantidade de jogadas.
-- @return TRUE caso o teste tenha sido realizado com sucesso, FALSE caso contrário.
function testsDice.roll(expected)
	-- Limpar dice para a execução do teste
	dice.setHistory({}, 0)

	for i=1,expected do
		dice.roll(20)
	end

	if #(dice.history) == expected then
		return true
	else
		return false
	end
end

-- Função que executa os métodos de testes de cada função. É chamada pela suíte de
-- testes no módulo tests.
function testsDice.executeDiceTests()
	print("Testando Dice: set")
	if testsDice.set({5, 9, 3, 6, 10, 11, 17, 2, 1, 3}) == false then
		print("--Erro em Dice: set")
		testsDice.errorsDice = testsDice.errorsDice + 1
	end

	print("Testando Dice: get")
	if testsDice.get({5, 9, 3, 6, 10, 11, 17, 2, 1, 3}) == false then
		print("--Erro em Dice: get")
		testsDice.errorsDice = testsDice.errorsDice + 1
	end

	print("Testando Dice: roll")
	if testsDice.roll(10) == false then
		print("--Erro em Dice: roll")
		testsDice.errorsDice = testsDice.errorsDice + 1
	end
end

return testsDice