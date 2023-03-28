Enemies = {}

function Enemies:load(n)
    for i = 1, n do
        enemyX = math.random(600)
        enemyY = math.random(600)
        enemySpeed = 40
        table.insert(Enemies,
            {
                x = enemyX,
                y = enemyY,
                speed = enemySpeed,
                sprite = love.graphics.newImage(chooseRandomPNG())
            })
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
            currentEnemy.y = currentEnemy.y - (currentEnemy.speed * dt)
        end
    end
end

function Enemies:draw()
    for i = 1, #Enemies do
        currentEnemy = Enemies[i]
        love.graphics.draw(currentEnemy.sprite, currentEnemy.x, currentEnemy.y)
    end
end

function chooseRandomPNG()
    n = math.random(1, 4)
    assetsPathsArray = {'assets/enemies/enemyShip.png', 'assets/enemies/enemyUFO.png', 'assets/enemies/meteorBig.png', 'assets/enemies/meteorSmall.png'}
    return  assetsPathsArray[n]
end
