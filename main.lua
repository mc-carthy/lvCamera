local Camera = require("src.camera")

local cellSize = 20
local borderWidth = 2
local cellDrawSize
local grid

local x, y = 0, 0
local zoom = 1
local rotation = 0

function love.load()
    love.keyboard.setKeyRepeat(true)
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    cellDrawSize = cellSize - borderWidth
    grid = generateGrid(love.graphics.getWidth() / cellSize, love.graphics.getHeight() / cellSize)
end

function love.update(dt)
    checkKeyboardInput(dt)
    Camera:setPosition(x, y)
    Camera:setScale(zoom, zoom)
    Camera:setRotation(rotation)
    mouseX, mouseY = Camera:mouseWorldPosition()
end

function love.draw()
    love.graphics.setBackgroundColor(215, 215, 215, 255)
    Camera:set()
    drawGrid(grid)
    Camera:unset()
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.print('Mouse position: ' .. mouseX .. '-' .. mouseY)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function generateGrid(xSize, ySize)
    local grid = {}
    grid.xSize = xSize
    grid.ySize = ySize
    for x = 1, grid.xSize do
        grid[x] = {}
        for y = 1, grid.ySize do
            grid[x][y] = {}
        end
    end
    return grid
end

function drawGrid(grid)
    for x = 1, grid.xSize do
        for y = 1, grid.ySize do
            love.graphics.setColor(127, 127, 127)
            love.graphics.rectangle('fill', (x - 1) * cellSize, (y - 1) * cellSize, cellDrawSize, cellDrawSize)
        end
    end
end

function checkKeyboardInput(dt)
    tempX, tempY = 0, 0

    if love.keyboard.isDown("w") then
        tempY = tempY - Camera.panSpeed * dt
    end

    if love.keyboard.isDown("s") then
        tempY = tempY + Camera.panSpeed * dt
    end
    
    if love.keyboard.isDown("a") then
        tempX = tempX - Camera.panSpeed * dt
    end

    if love.keyboard.isDown("d") then
        tempX = tempX + Camera.panSpeed * dt
    end

    x = x + tempX
    y = y + tempY

    if love.keyboard.isDown("q") then
        rotation = rotation + Camera.rotateSpeed * dt
    end
    if love.keyboard.isDown("e") then
        rotation = rotation - Camera.rotateSpeed * dt
    end
    if love.keyboard.isDown("z") then
        zoom = zoom + Camera.zoomSpeed * dt
    end
    if love.keyboard.isDown("x") then
        zoom = zoom - Camera.zoomSpeed * dt
    end
end