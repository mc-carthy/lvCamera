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
    Camera:setPosition(x, y)
    Camera:setScale(zoom, zoom)
    Camera:setRotation(rotation)
end

function love.draw()
    Camera:set()
    drawGrid(grid)
    Camera:unset()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
    if key == "w" then
        y = y - 5
    end
    if key == "s" then
        y = y + 5
    end
    if key == "a" then
        x = x - 5
    end
    if key == "d" then
        x = x + 5
    end
    if key == "q" then
        rotation = rotation + 0.05
    end
    if key == "e" then
        rotation = rotation - 0.05
    end
    if key == "z" then
        zoom = zoom + 0.05
    end
    if key == "x" then
        zoom = zoom - 0.05
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