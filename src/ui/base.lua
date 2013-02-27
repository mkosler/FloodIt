local Defaults = require 'src.ui.defaults'

local Base = Class{}
function Base:init(id)
  self.id           = id
  self.x            = Defaults.Base.x
  self.y            = Defaults.Base.y
  self.width        = Defaults.Base.Width
  self.height       = Defaults.Base.Height
  self.drawingFunction = Defaults.Base.DrawingFunction
end

function Base:draw()
  self:drawingFunction()
end

function Base:setX(x)
  assert(type(x) == 'number', 'X must be a number')
  self.x = x
  return self
end

function Base:setY(y)
  assert(type(y) == 'number', 'Y must be a number')
  self.y = y
  return self
end

function Base:setPosition(x, y)
  return self:setX(x):setY(y)
end

function Base:setWidth(width)
  assert(type(width) == 'number', 'Width must be a number')
  self.width = width
  return self
end

function Base:setHeight(height)
  assert(type(height) == 'number', 'Height must be a number')
  self.height = height
  return self
end

function Base:setDimensions(width, height)
  return self:setWidth(width):setHeight(height)
end

function Base:setDrawingFunction(f)
  assert(type(f) == 'function', 'F must be a function')
  self.drawingFunction = f
  return self
end

return Base
