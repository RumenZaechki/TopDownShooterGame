Background = {}

--functions
local get_scaling

function Background:load()
    self.sprite = love.graphics.newImage("assets/background/starBackground.png")
end

function Background:draw()
    Canvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())
    imageScaleX, imageScaleY = get_scaling(self.sprite, canvas)
    love.graphics.draw(self.sprite, 0, 0, 0, imageScaleX, imageScaleY)
end

function get_scaling(drawable, canvas)
    local canvas = canvas or nil

    local drawW = drawable:getWidth()
    local drawH = drawable:getHeight()

    local canvasW = 0
    local canvasH = 0

    if canvas then
        canvasW = canvas:getWidth()
        canvasH = canvas:getHeight()
    else
        canvasW = love.graphics.getWidth()
        canvasH = love.graphics.getHeight()
    end

    local scaleX = canvasW / drawW
    local scaleY = canvasH / drawH

    return scaleX, scaleY
end
