local cellSize = 20
local borderWidth = 2
local cellDrawSize
local grid

function love.load()
    cellDrawSize = cellSize - borderWidth
    grid = generateGrid(love.graphics.getWidth() / cellSize, love.graphics.getHeight() / cellSize)
end

function love.update(dt)

end

function love.draw()
    drawGrid(grid)
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