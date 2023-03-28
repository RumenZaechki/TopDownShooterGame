Player = {}

function Player:load()
    self.x = 100
    self.y = 100
    self.speed = 150
    self.sprite = love.graphics.newImage('assets/player/player.png')
end

function Player:update(dt)
    self:move(dt)
    self:checkBoundaries()
end

function Player:draw()
    love.graphics.draw(self.sprite, self.x, self.y)
end

function Player:move(dt)
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

function Player:checkBoundaries()
    if self.y < 0 then
        self.y = 0
    elseif self.y > love.graphics.getHeight() then
        self.y = love.graphics.getHeight()
    end
    if self.x < 0 then
        self.x = 0
    elseif self.x > love.graphics.getWidth() then
        self.x = love.graphics.getWidth()
    end
end
