require("player")
require("bullets")
require("enemies")
require("background")
require("sounds")
require("menu")

function love.load()
    Menu.load()
    Player:load()
    Bullets:load()
    Background:load()
    Sounds:load()
end

function love.update(dt)
    if Player.isPaused then
        return
    end
    Menu:update(dt)
end

function love.draw()
    Menu:draw()
end