require("enemies")
require("collision")
require("sounds")

Player = {}

--functions
local move
local check_boundaries
local check_for_collision
local restart

function Player:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() - 100
    self.speed = 150
    self.spriteIdle = love.graphics.newImage("assets/player/player.png")
    self.spriteLeft = love.graphics.newImage("assets/player/playerLeft.png")
    self.spriteRight = love.graphics.newImage("assets/player/playerRight.png")
    self.sprite = self.spriteIdle
    self.isAlive = true
end

function Player:update(dt)
    if self.isAlive == true then
        move(dt)
        check_boundaries()
        check_for_collision()
    end
end

function Player:draw()
    if self.isAlive == true then
        love.graphics.draw(self.sprite, self.x, self.y)
    else
        restart()
    end
end

function move(dt)
    local isMoving = false --used in order to determine whether to put the idle animation or not
    if love.keyboard.isDown("d") then
        Player.x = Player.x + (Player.speed * dt)
        Player.sprite = Player.spriteRight
        isMoving = true
    end
    if love.keyboard.isDown("a") then
        Player.x = Player.x - (Player.speed * dt)
        Player.sprite = Player.spriteLeft
        isMoving = true
    end
    if love.keyboard.isDown("s") then
        Player.y = Player.y + (Player.speed * dt)
    end
    if love.keyboard.isDown("w") then
        Player.y = Player.y - (Player.speed * dt)
    end
    if isMoving == false then
        Player.sprite = Player.spriteIdle
    end
end

function check_boundaries()
    if Player.y < 0 then
        Player.y = 0
    elseif Player.y > (love.graphics.getHeight() - Player.sprite:getHeight()) then
        Player.y = love.graphics.getHeight() - Player.sprite:getHeight()
    end
    if Player.x < 0 then
        Player.x = 0
    elseif Player.x > (love.graphics.getWidth() - Player.sprite:getWidth()) then
        Player.x = love.graphics.getWidth() - Player.sprite:getWidth()
    end
end

function check_for_collision()
    for i, enemy in ipairs(Enemies) do
        if
            CheckCollision(
                enemy.x,
                enemy.y,
                enemy.sprite:getWidth(),
                enemy.sprite:getHeight(),
                Player.x,
                Player.y,
                Player.sprite:getWidth(),
                Player.sprite:getHeight()
            ) and Player.isAlive
         then
            table.remove(Enemies, i)
            Player.isAlive = false
            Sounds.dead:play()
        end
    end
end

function restart()
    if Player.isAlive == false then
        love.event.clear()
        love.graphics.print(
            "Press 'R' to restart",
            love.graphics:getWidth() / 2 - 120,
            love.graphics:getHeight() / 2 - 10
        )
        if love.keyboard.isDown("r") then
            love.event.quit("restart")
        end
    end
end
