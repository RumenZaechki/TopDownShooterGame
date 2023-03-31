require("player")
require("bullets")
require("enemies")
require("background")

function love.load()
    Player:load()
    Bullets:load()
    Enemies:load()
    Background:load()
end

function love.update(dt)
    Player:update(dt)
    Bullets:update(dt)
    Enemies:update(dt)
end

function love.draw()
    Background:draw()
    Player:draw()
    Bullets:draw()
    Enemies:draw()
end
