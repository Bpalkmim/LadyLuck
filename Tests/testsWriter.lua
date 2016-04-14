-- @module Test
-- @file testsWriter.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável por realizar testes com o módulo Writer.
-- @version 0.8

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
	local obtained = {}
	local output = writer.writeFile("../Tests/output.csv", expected)
	output:close()
	output = assert(io.open(fileName, "r"))

	-- Padrão para reconhecimento do arquivo. Expressão regular que representa
	-- números inteiros positivos separados por vírgulas
	local pattern = "(%d+)%s*,?%s*"
	local i = 1

	for val in string.gfind(io.read("*all"), pat) do
		obtained[i] = tonumber(val)
		i = i + 1
    end

	output:close()
	os.remove("../Tests/output.csv")

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
	writer.debug = true
	print("Testando Writer: write")
	if testsWriter.write({5, 9, 3, 6, 10, 11, 17, 2, 1, 3}) == false then
		print("--Erro em Writer: write")
		testsWriter.errorsWriter = testsWriter.errorsWriter + 1
	end
end

return testsWriter