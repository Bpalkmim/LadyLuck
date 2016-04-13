-- @module Test
-- @file testsReader.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável por realizar testes com o módulo Reader.
-- @version 0.1

local reader = require("reader")

-- Módulo de Lua que representa esse arquivo.
local testsReader = {
	-- Quantidade de erros encontrados.
	errorsReader = 0
}
print(reader.readFile)
-- Função para teste da função reader.readFile(fileName).
-- @param expected Valor esperado do teste. Quantidade de jogadas.
-- @return TRUE caso o teste tenha sido realizado com sucesso, FALSE caso contrário.
function testsReader.read(expected)
	local obtained = reader.readFile("../Tests/input.csv")

	if #obtained ~= #expected then
		return false
	end

	for i=1,#expected do
		if obtained[i] ~= expected[i] then
			return false
		end
	end

	return true
end

-- Função que executa os métodos de testes de cada função. É chamada pela suíte de
-- testes no módulo tests.
function testsReader.executeReaderTests()
	print("Testando Reader: read")
	if testsReader.read({5, 9, 3, 6, 10, 11, 17, 2, 1, 3}) == false then
		print("--Erro em Reader: read")
		testsReader.errorsReader = testsReader.errorsReader + 1
	end
end

return testsReader