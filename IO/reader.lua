-- @module Reader
-- @file reader.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável por ler arquivos CSV e gerar
-- arrays de inteiros. Utilizado pelo módulo View, e utiliza o módulo 
-- Dice para os arrays.
-- @version 0.8

-- Módulo de Lua que representa esse arquivo.
local reader = {
	debug = false
}

-- Função que lê uma sequência de números de um arquivo e os guarda num
-- array. O arquivo deve estar no formato CSV.
-- @param fileName O nome do arquivo a ser lido.
-- @return O array criado. Caso o arquivo não tenha sido aberto ou esteja vazio,
-- esse array estará vazio.
function reader.readFile(fileName)
	local array = {}
	-- Padrão para reconhecimento do arquivo. Expressão regular que representa
	-- números inteiros positivos separados por vírgulas
	local pattern = "(%d+)%s*,?%s*"
	local i = 1
	local input = nil

	if debug == true then
		input = assert(io.open(fileName, "r"))
	else
		input = love.filesystem.newFile(fileName, "r")
		input:open("r")
	end

	for val in string.gfind(input:read("*all"), pat) do
		array[i] = tonumber(val)
		i = i + 1
	end

	input:close()

	return array
end

return reader