require("player")

Bullets = {}

function Bullets:load()
    Cooldown = 0
    BulletSpeed = 250
end

function Bullets:update(dt)
    Cooldown = math.max(Cooldown - dt,0)
    if love.keyboard.isDown("space") and Cooldown == 0 then
        Cooldown = 0.25
        Bullets:create(Player.x, Player.y)
    end
    for i = 1, #Bullets do
        Bullets[i].y = Bullets[i].y - (BulletSpeed * dt)
    end
end

function Bullets:draw()
    for i = 1, #Bullets do
        love.graphics.draw(Bullets[i].sprite, Bullets[i].x, Bullets[i].y)
    end
end

function Bullets:create(x, y)
    local startX = Player.x
    local startY = Player.y

    table.insert(Bullets,
        {
            x = startX,
            y = startY,
            sprite = love.graphics.newImage('assets/bullets/laserRed.png')
        })
end
