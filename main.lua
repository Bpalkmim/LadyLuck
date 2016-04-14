-- @module Main
-- @file main.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável por gerar a interface gráfica com
-- o usuário, mostrando menus, os dados rodados e gráficos gerados.
-- @version 0.1

local dice = require("Dice/dice")
local reader = require("IO/reader")
local writer = require("IO/writer")

-- Módulo de Lua que representa esse arquivo.
local view = {}

-- Tamanho atual do dado
local diceSize = 6
-- Valor da última jogada
local lastRoll = 0

-- Função que desenha a janela quando a aplicação inicia.
function love.load()
	love.graphics.setBackgroundColor(100, 100, 100)
end

-- Função principal de desenho. É chamada pela função main da aplicação e desenha
-- a janela.
function love.draw(dt)
	local welcomeMessage = [[A Dama da Sorte sorri para você!

Utilize as setas <para cima> e <para baixo> do teclado para selecionar o número de faces do dado.
Para rolá-lo, pressione a <barra de espaço>.
Para importar as jogadas do arquivo "hist.csv", pressione <I>.
Para exportar o histórico de jogadas corrente para o arquivo "hist.csv", pressione <E>.
Para fechar a aplicação, pressione <F>.
	]]
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(welcomeMessage, 30, 30)

	local diceSizeMessage = "Número de faces do dado: " .. diceSize
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(diceSizeMessage, 30, 150)

	local lastRollMessage = "Última jogada: " .. lastRoll
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(lastRollMessage, 30, 170)

	if lastRoll == 0 or #(dice.history) ~= 0 then
		showHistory()
	elseif #(dice.history) == 0 then
		love.graphics.setColor(0, 0, 0)
		love.graphics.print("Não foi possível ler o arquivo!", 30, 210)
	end
end

-- Atualiza as funcionalidades da aplicação.
function love.update(dt)

end

-- Função que mostra o histórico de jogadas do dado atual.
function showHistory()
	-- Fundo
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", 30, 240, 660, 200)
	-- Pontos no gráfico
	local initXPos = 30
	local initYPos = 430
	local incXPos = 25
	local incYPos = 8
	love.graphics.setColor(0, 0, 50)
	for i=1,#(dice.history) do
		love.graphics.circle("fill", initXPos + i*incXPos, initYPos - dice.history[i]*incYPos, 5, 10)
		love.graphics.print(dice.history[i], initXPos + i*incXPos - 3, initYPos - dice.history[i]*incYPos - 20)
	end
end

function love.keypressed(key, scancode, isrepeat)
	-- Aumentar o tamanho do dado
	if key == "up" then
		if diceSize < 20 then
			diceSize = diceSize + 1
		end
	-- Diminuir o tamanho do dado
	elseif key == "down" then
		if diceSize > 2 then
			diceSize = diceSize - 1
		end
	-- Rolar o dado
	elseif key == "space" then
		lastRoll = dice.roll(diceSize)
	-- Importar do arquivo
	elseif key == "i" then
		dice.history = reader.readFile("./LadyLuck/hist.csv")
	-- Exportar para o arquivo
	elseif key == "e" then
		dice.history = writer.writeFile("./LadyLuck/hist.csv", dice.history)
	-- Fechar a aplicação
	elseif key == "f" then
		love.event.quit(0)
	end
end

return view