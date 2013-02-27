local Defaults = require 'src.ui.defaults'
local Util     = require 'src.ui.util'
local Base     = require 'src.ui.base'

local Item = Class{}

function Item:init(text, width, alignment, drawingFunction)
  self.text            = text
  self.width           = width
  self.alignment       = alignment
  self.drawingFunction = drawingFunction
end

function Item:getText()
  return self.text
end

function Item:draw(x, y)
  self:drawingFunction(x, y)
end

local Droplist = Class{ __includes = Base }

function Droplist:init(id)
  Base.init(self, id)

  self.itemDrawingFunction = Defaults.Base.DrawingFunction
  self.items               = {}
  self.selectedItem        = nil
  self.isOpen              = false
  self.orientation         = Util.ORIENTATION.VERTICAL
  self.alignment           = Defaults.Droplist.Alignment
end

function Droplist:addListItem(str, pos)
  pos = pos or #self.items + 1
  self.items[pos] = Item(str, self.width, self.alignment, self.itemDrawingFunction)
  return self
end

function Droplist:clearListItems()
  self.listItems = {}
  return self
end

function Droplist:setSelectedItem(index)
  assert(1 <= index and index <= #self.items, 'Index outside of items range')
  self.selectedItem = self.items[index]
  return self
end

function Droplist:setItemDrawingFunction(f)
  assert(type(f) == 'function', 'Drawing function must be a function')
  self.itemDrawingFunction = f
  return self
end

function Droplist:draw()
  -- Draw the main box
  self:drawingFunction()

  -- Draw the open list
  if self.isOpen then
    for i,v in ipairs(self.items) do
      if self.orientation == Util.ORIENTATION.VERTICAL then
        v:draw(self.x, self.y + (self.height * (i - 1)))
      elseif self.orientation == Util.ORIENTATION.HORIZONTAL then
        v:draw(self.x + (self.width * (i - 1)), self.y)
      end
    end
  end
end

function Droplist:mousepressed(x, y, b)
  if self.isOpen then
    for i,v in ipairs(self.items) do
      if self.orientation == Util.ORIENTATION.VERTICAL and
        Util.contains(x,                   y,
                      self.x,              self.y + (self.height * i),
                      self.x + self.width, self.y + (self.height * (i + 1))) then
        self:setSelectedItem(i)
      elseif self.orientation == Util.ORIENTATION.HORIZONTAL and
        Util.contains(x,                               y,
                      self.x + (self.width * i),       self.y,
                      self.x + (self.width * (i + 1)), self.y + self.height) then
        self:setSelectedItem(i)
      end
    end
  elseif Util.contains(x, y, self.x, self.y, self.x + self.width, self.y + self.height) then
    self.isOpen = true
  end
end

function Droplist:mousereleased(x, y, b)
  if not Util.contains(x, y, self.x, self.y, self.x + self.width, self.y + self.height) then
    self.isOpen = false
  end
end

return Droplist
