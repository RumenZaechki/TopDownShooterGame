-- require("player")

Bullets = {}

function Bullets:load()
    Cooldown = 0
    BulletSpeed = 250
end

function Bullets:update(dt)
    Cooldown = math.max(Cooldown - dt,0)
    if love.keyboard.isDown("space") and Cooldown == 0 then
        Cooldown = 0.25
        Bullets:create()
    end
    for i, bullet in ipairs(Bullets) do
        Bullets[i].y = Bullets[i].y - (BulletSpeed * dt)

        --remove bullet if out of borders
        if Bullets[i].y < 0 then
            table.remove( Bullets, i)
        end
    end
end

function Bullets:draw()
    for i = 1, #Bullets do
        love.graphics.draw(Bullets[i].sprite, Bullets[i].x, Bullets[i].y)
    end
end

function Bullets:create()
    --This was the only way I knew to make the bullet spawn from the center of the player's position.
    --If anyone is watching this and knows how to do it in a better way, please do tell me,
    --because I spent more time than I dare admit on this.
    local startX = Player.x + 47
    local startY = Player.y

    table.insert(Bullets,
        {
            x = startX,
            y = startY,
            sprite = love.graphics.newImage('assets/bullets/laserRed.png')
        })
end
