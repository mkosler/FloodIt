local Grid = require 'src.entities.grid'
local GUI  = require 'src.ui.manager'

local play = {}

function play:init()
end

function play:enter(prev)
  self.grid = Grid(0, 0, 10, 10, 40, 40)

  local buttonX = self.grid.width + 10
  local buffer = 10
  local buttonHeight = 20
  GUI.create('Button')
    :setPosition(buttonX, (buttonHeight * 0) + (buffer * 1))
    :setDimensions(20, 20)
    :setDrawingFunction(function (self)
      love.graphics.setColor(255, 0, 0)
      love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    end)
    :setCallback(function (s) self.grid:recolor(1) end)

  GUI.create('Button')
    :setPosition(buttonX, (buttonHeight * 1) + (buffer * 2))
    :setDimensions(20, 20)
    :setDrawingFunction(function (self)
      love.graphics.setColor(0, 255, 0)
      love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    end)
    :setCallback(function (s) self.grid:recolor(2) end)

  GUI.create('Button')
    :setPosition(buttonX, (buttonHeight * 2) + (buffer * 3))
    :setDimensions(20, 20)
    :setDrawingFunction(function (self)
      love.graphics.setColor(0, 0, 255)
      love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    end)
    :setCallback(function (s) self.grid:recolor(3) end)

  GUI.create('Button')
    :setPosition(buttonX, (buttonHeight * 3) + (buffer * 4))
    :setDimensions(20, 20)
    :setDrawingFunction(function (self)
      love.graphics.setColor(255, 255, 0)
      love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    end)
    :setCallback(function (s) self.grid:recolor(4) end)

  GUI.create('Button')
    :setPosition(buttonX, (buttonHeight * 4) + (buffer * 5))
    :setDimensions(20, 20)
    :setDrawingFunction(function (self)
      love.graphics.setColor(0, 255, 255)
      love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    end)
    :setCallback(function (s) self.grid:recolor(5) end)

  GUI.create('Droplist')
    :setPosition(buttonX, (buttonHeight * 4) + (buffer * 5) + 30)
    :setDimensions(20, 20)
    :addListItem('E')
    :addListItem('M')
    :addListItem('H')
    :setSelectedItem(1)
    :setDrawingFunction(function (self)
      -- Background
      love.graphics.setColor(150, 150, 150)
      love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

      -- Outline
      love.graphics.setColor(0, 0, 0)
      love.graphics.rectangle('line', self.x, self.y, self.width, self.height)

      -- Arrow
      local offsetX = self.width  / 8
      local offsetY = self.height / 4
      love.graphics.triangle('fill',
        self.x + offsetX,
        self.y + (self.height - offsetY),
        self.x + (self.width - offsetX),
        self.y + (self.height - offsetY),
        self.x + (self.width / 2),
        self.y + self.height)

      love.graphics.printf(self.selectedItem:getText(), self.x, self.y, self.width, self.alignment)
    end)
    :setItemDrawingFunction(function (x, y)
      -- Background
      love.graphics.setColor(150, 150, 150)
      love.graphics.rectangle('fill', x, y, self.width, self.height)

      -- Outline
      love.graphics.setColor(0, 0, 0)
      love.graphics.rectangle('line', x, y, self.width, self.height)

      love.graphics.printf(self.text, x, y, self.width, self.alignment)
    end)
end

function play:draw()
  self.grid:draw()
  GUI.draw()
end

function play:mousepressed(x, y, b)
  GUI.mousepressed(x, y, b)
end

function play:mousereleased(x, y, b)
  GUI.mousereleased(x, y, b)
end

return play
