require("player")
require("bullets")
require("enemies")
require("background")
require("sounds")

function love.load()
    Player:load()
    Bullets:load()
    -- Enemies:load()
    Background:load()
    Sounds:load()
end

function love.update(dt)
    Player:update(dt)
    Bullets:update(dt)
    Enemies:update(dt)
    Sounds:update()
end

function love.draw()
    Background:draw()
    Player:draw()
    Bullets:draw()
    Enemies:draw()
end