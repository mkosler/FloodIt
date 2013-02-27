local _elements = {}

local _map = {
 Button   = require 'src.ui.button',
 Droplist = require 'src.ui.droplist'
}

local function _create(kind)
  local id = #_elements + 1
  _elements[id] = _map[kind](id)
  return _elements[id]
end

local function _remove(o)
  _elements[o.id] = nil
end

local function _draw()
  for _,v in ipairs(_elements) do
    if v.draw then v:draw() end
  end
end

local function _keypressed(k, c)
  for _,v in ipairs(_elements) do
    if v.keypressed then v:keypressed(k, c) end
  end
end

local function _keyreleased(k, c)
  for _,v in ipairs(_elements) do
    if v.keyreleased then v:keyreleased(k, c) end
  end
end

local function _mousepressed(x, y, b)
  for _,v in ipairs(_elements) do
    if v.mousepressed then v:mousepressed(x, y, b) end
  end
end

local function _mousereleased(x, y, b)
  for _,v in ipairs(_elements) do
    if v.mousereleased then v:mousereleased(x, y, b) end
  end
end

return {
  create        = _create,
  remove        = _remove,
  draw          = _draw,
  keypressed    = _keypressed,
  keyreleased   = _keyreleased,
  mousepressed  = _mousepressed,
  mousereleased = _mousereleased,
}
