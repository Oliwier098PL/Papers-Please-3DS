 -- Nest Library initialization for 3DS
nest_ok, nest = pcall(function()
    return require("nest").init({ console = "3ds" })
end)

-- Require other Lua modules
local Menu  = require "menu"
local Game  = require "game"
local Touch = require "touch"

Mode = "Menu"

-- Love.load: Initialize all modules
function love.load()
    Menu.load()
end

function love.update(dt)
    -- Get 3DS 3D slider depth
	sysDepth = -love.graphics.getDepth()

    if Mode == "Menu" then
        Menu.update(dt)
    end
end

-- Main draw function
function love.draw(screen)
    if Mode == "Menu" then
        Menu.draw(screen)
    end
end