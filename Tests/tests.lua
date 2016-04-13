-- @module Test
-- @file tests.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável por rodar os testes de IO
-- (e quaisquer outros que sejam necessários).
-- @version 0.1

package.path = package.path .. ";../Dice/dice.lua"
local testsDice = require("testsDice")
package.path = package.path .. ";../IO/reader.lua"
local testsReader = require("testsReader")
package.path = package.path .. ";../IO/writer.lua"
local testsWriter = require("testsWriter")

-- Módulo de Lua que representa esse arquivo.
local tests = {}

-- Função principal do módulo, que executa todos os testes dos módulos
-- de teste específicos.
function tests.executeSuite()
	testsDice.executeDiceTests()
	print("Erros nos testes de Dice:", testsDice.errorsDice)
	-- TODO depois da parte gráfica
	--testsReader.executeReaderTests()
	print("Erros nos testes de Reader:", testsReader.errorsReader)
	-- TODO depois da parte gráfica
	--testsWriter.executeWriterTests()
	print("Erros nos testes de Writer:", testsWriter.errorsWriter)

	print("Total de erros nos testes:", testsDice.errorsDice + testsReader.errorsReader + testsWriter.errorsWriter)
end

-- Execução dos testes
tests.executeSuite()

return tests