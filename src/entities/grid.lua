local Block = require 'src.entities.block'

local Grid = Class{}

local COLORS = {
  { 255,   0,   0 },
  {   0, 255,   0 },
  {   0,   0, 255 },
  { 255, 255,   0 },
  {   0, 255, 255 }
}

local function recolor(matrix, color, rows, columns, r, c)
  r, c = r or 0, c or 0

  if 0 <= r and r <= rows - 1 and 0 <= c and c <= columns - 1 then
    if matrix[r][c].color == color then
      if matrix[r][c].marked then
        return
      else
        matrix[r][c].marked = true
      end
    elseif matrix[r][c].marked then
      matrix[r][c].color = color
    else
      return
    end

    recolor(matrix, color, rows, columns, r - 1, c)
    recolor(matrix, color, rows, columns, r + 1, c)
    recolor(matrix, color, rows, columns, r, c + 1)
    recolor(matrix, color, rows, columns, r, c - 1)
  end
end

local function countMarks(matrix, rows, columns)
  local count = 0
  for r = 0, rows - 1 do
    for c = 0, columns - 1 do
      if matrix[r][c].marked then count = count + 1 end
    end
  end
  return count
end

local function createMatrix(x, y, rows, columns, bw, bh)
  local matrix = {}

  for r = 0, rows - 1 do
    matrix[r] = {}
    for c = 0, columns - 1 do
      matrix[r][c] = Block(x + (c * bw), y + (r * bh), bw, bh, COLORS[math.random(#COLORS)])
    end
  end

  recolor(matrix, matrix[0][0].color, rows, columns)

  return matrix
end

--- Constructor
-- @param x Left edge of the grid
-- @param y Top edge of the grid
-- @param rows Number of rows
-- @param columns Number of columns
-- @param blockWidth Width of an individual block
-- @param blockHeight Height of an individual block
function Grid:init(x, y, rows, columns, blockWidth, blockHeight)
  self.x           = x
  self.y           = y
  self.rows        = rows
  self.columns     = columns
  self.blockWidth  = blockWidth
  self.blockHeight = blockHeight
  self.width       = columns * blockWidth
  self.height      = rows * blockHeight
  self.matrix      = createMatrix(x, y, rows, columns, blockWidth, blockHeight)
  self.finished    = false
end

--- Recolor the marked Blocks
-- @param colorNum The index of the color in the COLOR table
function Grid:recolor(colorNum)
  recolor(self.matrix, COLORS[colorNum], self.rows, self.columns)

  if countMarks(self.matrix, self.rows, self.columns) == self.rows * self.columns then
    self.finished = true
  end
end

--- Draws the grid
function Grid:draw()
  for r = 0, self.rows - 1 do
    for c = 0, self.columns - 1 do
      self.matrix[r][c]:draw()
    end
  end
end

return Grid
