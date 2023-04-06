require("menu")

function love.load()
    Menu:load()
end

function love.update(dt)
    Menu:update(dt)
end

function love.draw()
    Menu:draw()
end
