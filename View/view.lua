-- @module View
-- @file view.lua
-- @author Bernardo Pinto de Alkmim
-- @creation 2016/04/11
-- @description Este arquivo é responsável por gerar a interface gráfica com
-- o usuário, mostrando menus, os dados rodados e gráficos gerados. É chamado
-- pelo módulo Main e utiliza os módulos Dice e IO.
-- @version 0.1

-- Módulo de Lua que representa esse arquivo.
local view = {}

-- Função que desenha a janela quando a aplicação inicia. Há um esboço de como deve 
-- aparecer a janela da aplicação na imagem ./../windowExample.jpg.
function view.load(arg)


end

-- Função principal de desenho. É chamada pela função main da aplicação e desenha
-- a janela. 
-- Obs.: É basicamente um wrapper da love.draw() da biblioteca gráfica Löve.
function view.draw(dt)
	love.draw(dt)
end

-- Desenha os componentes gráficos da aplicação e realiza interface com o usuário.
-- Chamada por view.draw().
function love.draw(dt)
	
end

function love.load(arg)

end

function love.update(dt)

end

return view