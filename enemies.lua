require("bullets")
require("collision")

Enemies = {}

local createEnemyTimerMax = 0.4
local createEnemyTimer = createEnemyTimerMax

--functions
local create_enemy
local check_if_objects_collide
local choose_random_PNG

function Enemies:update(dt)
    create_enemy(dt)

    for i, enemy in ipairs(Enemies) do
        enemy.y = enemy.y + (enemy.speed * dt)

        --remove enemy if out of borders
        if enemy.y > love.graphics.getHeight() then
            table.remove(Enemies, i)
        end
    end

    check_if_objects_collide()
end

function Enemies:draw()
    for i = 1, #Enemies do
        currentEnemy = Enemies[i]
        love.graphics.draw(currentEnemy.sprite, currentEnemy.x, currentEnemy.y)
    end
end

function create_enemy(dt)
    --time out enemy creation
    createEnemyTimer = createEnemyTimer - (1 * dt)
    if createEnemyTimer < 0 then
        createEnemyTimer = createEnemyTimerMax

        --create enemy
        enemyX = math.random(600)
        enemyY = 0
        enemySpeed = 40
        table.insert(
            Enemies,
            {
                x = enemyX,
                y = enemyY,
                speed = enemySpeed,
                sprite = love.graphics.newImage(choose_random_PNG())
            }
        )
    end
end

function choose_random_PNG()
    math.randomseed(os.time())
    n = math.random(1, 4)
    assetsPathsArray = {
        "assets/enemies/enemyShip.png",
        "assets/enemies/meteorBig.png",
        "assets/enemies/enemyUFO.png",
        "assets/enemies/meteorSmall.png"
    }
    return assetsPathsArray[n]
end

function check_if_objects_collide()
    for i, enemy in ipairs(Enemies) do
        for j, bullet in ipairs(Bullets) do
            if
                CheckCollision(
                    enemy.x,
                    enemy.y,
                    enemy.sprite:getWidth(),
                    enemy.sprite:getHeight(),
                    bullet.x,
                    bullet.y,
                    bullet.sprite:getWidth(),
                    bullet.sprite:getHeight()
                )
             then
                table.remove(Bullets, j)
                table.remove(Enemies, i)
            end
        end
    end
end
