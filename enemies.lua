Enemies = {}

function Enemies:load(n)
    for i = 1, n do
        enemyX = math.random(600)
        enemyY = 0
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
        currentEnemy.y = currentEnemy.y + (currentEnemy.speed * dt)
    end
end

function Enemies:draw()
    for i = 1, #Enemies do
        currentEnemy = Enemies[i]
        love.graphics.draw(currentEnemy.sprite, currentEnemy.x, currentEnemy.y)
    end
end

function chooseRandomPNG()
    math.randomseed(os.time())
    n = math.random(1, 4)
    assetsPathsArray =
    {
        'assets/enemies/enemyShip.png',
        'assets/enemies/meteorBig.png',
        'assets/enemies/enemyUFO.png',
        'assets/enemies/meteorSmall.png',
    }
    return assetsPathsArray[n]
end
