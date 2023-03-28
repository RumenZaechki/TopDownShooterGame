require("player")
require("bullets")
require("enemies")
require("background")

function love.load()
    Player:load()
    Bullets:load()
    Enemies:load(1)
    Background:load()
end

function love.update(dt)
    Player:update(dt)
    Bullets:update(dt)
    Enemies:update(dt, Player.x, Player.y)
end

function love.draw()
    Background:draw()
    Player:draw()
    Bullets:draw()
    Enemies:draw()
end
