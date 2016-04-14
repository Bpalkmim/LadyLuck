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
	love.graphics.setBackgroundColor(100,100,100)
end

-- Função principal de desenho. É chamada pela função main da aplicação e desenha
-- a janela.
function love.draw(dt)
	local welcomeMessage = [[Lady Luck sorri para você!

Utilize as setas <para cima> e <para baixo> do teclado para selecionar o número de faces do dado.
Para rolá-lo, pressione a <barra de espaço>.
Caso queira visualizar seu histórico de jogadas, pressione a tecla <H>.
Para importar as jogadas do arquivo "hist.csv", pressione <I>.
Para exportar o histórico de jogadas corrente para o arquivo "hist.csv", pressione <E>.
Para fechar a aplicação, pressione <F>.
	]]
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(welcomeMessage, 10, 10)

	local diceSizeMessage = "Tamanho do dado: " .. diceSize
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(diceSizeMessage, 10, 130)

	local lastRollMessage = "Última jogada: " .. lastRoll
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(lastRollMessage, 10, 150)
end

-- Desenha os componentes gráficos da aplicação e realiza interface com o usuário.
 
-- Increase the size of the rectangle every frame.
function love.update(dt)
	-- Aumentar o tamanho do dado
	if love.keyboard.isDown("up") then
		if diceSize < 20 then
			diceSize = diceSize + 1
		end
	end
	-- Diminuir o tamanho do dado
	if love.keyboard.isDown("down") then
		if diceSize > 2 then
			diceSize = diceSize - 1
		end
	end
	-- Rolar o dado
	if love.keyboard.isDown("space") then
		lastRoll = dice.roll(diceSize)
	end
	-- Mostrar o histórico de jogadas
	if love.keyboard.isDown("h") then
		lastRoll = dice.roll(diceSize)
	end
	-- Importar do arquivo
	if love.keyboard.isDown("i") then
		lastRoll = dice.roll(diceSize)
	end
	-- Exportar para o arquivo
	if love.keyboard.isDown("e") then
		lastRoll = dice.roll(diceSize)
	end
	-- Fechar a aplicação
	if love.keyboard.isDown("f") then
		love.event.quit(0)
	end
end

return view