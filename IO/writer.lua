-- @module Writer
-- @file writer.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável por ler arquivos CSV e gerar
-- arrays de inteiros. Utilizado pelo módulo View, e utiliza o módulo 
-- Dice para os arrays.
-- @version 0.1

-- Módulo de Lua que representa esse arquivo.
local writer = {
	debug = false
}

-- Função que escreve o array recebido em um arquivo no formato CSV.
-- @param fileName O nome do arquivo a ser criado.
-- @param array O array a ser escrito.
-- @return O array caso tenha sido escrito, nil caso contrário.
function writer.writeFile(fileName, array)
	local output = nil

	if debug == true then
		output = assert(io.open(fileName, "w"))
	else
		output = love.filesystem.newFile(fileName, "w")
		output:open("w")
	end
	if #array > 0 then 
		for i=1,(#array-1) do
			output:write(array[i], ",")
		end

		-- O último número não paresenta vírgula ao final.
		output:write(array[#array])
	end

	output:close()

	return array
end

return writer