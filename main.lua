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

-- Função que desenha a janela quando a aplicação inicia.
function love.load()
	love.graphics.setBackgroundColor(100,100,100)

	local welcomeText = [[Lady Luck sorri para você!

	


	]]
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(welcomeText, 400, 300)
end

-- Função principal de desenho. É chamada pela função main da aplicação e desenha
-- a janela.
function love.draw(dt)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Hello World", 400, 300)
end

-- Desenha os componentes gráficos da aplicação e realiza interface com o usuário.
 
-- Increase the size of the rectangle every frame.
function love.update(dt)

end

return view