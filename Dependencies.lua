Dependencies = {}

require "objects.enemy"
require "objects.player"
require"objects.world"
require("utilities.util")
fonts = {
  mini = love.graphics.newFont("assets/fonts/PressStart2P.ttf", 8),
  small = love.graphics.newFont("assets/fonts/PressStart2P.ttf", 16),
  big = love.graphics.newFont("assets/fonts/PressStart2P.ttf", 32),
  huge = love.graphics.newFont("assets/fonts/PressStart2P.ttf", 50)
}
-- LIBRARIES
sti = require("libraries.sti")
wf = require("libraries.windfield")
camera = require("libraries.camera")
cam = camera()
anim8 = require("libraries.anim8")
require("libraries.simple-slider")
require("utilities.menu")
world = wf.newWorld(0, 0, true)
require("test_world")


function Dependencies:load()
  gameState = "menu"
  enemy:load()
  player:load()
  test_world:load()
  menu:load()
end


function Dependencies:update(dt)
  enemy:update(dt)
  if gameState == "playing" then
    player:update(dt)
  end
  if gameState == "playing" then
    test_world:update(dt)
  end
  menu:update(dt)

end


function Dependencies:draw()
  enemy:draw()
  if gameState == "playing" then
    player:draw()
  end
  if gameState == "playing" then
    test_world:draw()
  end
  menu:draw()
end

function Dependencies:keypressed(key, scancode, isrepeat)
  enemy:keypressed(key, scancode, isrepeat)
  if gameState == "playing" then
    player:keypressed(key, scancode, isrepeat)
  end
  menu:keypressed(key, scancode, isrepeat)
end

function Dependencies:mousepressed(x,y,button)
  enemy:mousepressed(x, y, button)
  if gameState == "playing" then
    player:mousepressed(x, y, button)
  end
  menu:mousepressed(x, y, button)
end