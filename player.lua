Player = {}

function Player:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() - 100
    self.speed = 150
    self.spriteIdle = love.graphics.newImage('assets/player/player.png')
    self.spriteLeft = love.graphics.newImage('assets/player/playerLeft.png')
    self.spriteRight = love.graphics.newImage('assets/player/playerRight.png')
    self.sprite = self.spriteIdle
end

function Player:update(dt)
    self:move(dt)
    self:checkBoundaries()
end

function Player:draw()
    love.graphics.draw(self.sprite, self.x, self.y)
end

function Player:move(dt)
    local isMoving = false;--used in order to determine whether to put the idle animation or not
    if love.keyboard.isDown("d") then
        self.x = self.x + (self.speed * dt)
        self.sprite = self.spriteRight
        isMoving = true;
    end
    if love.keyboard.isDown("a") then
        self.x = self.x - (self.speed * dt)
        self.sprite = self.spriteLeft
        isMoving = true;
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + (self.speed * dt)
    end
    if love.keyboard.isDown("w") then
        self.y = self.y - (self.speed * dt)
    end
    if isMoving == false then
        self.sprite = self.spriteIdle
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
