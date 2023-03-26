require("player")

Bullets = {}

function Bullets:load()
    BulletSpeed = 250
end

function Bullets:update(dt)
    for i = 1, #Bullets do
        Bullets[i].x = Bullets[i].x + (Bullets[i].dx * dt)
        Bullets[i].y = Bullets[i].y + (Bullets[i].dy * dt)
    end
end

function Bullets:draw()
    for i = 1, #Bullets do
        love.graphics.setColor(1, 0, 0)
        love.graphics.circle("fill", Bullets[i].x, Bullets[i].y, 5)
        love.graphics.setColor(1, 1, 1)
    end
end

function Bullets:create(x, y, button)
    local startX = Player.x
    local startY = Player.y
    local mouseX = x
    local mouseY = y

    local angle = math.atan2((mouseY - startY), (mouseX - startX))

    local bulletDx = BulletSpeed * math.cos(angle)
    local bulletDy = BulletSpeed * math.sin(angle)

    table.insert(Bullets, { x = startX, y = startY, dx = bulletDx, dy = bulletDy })
end