Player = {}

function Player:load()
    self.x = 100
    self.y = 100
    self.speed = 100
end

function Player:update(dt)
    if love.keyboard.isDown("d") then
        self.x = self.x + (self.speed * dt)
    end
    if love.keyboard.isDown("a") then
        self.x = self.x - (self.speed * dt)
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + (self.speed * dt)
    end
    if love.keyboard.isDown("w") then
        self.y = self.y - (self.speed * dt)
    end
end

function Player:draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle("fill", self.x, self.y, 20)
end