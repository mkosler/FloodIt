return {
  Base = {
    X = 0,
    Y = 0,
    Width = 0,
    Height = 0,
    DrawingFunction = function (self) error('Currently using default drawingFunction') end,
  },
  Button = {
    Callback = function (self) error('Currently using default callback') end,
  },
  Droplist = {
    Alignment       = 'center', -- See LOVE's documentation for other alignment possibilities
    Font            = love.graphics.newFont(),
    DrawingFunction = function (self, x, y) error('Currently using default drawingFunction') end,
  },
}
