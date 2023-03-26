Enemies = {}

function Enemies:load(n)
    for i = 1, n do 
        enemyX = math.random(600)
        enemyY = math.random(600)
        enemySpeed = 40
        table.insert(Enemies, {x = enemyX, y = enemyY, speed = enemySpeed})
    end
end

function Enemies:update(dt, playerX, playerY)
    for i = 1, #Enemies do
        currentEnemy = Enemies[i]     
        if playerX - currentEnemy.x > 0 then
            currentEnemy.x = currentEnemy.x + (currentEnemy.speed * dt)
        elseif playerX - currentEnemy.x < 0 then
            currentEnemy.x = currentEnemy.x - (currentEnemy.speed * dt)
        end
        
        if playerY - currentEnemy.y > 0 then
            currentEnemy.y = currentEnemy.y + (currentEnemy.speed * dt)
        elseif playerY - currentEnemy.y < 0 then
            currentEnemy.y = currentEnemy.y - (currentEnemy.speed* dt)
        end
    end
end

function Enemies:draw()
    for i = 1, #Enemies do 
        currentEnemy = Enemies[i] 
        love.graphics.setColor(1, 0, 0)
        love.graphics.circle("fill", currentEnemy.x, currentEnemy.y, 15)
    end
end

function Enemies:checkForCollision(bulletX, bulletY)
    --TODO
end