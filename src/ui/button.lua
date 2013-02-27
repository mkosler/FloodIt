local Defaults = require 'src.ui.defaults'
local Util     = require 'src.ui.util'
local Base     = require 'src.ui.base'

local Button = Class{ __includes = Base }

function Button:init(id)
  Base.init(self, id)
  self.callback = Defaults.Button.Callback
end

function Button:setCallback(f)
  assert(type(f) == 'function', 'F must be a function')
  self.callback = f
  return self
end

function Button:mousereleased(x, y, b)
  if b == 'l' and Util.contains(x, y, self.x, self.y, self.x + self.width, self.y + self.height) then
    self:callback()
  end
end

return Button
