-- @module Test
-- @file testsWriter.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável por realizar testes com o módulo Writer.
-- @version 0.1

local writer = require("writer")

-- Módulo de Lua que representa esse arquivo.
local testsWriter = {
	-- Quantidade de erros encontrados.
	errorsWriter = 0
}

-- Função para teste da função writer.writeFile(fileName, array). Aqui cria-se um
-- arquivo temporariamente, que será deletado antes do término da função.
-- @param expected Valor esperado do teste. Quantidade de jogadas.
-- @return TRUE caso o teste tenha sido realizado com sucesso, FALSE caso contrário.
function testsWriter.write(expected)





	os.remove(path)

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
function testsWriter.executeWriterTests()
	print("Testando Writer: write")
	if testsWriter.write({5, 9, 3, 6, 10, 11, 17, 2, 1, 3}) == false then
		print("--Erro em Writer: write")
		testsWriter.errorsWriter = testsWriter.errorsWriter + 1
	end
end

return testsWriter