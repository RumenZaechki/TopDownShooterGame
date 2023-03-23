function love.load()
    x = 100
    y = 100
    speed = 100
end

function love.update(dt)
    if love.keyboard.isDown("d") then
        x = x + (speed * dt)
    end
    if love.keyboard.isDown("a") then
        x = x - (speed * dt)
    end
    if love.keyboard .isDown("s") then
        y = y + (speed * dt)
    end
    if love.keyboard .isDown("w") then
        y = y - (speed * dt)
    end
end

function love.draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle("fill", x, y, 20)
end