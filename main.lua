require("player")
require("bullets")
require("enemies")

function love.load()
    Player:load()
    Bullets:load()
    Enemies:load(1)
end

function love.update(dt)
    Player:update(dt)
    Bullets:update(dt)
    Enemies:update(dt, Player.x, Player.y)
end

function love.draw()
    Player:draw()
    Bullets:draw()
    Enemies:draw()
end

function love.mousepressed(x, y, button)
    Bullets:create(x, y, button)
    Enemies:checkForCollision(x, y)
end
