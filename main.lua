local cellSize = 20
local borderWidth = 2
local cellDrawSize
local grid

local x, y
local zoom = 1
local rotation = 0

function love.load()
    love.keyboard.setKeyRepeat(true)
    width = love.graphics.getWidth()
    x = width / 2
    height = love.graphics.getHeight()
    y = height / 2
    cellDrawSize = cellSize - borderWidth
    grid = generateGrid(love.graphics.getWidth() / cellSize, love.graphics.getHeight() / cellSize)
end

function love.update(dt)

end

function love.draw()
    love.graphics.translate(-x, -y)
    love.graphics.translate(width / 2, height / 2)
    love.graphics.rotate(-rotation)
    love.graphics.scale(1 / zoom, 1 / zoom)
    love.graphics.translate(-width / 2, -height / 2)
    drawGrid(grid)
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