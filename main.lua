require("player")
require("bullets")

function love.load()
    Player:load()
    Bullets:load()
end

function love.update(dt)
    Player:update(dt)
    Bullets:update(dt)
end

function love.draw()
    Player:draw()
    Bullets:draw()
end

function love.mousepressed(x, y, button, isTouch)
    bulletCreate(x, y, button)
end