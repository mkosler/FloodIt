local Block = Class{}

function Block:init(x, y, width, height, color)
  self.x       = x
  self.y       = y
  self.width   = width
  self.height  = height
  self.color   = color
  self.marked  = false
end

function Block:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

return Block
