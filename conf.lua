-- @module Conf
-- @file conf.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável pela configuração da interface
-- gráfica da aplicação.
-- @version 0.1

-- Módulo de Lua que representa esse arquivo.
local conf = {}

-- Função da biblioteca Löve para configuração dos parâmetros da janela da
-- aplicação.
-- @param window Janela que representa a aplicação.
function love.conf(window)
	window.title = "Lady Luck"
	window.version = "0.10.1" -- Versão de Löve dessa aplicação
	window.author = "Bernardo Alkmim"
	window.modules.graphics = true
	window.modules.image = true
	window.modules.keyboard = true
	window.modules.mouse = true
	window.modules.event = true
	window.window.fullscreen = false
	window.window.width = 720
	window.window.height = 480
end

return conf