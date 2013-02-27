math.randomseed(os.time())
math.random(); math.random(); math.random()

-- Libraries
GS = require 'lib.gamestate'
Class = require 'lib.class'

local Play = require 'src.states.play'

function love.load()
  GS.registerEvents()
  GS.switch(Play)
end

function love.keypressed(k, c)
  if k == 'escape' then
    love.event.quit()
  end
end
